package com.zhengwei.mango.admin.service;

import com.zhengwei.mango.admin.model.SysDict;
import com.zhengwei.mango.core.service.CrudService;

import java.util.List;

/**
 * 字典管理
 */
public interface SysDictService extends CrudService<SysDict> {

    /**
     * 根据名称查询
     *
     * @param label
     * @return
     */
    List<SysDict> findByLabel(String label);
}
