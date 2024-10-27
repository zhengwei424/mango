package com.zhengwei.mango.admin.controller;

import com.zhengwei.mango.admin.model.SysDict;
import com.zhengwei.mango.admin.service.SysDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import com.zhengwei.mango.core.http.HttpResult;
import com.zhengwei.mango.core.page.PageRequest;

import java.util.List;

/**
 * 字典控制器
 * @author Louis
 * @date Jan 13, 2019
 */
@RestController
@RequestMapping("dict")
public class SysDictController {

    @Autowired
    private SysDictService sysDictService;

    @PreAuthorize("hasAuthority('sys:dict:add') AND hasAuthority('sys:dict:edit')")
    @PostMapping(value="/save")
    public HttpResult save(@RequestBody SysDict record) {
        return HttpResult.ok(sysDictService.save(record));
    }

    @PreAuthorize("hasAuthority('sys:dict:delete')")
    @PostMapping(value="/delete")
    public HttpResult delete(@RequestBody List<SysDict> records) {
        return HttpResult.ok(sysDictService.delete(records));
    }

    @PreAuthorize("hasAuthority('sys:dict:view')")
    @PostMapping(value="/findPage")
    public HttpResult findPage(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(sysDictService.findPage(pageRequest));
    }

    @PreAuthorize("hasAuthority('sys:dict:view')")
    @GetMapping(value="/findBylabel")
    public HttpResult findBylabel(@RequestParam String label) {
        return HttpResult.ok(sysDictService.findByLabel(label));
    }
}

