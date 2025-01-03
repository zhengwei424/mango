package com.zhengwei.mango.producer;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
@EnableApolloConfig
public class MangoProducerApplication {
    public static void main(String[] args) {
        SpringApplication.run(MangoProducerApplication.class, args);
    }
}
