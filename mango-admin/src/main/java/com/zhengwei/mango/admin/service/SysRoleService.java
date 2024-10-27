package com.zhengwei.mango.admin.service;

import com.zhengwei.mango.admin.model.SysMenu;
import com.zhengwei.mango.admin.model.SysRole;
import com.zhengwei.mango.admin.model.SysRoleMenu;
import com.zhengwei.mango.core.service.CrudService;

import java.util.List;

/**
 * 角色管理
 */
public interface SysRoleService extends CrudService<SysRole> {

    /**
     * 查询全部
     *
     * @return
     */
    List<SysRole> findAll();

    /**
     * 查询角色菜单集合
     *
     * @param roleId
     * @return
     */
    List<SysMenu> findRoleMenus(Long roleId);

    /**
     * 保存角色菜单
     *
     * @param records
     * @return
     */
    int saveRoleMenus(List<SysRoleMenu> records);

    /**
     * 根据名称查询
     *
     * @param name
     * @return
     */
    List<SysRole> findByName(String name);
}
