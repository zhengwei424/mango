package com.zhengwei.mango.consumer.component;

import com.zhengwei.mango.consumer.service.MangoProducerService;
import org.springframework.stereotype.Component;

@Component
public class MangoProducerHystrix implements MangoProducerService {

    @Override
    public String hello() {
        return "Sorry,hello service call failed.";
    }
}
