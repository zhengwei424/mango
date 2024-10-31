package com.zhengwei.mango.consumer.component;

import com.zhengwei.mango.consumer.service.MangoProducerService;
import org.springframework.web.bind.annotation.RequestMapping;


public class MangoProducerHystrix implements MangoProducerService {

    @Override
    @RequestMapping("/hello")
    public String hello() {
        return "Sorry,hello service call failed.";
    }
}
