package com.zhengwei.mango.admin.service;

import com.zhengwei.mango.admin.model.SysDept;
import com.zhengwei.mango.core.service.CrudService;

import java.util.List;

/**
 * 机构管理
 */
public interface SysDeptService extends CrudService<SysDept> {

    /**
     * 查询机构树
     *
     * @return
     */
    List<SysDept> findTree();
}
