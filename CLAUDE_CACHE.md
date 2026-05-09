

## JDK 25 升级后项目审查报告 (2026-05-10)

### 升级概况
- 父POM: Spring Boot 4.0.0 + Spring Cloud 2025.1.0 + Spring Cloud Alibaba 2025.1.0.0
- JDK: 25, Lombok: 1.18.42
- MyBatis Plus: 3.5.16, Fastjson: 2.0.61
- 项目已能跑起来，基础升级完成

---

### 一、安全问题（沿用 2026-05-01 安全审查，标注处理状态）

#### 已修复
- 注册验证码绕过: LoginController.register() 已修复，所有分支都有return
- Fastjson: 已升级到 2.0.61，RCE漏洞已消除
- JWT Filter: 已增加 `startsWith("Bearer ")` 校验
- 登录频率限制: 已添加 LoginRateLimitInterceptor (Bucket4j)
- /step/article/** 公开访问: 已注释掉，不再完全公开

#### 仍未修复
- JWT盐值硬编码: JwtUtils.java:16 `Algorithm.HMAC256("随意加点东西->3331247124")` 需移到环境变量
- QQ邮箱密码硬编码: application.yml:34 `fqoosoqrseukcjgh` 需移到环境变量
- QQ邮箱用户名硬编码: application.yml:33 `3331247124@qq.com` 需移到环境变量
- WebSocket /MyStep/ws/** 无认证: WebSocketService.onOpen() 无token校验
- 文件上传: 已引入tika-core依赖，需确认FileUtils中是否实际使用magic bytes校验
- 邮件发送接口无频率限制: sendCodeEmail / sendForgetPwdEmail 未加限流
- 公网部署: Redis无密码、Nacos需认证、HTTPS缺失

---

### 二、JDK 25 特性优化（按优先级排列）

#### 高优先级

**1. 虚拟线程 (Virtual Threads) — JEP 444 正式特性**

当前状态: 全项目0处使用，所有线程池均使用平台线程(ThreadPoolExecutor)

可优化位置:

预期收益: 去掉平台线程池的复杂配置(核心线程数/最大线程数/队列/拒绝策略)，代码更简洁，高并发IO场景吞吐量成倍提升

**2. java.util.Date / SimpleDateFormat → java.time 迁移**

当前问题:
- `JwtUtils.java`: `new Date(System.currentTimeMillis()+expiresTime)` → 用 `Instant.now().plusMillis(expiresTime)`
- `MyGlobalFilter.java:49`: `new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())` → 用 `LocalDateTime.now().format(DateTimeFormatter)`
- `DateUtils.java`: 整个类大量使用 SimpleDateFormat(非线程安全) 和 java.util.Date，建议全面迁移到 java.time
- `EmailUtil.java`, `BaseController.java`, `MsgWall.java` 等多处使用 java.util.Date

**3. javax → jakarta 命名空间迁移**

JDK 25 + Spring Boot 4.0 要求完全迁移到 Jakarta EE:
- `application.yml:44`: `javax.net.ssl.SSLSocketFactory` → 去除或改为 Jakarta 兼容配置

#### 中优先级

**5. 结构化并发 (Structured Concurrency) — JEP 480 预览特性**

可优化位置:
- `PhotoTypeServiceImpl.processAndBuildPhoto()`: 照片EXIF信息提取 + 图片上传可并行执行
- `PhotoTypeServiceImpl.addPhotoBatch()`: 批量照片处理可并发，当前是for循环串行
- `ArticleController`: 日记保存时，ES索引写入 + 数据库写入可并行

使用方式: `StructuredTaskScope.fork()` 创建子任务，`scope.join()` 等待全部完成

**6. Record 类型替换**

适合改造为record的类:
- `LoginUserDetails.java`: 不可变用户详情，天然适合record
- `IpRegion.java`: IP解析结果，纯数据载体
- `StorageDTO.java`: 存储DTO
- `PhotoBatch.java`, `PhotoNew.java`: 数据传输对象
- `ResultEnum.java` 中的枚举项可以考虑

**7. Thread.sleep(500) 阻塞问题**

`LoginController.java:91`: 密码错误时 `Thread.sleep(500)` 阻塞平台线程500ms
- 如果是虚拟线程则无影响，但当前是平台线程

#### 低优先级

**8. Pattern Matching 模式匹配**

可用switch模式匹配的位置:
- `WebSocketService.onMessage()`: switch-case可根据type匹配并解构JSONObject
- 各Controller中的类型判断和转换

**9. Sequenced Collections**

JDK 21+ 引入，可简化:
- 多处List/Set的首尾操作

**10. String Templates (JDK 25 正式特性)**

可替换位置:
- `PhotoTypeServiceImpl`: 路径拼接 `Constant.FILE_PATH + year + Constant.PHOTO_PATH + month + "/" + fileName`
- 各处的字符串拼接和StringBuilder使用

---

### 三、代码质量问题

#### Bug
1. **ThreadPoolUtils (step模块) KEEP_ALIVE_SECONDS = 30000000000L, TimeUnit被注释为null**: 这相当于约347天的keep-alive，且传入null会导致线程池行为异常

#### 代码重复
3. **ThreadPoolUtils**: step和gateway模块各有一份完全重复的代码，应抽取到MyStep-common
4. **MyThreadFactory**: 同上，两份重复代码，且未设置线程名和daemon状态

#### 未完成/空实现
5. **VisitorTask.java**: 完全空实现(只有注释"异步redis2mysql")，且Gateway实际通过定时任务Redis2Mysql同步
6. **chat2Ai()**: WebSocketService中定义但未被调用的方法

#### 架构问题
7. **Gateway引入了MyBatis Plus + PostgreSQL依赖**: Gateway作为网关不应有数据库依赖，直接操作数据库破坏了微服务边界
8. **Auth模块使用独立的Spring Boot 3.5.6父POM**: 与主项目Spring Boot 4.0不一致，且该模块未在主POM的modules中启用
9. **WebSocketService**: 使用 `System.out.println` 而非日志框架输出

---

### 四、优化实施建议顺序

```
第1批 (安全优先):
  - 密钥外部化 (JWT盐值 + 邮箱密码)
  - WebSocket认证
  - 邮件接口限流
  - fastjson import统一
  - javax→jakarta import统一

第2批 (虚拟线程):
  - ThreadPoolUtils 替换为虚拟线程
  - RocketMQ Consumer使用虚拟线程
  - 删除重复的ThreadPoolUtils代码

第3批 (现代化):
  - Date/SimpleDateFormat → java.time
  - Record类型改造
  - KEEP_ALIVE_SECONDS bug修复 + pom重复依赖清理

第4批 (按需):
  - 结构化并发
  - Pattern Matching
  - String Templates
```
