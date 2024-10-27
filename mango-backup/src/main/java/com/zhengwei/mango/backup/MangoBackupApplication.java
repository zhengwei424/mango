package com.zhengwei.mango.backup;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"com.zhengwei.mango.backup"})
public class MangoBackupApplication {
    public static void main(String[] args) {
        SpringApplication.run(MangoBackupApplication.class, args);
    }
}
