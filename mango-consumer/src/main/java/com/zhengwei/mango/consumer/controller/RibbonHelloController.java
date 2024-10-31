package com.zhengwei.mango.consumer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class RibbonHelloController {
    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping("/ribbon/call")
    public String call() {
        return restTemplate.getForObject("http://mango-producer/hello", String.class);
    }
}
