package com.zhengwei.mango.admin.controller;

import com.zhengwei.mango.admin.model.SysLoginLog;
import com.zhengwei.mango.admin.service.SysLoginLogService;
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
 * 登录日志控制器
 * @author Louis
 * @date Jan 13, 2019
 */
@RestController
@RequestMapping("loginlog")
public class SysLoginLogController {

    @Autowired
    private SysLoginLogService sysLoginLogService;

    @PreAuthorize("hasAuthority('sys:loginlog:view')")
    @PostMapping(value="/findPage")
    public HttpResult findPage(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(sysLoginLogService.findPage(pageRequest));
    }

    @PreAuthorize("hasAuthority('sys:loginlog:delete')")
    @PostMapping(value="/delete")
    public HttpResult delete(@RequestBody List<SysLoginLog> records) {
        return HttpResult.ok(sysLoginLogService.delete(records));
    }
}
