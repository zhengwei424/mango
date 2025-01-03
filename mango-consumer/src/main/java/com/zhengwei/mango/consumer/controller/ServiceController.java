package com.zhengwei.mango.consumer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceController {
    @Autowired
    private LoadBalancerClient loadBalancerClient;

    @Autowired
    private DiscoveryClient discoveryClient;

    /**
     * 获取指定服务
     * @return
     */
    @RequestMapping("/services")
    public Object services() {
        return discoveryClient.getInstances("mango-producer");
    }


    @RequestMapping("/discovery")
    public Object discovery() {
        return loadBalancerClient.choose("mango-producer").getUri().toString();
    }

}
