package com.zhengwei.mango.admin.controller;

import com.zhengwei.mango.admin.model.SysLog;
import com.zhengwei.mango.admin.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.zhengwei.mango.core.http.HttpResult;
import com.zhengwei.mango.core.page.PageRequest;

import java.util.List;

/**
 * 操作日志控制器
 * @author Louis
 * @date Jan 13, 2019
 */
@RestController
@RequestMapping("log")
public class SysLogController {

    @Autowired
    private SysLogService sysLogService;

    @PreAuthorize("hasAuthority('sys:log:view')")
    @PostMapping(value="/findPage")
    public HttpResult findPage(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(sysLogService.findPage(pageRequest));
    }

    @PreAuthorize("hasAuthority('sys:log:delete')")
    @PostMapping(value="/delete")
    public HttpResult delete(@RequestBody List<SysLog> records) {
        return HttpResult.ok(sysLogService.delete(records));
    }
}
