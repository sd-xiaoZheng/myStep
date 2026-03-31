package org.zaohu;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author Step
 */
@EnableFeignClients
@SpringBootApplication
@EnableDiscoveryClient//nacos用于发现服务
@MapperScan("org.zaohu.modules.**.mapper")
@EnableScheduling
@Slf4j
public class ZaohuStepApplication {
    public static void main(String[] args) {
        SpringApplication.run(ZaohuStepApplication.class, args);
        log.info("===========Step启动成功===========");
    }
}
