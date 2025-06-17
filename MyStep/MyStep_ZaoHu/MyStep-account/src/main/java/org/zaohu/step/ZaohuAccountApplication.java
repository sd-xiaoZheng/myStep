package org.zaohu.step;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class ZaohuAccountApplication {
    public static void main(String[] args) {
        SpringApplication.run(ZaohuAccountApplication.class, args);
    }

}
