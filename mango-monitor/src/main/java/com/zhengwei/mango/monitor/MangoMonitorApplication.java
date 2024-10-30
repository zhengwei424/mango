package com.zhengwei.mango.monitor;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableAdminServer
@SpringBootApplication
//@EnableEurekaClient
@EnableDiscoveryClient
public class MangoMonitorApplication {
    public static void main(String[] args) {
        SpringApplication.run(MangoMonitorApplication.class, args);
//        new SpringApplicationBuilder(MangoMonitorApplication.class).web(WebApplicationType.REACTIVE).run(args);
    }

}
