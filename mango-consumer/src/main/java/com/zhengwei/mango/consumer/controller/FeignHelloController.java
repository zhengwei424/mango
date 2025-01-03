package com.zhengwei.mango.consumer.controller;

import com.zhengwei.mango.consumer.service.MangoProducerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FeignHelloController {


    @Autowired
    @Qualifier("com.zhengwei.mango.consumer.service.MangoProducerService")
    private MangoProducerService mangoProducerService;

    @RequestMapping("/feign/call")
    public String call(){
        return mangoProducerService.hello();
    }
}
