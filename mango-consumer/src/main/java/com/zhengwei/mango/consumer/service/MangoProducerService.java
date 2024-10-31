package com.zhengwei.mango.consumer.service;

import com.zhengwei.mango.consumer.component.MangoProducerHystrix;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后端请求异常时，调用fallback返回
 */
@FeignClient(name = "mango-producer", fallback = MangoProducerHystrix.class)
public interface MangoProducerService {

    @RequestMapping("/hello")
    public String hello();
}
