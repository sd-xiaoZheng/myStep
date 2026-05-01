

4. 公网部署安全检查清单 (2026-05-01 安全审查结论)
   以下问题需要在公网部署前处理，按优先级排列：

   严重 - 必须修复:
    - 注册验证码绕过: LoginController.register() line 135 Result.failed() 没有 return，验证码校验失败后代码继续执行到 line 158 return Result.success()，导致任意注册。修复: 把 Result.failed() 改为 return Result.failed()
    - Fastjson 1.2.83 存在已知 RCE 漏洞 (CVE-2022-25845)，必须升级到最新版或替换为 jackson（项目已引入 jackson，可直接替换）
    - Gateway 也用了 Fastjson 1.2.72，同样需要替换
    - WebSocketService 导入了 fastjson2，需统一替换
    - 所有硬编码密钥必须移到环境变量或外部化配置: JWT 盐值(JwtUtils.java:16)、QQ邮箱密码(application.yml:24)、邮箱用户名(application.yml:23)
    - 文件上传无类型校验(FileUtils.java): 可上传任意后缀文件(.jsp/.exe等)，加上文件路径直接映射为静态资源(/step/Zaohu/**)，可被直接访问执行。修复: 严格校验文件类型白名单(只允许图片扩展名)，校验文件 magic bytes
    - JWT Filter line 38: token.split(“ “)[1] 如果 Authorization header 不含空格会抛 ArrayIndexOutOfBoundsException 导致 500。需先校验格式(必须以”Bearer “开头)

   高危 - 强烈建议:
    - /step/article/** 完全公开(permitAll)，任何人无需登录即可增删改查日记。建议只开放 GET 读，增删改需认证
    - WebSocket /MyStep/ws/** 无任何认证，任何人可连接。建议在 onOpen 中校验 token
    - 登录接口无频率限制，存在暴力破解风险。建议对 /step/login 加 Redis 计数限流(如 5次/分钟/IP)
    - 邮件发送接口 /step/sendCodeEmail 和 /step/sendForgetPwdEmail 无频率限制，可被短信/邮件轰炸。建议加限流和图形验证码
    - Spring Boot Actuator 已引入依赖但未限制访问，确认生产环境关闭或只允许内网访问
    - JWT 载荷只存了手机号(iss claim)，未存 userId，每次需查 Redis。过期时间 7 天偏长，建议缩短
    - Swagger 依赖已引入，公网环境应关闭或加认证，否则 API 结构完全暴露

   中危:
    - spring-boot-starter-websocket 版本 2.3.5.RELEASE 过旧(2020年)，存在已知漏洞，应升级对齐 Boot 3.2.4
    - spring-boot-starter-test 版本 2.3.5.RELEASE 同样过旧(父POM中)
    - 部署时必须启用 HTTPS，当前无 SSL 配置
    - Nacos 需开启认证，否则配置中心直接暴露
    - Gateway MyGlobalFilter 将请求参数(getRawQuery)写入 Redis，若 token 通过 URL 传递会泄露
    - 所有用户输入(nickname/content/title等)未做 XSS 过滤，存储型 XSS 风险
    - BCryptPasswordEncoder 已使用(密码安全 OK)，但使用无盐 BCrypt 即可
    - Redis 未配置密码认证(从配置文件看)，公网部署必须设置密码
    - PostgreSQL 数据库连接配置在 Nacos 中，需确认密码强度和非默认端口

   低危/建议:
    - 日志中不要打印敏感信息，LoginController line 105 log.error(e.getMessage(), e) 可能在认证异常时泄露信息
    - FileUtils 文件路径 D:/step/file/image/ 是 Windows 硬路径，部署 Linux 服务器需修改
    - CSRF 已禁用(无状态JWT场景可接受)，但需确认前端不使用 cookie 存 token
    - 可以考虑给所有公开写接口加上幂等性校验，防止重复提交
我审查了项目的认证、授权、文件上传、依赖安全、配置安全、输入验证等方面，发现 18 个需要处理的问题，按优先级汇总如下： t
严重 - 必须修复 (4项)

┌────────────────────────────────────────────────────────────────────────────────┬────────────────────────────────┐
│ 问题 │ 位置 │
├────────────────────────────────────────────────────────────────────────────────┼────────────────────────────────┤
│ 注册验证码绕过 — Result.failed() 没有 return，验证码校验失败后代码继续执行到 │ LoginController.java:135 │
│ return Result.success()，可以无验证码注册 │ │
├────────────────────────────────────────────────────────────────────────────────┼────────────────────────────────┤
│ Fastjson RCE 漏洞 — 1.2.83 存在已知反序列化 RCE (CVE-2022-25845)，gateway 还有 │ pom.xml step/gateway, │
│ 1.2.72，WebSocket 导入了 fastjson2。项目已有 jackson，可直接替换 │ WebSocketService.java │
├────────────────────────────────────────────────────────────────────────────────┼────────────────────────────────┤
│ 密钥硬编码 — JWT 盐值、QQ 邮箱密码/用户名全部明文写在代码里，git push │ JwtUtils.java:16, │
│ 到公网=密钥泄露 │ application.yml:23-24 │
├────────────────────────────────────────────────────────────────────────────────┼────────────────────────────────┤
│ 文件上传无校验 — 任意后缀文件可上传，且上传目录直接映射为静态资源 │ FileUtils.java:36, │
│ /step/Zaohu/**，上传 .jsp/.html 可被执行 │ WebConfig.java:30 │
└────────────────────────────────────────────────────────────────────────────────┴────────────────────────────────┘

高危 (5项)

- /step/article/** 完全公开，任何人无需登录即可增删改查日记
- WebSocket /MyStep/ws/** 无认证，任何人可连接
- 登录接口无频率限制，可暴力破解
- 邮件发送接口无频率限制，可被轰炸
- JWT Filter token.split(" ")[1] 未校验格式，恶意请求可触发 500

中危 (6项) + 低危 (3项)

详见 CLAUDE.md 中的完整清单，包括 HTTPS 缺失、Nacos 认证、Redis 密码、XSS 过滤、依赖版本过旧等问题。

  ---
最紧急修的是注册验证码绕过 — 这是一个一行代码的 bug（缺一个 return），但影响很大。其他问题你打算按什么优先级来推进？

✻ Churned for 6m 2s