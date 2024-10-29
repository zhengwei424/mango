package com.zhengwei.eureka.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
//@SpringBootApplication(exclude={org.springframework.boot.autoconfigure.gson.GsonAutoConfiguration.class})
@SpringBootApplication
public class MyEurekaServer {
    public static void main(String[] args) {
        SpringApplication.run(MyEurekaServer.class, args);
    }
}
