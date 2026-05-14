# MyStep - 我的成长足迹记录系统

<div align="center">

**记录我的成长和耕耘的脚步**

[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.4-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Spring Cloud Alibaba](https://img.shields.io/badge/Spring%20Cloud%20Alibaba-2023.0.1.0-blue.svg)](https://spring.io/projects/spring-cloud-alibaba)
[![Vue](https://img.shields.io/badge/Vue-2.6.14-green.svg)](https://vuejs.org/)
[![JDK](https://img.shields.io/badge/JDK-21-orange.svg)](https://www.oracle.com/java/technologies/javase-downloads.html)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-17-blue.svg)](https://www.postgresql.org/)

</div>

## 📖 项目简介

MyStep 是一个基于 Spring Cloud 微服务架构的个人成长记录系统，旨在帮助用户记录生活点滴、管理个人相册、撰写日记、留言互动等。项目采用前后端分离架构，后端使用 Spring Cloud Alibaba 微服务体系，前端使用 Vue2 + Element UI 构建。

**项目初衷**：我很热爱我的工作，我的梦想是可以为编程行业贡献自己的一份力量。在每一个下班的晚上我就会把我脑袋里的小知识一点点积累到这里。

## ✨ 核心功能

### 🎯 已实现功能

#### 1. 用户认证与权限管理
- **用户注册/登录**：支持邮箱验证码注册，JWT Token 认证
- **忘记密码**：通过邮箱验证码重置密码
- **权限控制**：基于 Spring Security 的 RBAC 权限体系
- **角色管理**：支持用户-角色-权限三级关联

#### 2. 日记模块 📝
- **日记编辑**：支持富文本编辑，可添加多张图片
- **日记分类**：按类型（日记/记忆/阶段总结/畅想）分类管理
- **标签系统**：支持为日记添加多个标签，便于检索
- **心情天气**：记录写作时的心情和天气状态
- **日记列表**：支持分页查询、条件筛选
- **日记管理**：支持编辑、删除、收藏日记
- **Elasticsearch 集成**：日记内容存储在 ES 中，支持全文检索（开发中）

#### 3. 生命瞬间（相册模块）📷
- **相册分类**：创建不同主题的相册类型
- **批量上传**：支持批量上传照片
- **照片管理**：
  - 自动提取照片 EXIF 信息（拍摄时间、地点、设备、海拔等）
  - 图片自动转 WebP 格式并生成缩略图，减少流量消耗
  - 支持照片收藏、编辑、删除
  - 照片按类型分组展示
- **短语记录**：为每张照片添加心情短语
- **异步处理**：使用 RocketMQ 异步处理图片转换任务

#### 4. 留言板模块 💬
- **匿名留言**：支持访客留言，可自定义昵称和头像
- **拖拽交互**：留言卡片支持拖拽移动，模拟便签墙效果
- **IP 地址解析**：自动解析留言者 IP 归属地
- **随机布局**：留言卡片随机位置和旋转角度，增加趣味性

#### 5. 工具箱功能 🛠️
- **百度贴吧爬虫**：使用 WebMagic 爬取百度贴吧标题并入库
- **Redis 测试**：Redis 缓存功能测试接口
- **WebSocket 测试**：实时通信功能测试
- **贪吃蛇游戏**：内置小游戏
- **商品购买**：集成 Seata 分布式事务的购买流程演示

#### 6. 系统监控与统计 📊
- **访问记录**：
  - 网关全局过滤器记录每次接口访问
  - 记录访问路径、耗时、IP 地址、运营商信息
  - 访问数据先存 Redis，定时任务批量持久化到数据库
- **访问统计**：实时统计系统访问次数
- **IP 地址解析**：使用 ip2region 离线库解析 IP 归属地

#### 7. 代码生成器 🔧
- **MyBatis Plus 代码生成**：自动生成 Entity、Mapper、Service、Controller 代码
- **自定义模板**：支持自定义代码生成模板

### 🚀 计划中的功能


#### 近期计划
- [ ] **系统日志模块**：完善操作日志记录
- [ ] **服务拆分**：将相册模块独立为单独的微服务
- [ ] **头像回显**：优化头像显示逻辑
- [ ] **智能回复**：用户操作后的随机鼓励性回复
- [ ] **笔记模块**：支持 Markdown 笔记编辑
- [ ] **更新日志**：系统更新时间线展示

#### 中期计划
- [ ] **XXL-Job 集成**：分布式任务调度
- [ ] **二维码生成**：支持生成各类二维码
- [ ] **视频模块**：视频上传与播放
- [ ] **IOT 物联网**：对接 MQTT 协议
- [ ] **手机端适配**：移动端 H5 页面
- [ ] **人生愿望墙**：记录和追踪个人愿望

#### 长期计划
- [ ] **语音识别**：语音转文字功能
- [ ] **Jenkins 自动化部署**：CI/CD 流程
- [ ] **Jar 包瘦身**：优化依赖，减小部署包体积
- [ ] **大数据集成**：Hadoop、Flink 数据处理
- [ ] **Dubbo 服务化**：进一步服务拆分
- [ ] **文件分片传输**：大文件上传优化
- [ ] **OSS 对象存储**：接入阿里云/腾讯云 OSS
- [ ] **Elasticsearch 深度应用**：全文检索优化
- [ ] **测试用例**：完善单元测试和集成测试

## 🏗️ 技术架构

### 后端技术栈

| 技术 | 版本 | 说明 |
|------|------|------|
| JDK | 25 | Java 开发工具包 |
| Spring Boot | 3.2.4 | 基础框架 |
| Spring Cloud | 2023.0.1 | 微服务框架 |
| Spring Cloud Alibaba | 2023.0.1.0 | 微服务组件 |
| Spring Security | 3.2.4 | 安全框架 |
| MyBatis Plus | 3.0.3 | ORM 框架 |
| PostgreSQL | 17 | 关系型数据库 |
| Redis | - | 缓存数据库 |
| RocketMQ | - | 消息队列 |
| Nacos | - | 服务注册与配置中心 |
| Sentinel | - | 流量控制与熔断降级 |
| Seata | - | 分布式事务 |
| SkyWalking | - | 链路追踪 |
| Elasticsearch | - | 搜索引擎（开发中） |
| WebMagic | - | 爬虫框架 |
| Hutool | - | Java 工具类库 |
| JWT | - | Token 认证 |
| ip2region | - | IP 地址解析 |

### 前端技术栈

| 技术 | 版本 | 说明 |
|------|------|------|
| Vue | 2.6.14 | 渐进式 JavaScript 框架 |
| Vue Router | 3.1.3 | 路由管理 |
| Vuex | 3.1.0 | 状态管理 |
| Element UI | 2.15.14 | UI 组件库 |
| Axios | 1.7.7 | HTTP 客户端 |
| Less | 3.0.4 | CSS 预处理器 |
| js-cookie | 3.0.5 | Cookie 操作库 |

### 微服务架构

```
MyStep
├── MyStep-gateway      # 网关服务（端口：18888）
│   ├── 全局过滤器：记录访问日志
│   ├── 路由转发
│   └── 定时任务：持久化访问记录
├── MyStep-auth         # 认证服务（开发中）
│   └── 统一认证中心
├── MyStep-step         # 核心业务服务（端口：8001）
│   ├── 用户模块
│   ├── 日记模块
│   ├── 相册模块
│   ├── 留言板模块
│   ├── 标签/类型/心情/天气管理
│   └── 爬虫模块
└── MyStep-common       # 公共模块
    ├── 统一返回结果
    ├── 业务异常处理
    └── 公共工具类
```

## 📦 项目结构

### 后端结构

```
MyStep/
├── MyStep_ZaoHu/
│   ├── config/                    # 配置文件
│   │   └── sql/                   # 数据库初始化脚本
│   ├── MyStep-gateway/            # 网关服务
│   │   ├── filter/                # 全局过滤器
│   │   ├── jobs/                  # 定时任务
│   │   └── config/                # 配置类
│   ├── MyStep-auth/               # 认证服务
│   ├── MyStep-step/               # 核心业务服务
│   │   ├── modules/               # 业务模块
│   │   │   ├── article/           # 日记模块
│   │   │   ├── photo/             # 照片模块
│   │   │   ├── photoType/         # 相册类型模块
│   │   │   ├── msgWall/           # 留言墙模块
│   │   │   ├── userLogin/         # 用户登录模块
│   │   │   ├── tag/               # 标签模块
│   │   │   ├── type/              # 类型模块
│   │   │   ├── mood/              # 心情模块
│   │   │   ├── weather/           # 天气模块
│   │   │   ├── webBug/            # 爬虫模块
│   │   │   ├── shop/              # 商城模块
│   │   │   ├── accessRecord/      # 访问记录模块
│   │   │   └── visitNum/          # 访问统计模块
│   │   ├── security/              # 安全配置
│   │   ├── jobs/                  # 定时任务
│   │   ├── utils/                 # 工具类
│   │   ├── config/                # 配置类
│   │   └── resources/
│   │       ├── mapper/            # MyBatis XML
│   │       └── application.yml    # 配置文件
│   └── MyStep-common/             # 公共模块
│       ├── Result.java            # 统一返回结果
│       ├── BusinessException.java # 业务异常
│       └── ResultEnum.java        # 结果枚举
└── pom.xml                        # Maven 父 POM
```

### 前端结构

```
MyStep-ui/
├── public/                        # 静态资源
│   ├── assets/                    # 公共资源
│   ├── css/                       # 样式文件
│   ├── js/                        # JS 文件
│   └── index.html                 # 入口 HTML
├── src/
│   ├── apis/                      # API 接口
│   │   ├── api/                   # 接口定义
│   │   │   ├── article.js         # 日记接口
│   │   │   ├── diary.js           # 日记接口
│   │   │   ├── lifeTimeManage.js  # 相册管理接口
│   │   │   ├── lifeTimePhoto.js   # 照片接口
│   │   │   ├── msgWall.js         # 留言墙接口
│   │   │   ├── login.js           # 登录接口
│   │   │   ├── mood.js            # 心情接口
│   │   │   ├── tag.js             # 标签接口
│   │   │   ├── type.js            # 类型接口
│   │   │   ├── weather.js         # 天气接口
│   │   │   ├── bug.js             # 爬虫接口
│   │   │   └── shop.js            # 商城接口
│   │   └── request.js             # Axios 封装
│   ├── assets/                    # 资源文件
│   │   ├── gif/                   # GIF 动图
│   │   ├── icon/                  # 图标
│   │   ├── image/                 # 图片
│   │   ├── mp4/                   # 视频
│   │   └── styles/                # 样式
│   ├── router/                    # 路由配置
│   │   └── index.js               # 路由定义
│   ├── utils/                     # 工具类
│   │   ├── auth.js                # 认证工具
│   │   └── GridAnimation.js       # 动画工具
│   ├── views/                     # 页面组件
│   │   ├── login.vue              # 登录页
│   │   ├── menu.vue               # 主菜单
│   │   ├── fun/                   # 功能页面
│   │   │   ├── home.vue           # 首页
│   │   │   ├── apiTest.vue        # API 测试
│   │   │   ├── redisTest.vue      # Redis 测试
│   │   │   ├── webSocket.vue      # WebSocket 测试
│   │   │   ├── webBugTest.vue     # 爬虫测试
│   │   │   ├── shop.vue           # 商城
│   │   │   └── snake.vue          # 贪吃蛇游戏
│   │   ├── step/                  # 核心功能
│   │   │   ├── board/             # 留言板
│   │   │   │   └── messageBoard.vue
│   │   │   ├── diary/             # 日记
│   │   │   │   ├── diaryHome.vue  # 日记首页
│   │   │   │   ├── diaryCreate.vue # 日记编辑
│   │   │   │   ├── diaryList.vue  # 日记列表
│   │   │   │   └── manage/        # 日记管理
│   │   │   └── lifeTime/          # 生命瞬间
│   │   │       ├── lifeTimeType.vue    # 相册类型
│   │   │       ├── lifeTimeManage.vue  # 相册管理
│   │   │       └── lifeTimePhoto.vue   # 照片展示
│   │   └── manage/                # 后台管理
│   │       ├── typeManage.vue     # 类型管理
│   │       ├── moodManage.vue     # 心情管理
│   │       ├── weatherManage.vue  # 天气管理
│   │       └── tagManage.vue      # 标签管理
│   ├── App.vue                    # 根组件
│   └── main.js                    # 入口文件
├── babel.config.js                # Babel 配置
├── vue.config.js                  # Vue CLI 配置
└── package.json                   # 依赖配置
```

## 🚀 快速开始

### 环境要求

- JDK 21+
- Maven 3.6+
- Node.js 14+
- PostgreSQL 17+
- Redis 5+
- RocketMQ 4.9+
- Nacos 2.0+

### 后端启动

1. **克隆项目**
```bash
git clone https://gitee.com/zheng-work4j/MyStep.git
cd MyStep
```

2. **配置 Nacos**
   - 启动 Nacos Server
   - 在 Nacos 中创建以下配置：
     - `MyStep-gateway.yml`：网关配置
     - `MyStep-step.yml`：业务服务配置
     - `db-common.yml`：数据库配置
     - `nacos-discovery.yml`：服务发现配置

3. **初始化数据库**
```bash
# 使用 PostgreSQL 执行 SQL 脚本
psql -U postgres -d mystep -f doc/sql/public260402.sql
```

4. **启动中间件**
```bash
# 启动 Redis
redis-server

# 启动 RocketMQ NameServer
mqnamesrv.cmd

# 启动 RocketMQ Broker
mqbroker.cmd -c ../config/broker.conf
```

5. **启动微服务**
```bash
# 启动网关
cd MyStep/MyStep_ZaoHu/MyStep-gateway
mvn spring-boot:run

# 启动核心服务
cd MyStep/MyStep_ZaoHu/MyStep-step
mvn spring-boot:run
```

### 前端启动

1. **安装依赖**
```bash
cd MyStep-ui
npm install
```

2. **启动开发服务器**
```bash
npm run serve
```

3. **访问应用**
```
http://localhost:8080
```

### 默认账号

- 用户名：请先注册
- 邮箱验证码：通过 QQ 邮箱发送

## 📝 核心功能详解

### 1. 日记模块

**功能特点**：
- 支持富文本编辑，可插入多张图片
- 记录写作时间和回忆时间
- 关联心情、天气、类型、标签
- 自动记录作者信息和 IP 归属地
- 图片自动转 WebP 格式并压缩
- 支持日记编辑、删除、收藏
- Elasticsearch 全文检索（开发中）

**技术实现**：
- 使用 MyBatis Plus 进行数据库操作
- 图片上传使用 MultipartFile 处理
- 标签关联使用中间表 `tag_relation`
- 日记内容同步存储到 Elasticsearch

### 2. 生命瞬间（相册）

**功能特点**：
- 相册分类管理
- 批量上传照片
- 自动提取照片 EXIF 信息（拍摄时间、地点、设备、海拔）
- 图片自动转 WebP 格式并生成缩略图
- 照片收藏、编辑、删除
- 为照片添加心情短语

**技术实现**：
- 使用 `metadata-extractor` 库提取照片 EXIF 信息
- RocketMQ 异步处理图片转换任务
- 原图保存在 `temp` 目录，转换后保存在按年月分类的目录
- 使用 ReentrantLock 保证照片数量统计的线程安全

### 3. 留言板

**功能特点**：
- 匿名留言，可自定义昵称和头像
- 留言卡片支持拖拽移动
- 随机位置和旋转角度
- 自动解析 IP 归属地
- 多种颜色主题的便签样式

**技术实现**：
- 前端使用 HTML5 Drag and Drop API
- 后端使用 ip2region 离线库解析 IP
- 头像从预设图标库中随机选择
- 留言数据存储在 PostgreSQL

### 4. 访问记录与统计

**功能特点**：
- 记录每次接口访问的详细信息
- 统计访问次数
- 解析 IP 归属地和运营商
- 定时任务批量持久化

**技术实现**：
- 网关全局过滤器拦截所有请求
- 访问信息先存 Redis List
- 定时任务每隔一段时间批量写入数据库
- 使用 ip2region 离线库解析 IP

### 5. 百度贴吧爬虫

**功能特点**：
- 爬取指定贴吧的帖子标题
- 支持分页爬取
- 数据入库存储
- 支持清空数据库

**技术实现**：
- 使用 WebMagic 爬虫框架
- 自定义 PageProcessor 处理页面
- 数据存储在 PostgreSQL

## 🔧 配置说明

### Nacos 配置

**db-common.yml**（数据库配置）：
```yaml
spring:
  datasource:
    driver-class-name: org.postgresql.Driver
    url: jdbc:postgresql://localhost:5432/mystep
    username: postgres
    password: your_password
  main:
    allow-bean-definition-overriding: true

mybatis:
  configuration:
    map-underscore-to-camel-case: true
```

**nacos-discovery.yml**（服务发现配置）：
```yaml
spring:
  cloud:
    nacos:
      discovery:
        server-addr: localhost:8848
```

### RocketMQ 配置

**broker.conf**：
```properties
# 允许自动创建 topic
autoCreateTopicEnable=true
# NameServer 地址
namesrvAddr=localhost:9876
```

### 邮件配置

在 `MyStep-step` 的 `application.yml` 中配置：
```yaml
spring:
  mail:
    host: smtp.qq.com
    port: 465
    username: your_email@qq.com
    password: your_auth_code  # QQ 邮箱授权码
    protocol: smtp
    properties:
      mail:
        smtp:
          ssl:
            enable: true
```

## 🎨 界面展示

### 日记首页
- 快速新建日记
- 今日待办事项
- 本月统计数据
- 日记模块分类
- 最新日记列表

### 生命瞬间
- 相册类型卡片展示
- 照片瀑布流布局
- 照片详情弹窗
- 照片管理功能

### 留言板
- 便签墙效果
- 可拖拽的留言卡片
- 随机颜色和角度
- 匿名留言功能

## 🐛 常见问题

### 1. SkyWalking 探针配置

在 IDEA 启动参数中添加：
```
-javaagent:D:\devTools\skywalking\skywalking-agent\skywalking-agent.jar
-DSW_AGENT_NAME=MyStep-step
-DSW_AGENT_COLLECTOR_BACKEND_SERVICES=127.0.0.1:11800
```

### 2. JDK 21 控制台乱码

在 VM 参数中添加：
```
-Dstdout.encoding=UTF-8
-Dstderr.encoding=UTF-8
```

### 3. RocketMQ 编译问题

如果遇到 `yarn install` 报错，删除 pom.xml 中的以下插件：
- `frontend-maven-plugin`
- `maven-antrun-plugin`

### 4. RocketMQ 与 JDK 21 兼容性

RocketMQ 部分版本与 JDK 21 不兼容，建议使用 JDK 17 或等待 RocketMQ 更新。

## 📊 数据库设计

### 核心表结构

| 表名 | 说明 |
|------|------|
| user | 用户表 |
| role | 角色表 |
| permission | 权限表 |
| user_role | 用户角色关联表 |
| role_permission | 角色权限关联表 |
| article | 文章/日记表 |
| tag | 标签表 |
| tag_relation | 标签关联表 |
| type | 类型表 |
| mood | 心情表 |
| weather | 天气表 |
| photo_type | 相册类型表 |
| photo | 照片表 |
| msg_wall | 留言墙表 |
| access_record | 访问记录表 |
| visit_num | 访问统计表 |
| fun_question | 爬虫问题表 |
| todo | 待办事项表 |




## 📄 开源协议

本项目遵循 MIT 开源协议。

## 👨‍💻 作者

**Zaohu (郑)**

- Gitee: [@zheng-work4j](https://gitee.com/zheng-work4j)
- Email: 3331247124@qq.com

## 🙏 致谢

感谢所有为开源社区做出贡献的开发者！

---

<div align="center">

欢迎各位前辈指正错误，提出宝贵意见！
**如果这个项目对你有帮助，请给个 ⭐️ Star 支持一下！**

</div>
