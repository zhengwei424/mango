package com.zhengwei.mango.admin.service;

import com.zhengwei.mango.admin.model.SysUser;
import com.zhengwei.mango.admin.model.SysUserRole;
import com.zhengwei.mango.core.page.PageRequest;
import com.zhengwei.mango.core.service.CrudService;

import java.io.File;
import java.util.List;
import java.util.Set;

/**
 * 用户管理
 */
public interface SysUserService extends CrudService<SysUser> {

    SysUser findByName(String username);

    /**
     * 查找用户的菜单权限标识集合
     *
     * @param username
     * @return
     */
    Set<String> findPermissions(String username);


    /**
     * 查找用户角色集合
     *
     * @param userId
     * @return
     */
    List<SysUserRole> findUserRoles(Long userId);


    /**
     * 生成用户信息Excel文件
     *
     * @param pageRequest
     * @return
     */
    File createUserExcelFile(PageRequest pageRequest);
}
