# MyStrp
# 记录我的成长和耕耘的脚步


#### 项目介绍
我很热爱我的工作，我的梦想是可以为编程行业贡献自己的一份力量。</br>
在每一个下班的晚上我就会把我脑袋里的小知识一点点积累到这里。</br>
感谢您的拉取，欢迎各位前辈指正错误

#### 软件架构
软件架构说明
前端：
- HTML+CSS
- Vue2
- elementUI

后端：
- JDK21
- SpringCloudAlibaba {version:2023.0.1.0}
- SpringBoot {version:3.2.4}
- Redis
- Mysql
- MybatisPlus
- RocketMQ
- 

#### 小功能：
1. 通过webMagic实现爬取百度贴吧发言标题并入库
2. 通过网关记录访问次数和访问接口、ip、并解析ip地址一齐写入Redis，通过定时任务持久化到数据库
3. 全局异常捕获

#### 安装教程

1. rocketmq win启动：
   这里是单机部署的，打开rocketmq的bin目录里面有

   1. mqnamesrv.cmd他执行了runserver.cmd，所以修改jvm参数如内存大小等是在runserver.cmd里面修改

   2. 他执行了runborker.cmd，所以修改jvm参数也是在runborker.cmd中修改,还需要配置borker的config参数，文件在rocketmq/config/broker.conf
      添加两项：

      ``` yaml
      #允许自动创建topic
      autoCreateTopicEnable=true
      #添加nameserver地址
      namesrvAddr=localhost:9876
      ```

      执行mqbroker.cmd -c ../config/broker.conf &启动
2.  xxxx
3.  xxxx

#### 使用说明

1.  项目结构整体是一个SpringCloud项目，需要启动很多中间件：Redis、Seata、Nacos、sentinel、skywalking、RocketMQ
2.  xxxx
3.  xxxx

#### 参与贡献
Gitee--->@zheng-work4j（我）





## 可能发生的问题记录：
#### 1. 探针设置,设置为启动参数，便于链路追踪
-javaagent:D:\devTools\skywalking\skywalking-agent\skywalking-agent.jar
-DSW_AGENT_NAME=微服务名字
-DSW_AGENT_COLLECTOR_BACKEND_SERVICES=127.0.0.1:11800

#### 2. 程序中sout有乱码问题，是JDK21的问题，在项目启动的VM参数中添加这个来解决：
```text
-Dstdout.encoding=UTF-8
-Dstderr.encoding=UTF-8
```


#### 3. rocketMQ报错:yarn install报错
删除pom文件中 frontend-maven-plugin和maven-antrun-plugin插件
#### 4. rocketMQ报错:Class com.sun.tools.javac.tree.JCTree$JCImport does not have member field ‘com.sun.tools.javac.tre
是与JDK21不兼容



