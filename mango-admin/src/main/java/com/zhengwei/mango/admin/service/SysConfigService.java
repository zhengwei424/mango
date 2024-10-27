package com.zhengwei.mango.admin.service;

import com.zhengwei.mango.admin.model.SysConfig;
import com.zhengwei.mango.core.service.CrudService;

import java.util.List;

/**
 * 系统配置管理
 */
public interface SysConfigService extends CrudService<SysConfig> {

    /**
     * 根据名称查询
     *
     * @param label
     * @return
     */
    List<SysConfig> findByLabel(String label);
}
