package com.zhengwei.mango.monitor;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 启动器
 */
@EnableAdminServer
@SpringBootApplication
class MangoMonitorApplication {

    public static void main(String[] args) {
        SpringApplication.run(MangoMonitorApplication.class, args);
    }
}
