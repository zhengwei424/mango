package com.zhengwei.mango.admin.controller;

import com.zhengwei.mango.admin.model.SysConfig;
import com.zhengwei.mango.admin.service.SysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import com.zhengwei.mango.core.http.HttpResult;
import com.zhengwei.mango.core.page.PageRequest;

import java.util.List;

/**
 * 系统配置控制器
 */
@RestController
@RequestMapping("config")
public class SysConfigController {

    @Autowired
    private SysConfigService sysConfigService;

    @PreAuthorize("hasAuthority('sys:config:add') AND hasAuthority('sys:config:edit')")
    @PostMapping(value="/save")
    public HttpResult save(@RequestBody SysConfig record) {
        return HttpResult.ok(sysConfigService.save(record));
    }

    @PreAuthorize("hasAuthority('sys:config:delete')")
    @PostMapping(value="/delete")
    public HttpResult delete(@RequestBody List<SysConfig> records) {
        return HttpResult.ok(sysConfigService.delete(records));
    }

    @PreAuthorize("hasAuthority('sys:config:view')")
    @PostMapping(value="/findPage")
    public HttpResult findPage(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(sysConfigService.findPage(pageRequest));
    }

    @PreAuthorize("hasAuthority('sys:config:view')")
    @GetMapping(value="/findBylabel")
    public HttpResult findBylabel(@RequestParam String label) {
        return HttpResult.ok(sysConfigService.findByLabel(label));
    }
}
