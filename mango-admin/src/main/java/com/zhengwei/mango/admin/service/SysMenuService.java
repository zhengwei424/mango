package com.zhengwei.mango.admin.service;

import com.zhengwei.mango.admin.model.SysMenu;
import com.zhengwei.mango.core.service.CrudService;

import java.util.List;

/**
 * 菜单管理
 */
public interface SysMenuService extends CrudService<SysMenu> {

    /**
     * 查询菜单树，用户ID和用户名为空则查询全部
     *
     * @param username
     * @param menuType 获取惨淡类型，0：获取所有菜单，包含按钮；1：获取所有菜单，不包含按钮
     * @return
     */
    List<SysMenu> findTree(String username, int menuType);

    /**
     * 根据用户名查找菜单列表
     *
     * @param username
     * @return
     */
    List<SysMenu> findByUser(String username);
}
