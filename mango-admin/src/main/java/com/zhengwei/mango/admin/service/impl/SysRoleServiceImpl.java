package com.zhengwei.mango.admin.service.impl;

import com.zhengwei.mango.admin.constant.SysConstants;
import com.zhengwei.mango.admin.dao.SysMenuMapper;
import com.zhengwei.mango.admin.dao.SysRoleMapper;
import com.zhengwei.mango.admin.dao.SysRoleMenuMapper;
import com.zhengwei.mango.admin.model.SysMenu;
import com.zhengwei.mango.admin.model.SysRole;
import com.zhengwei.mango.admin.model.SysRoleMenu;
import com.zhengwei.mango.admin.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.zhengwei.mango.core.page.MybatisPageHelper;
import com.zhengwei.mango.core.page.PageRequest;
import com.zhengwei.mango.core.page.PageResult;

import java.util.List;

@Service
public class SysRoleServiceImpl implements SysRoleService {


    @Autowired
    private SysRoleMapper sysRoleMapper;
    @Autowired
    private SysRoleMenuMapper sysRoleMenuMapper;
    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public int save(SysRole record) {
        if (record.getId() == null || record.getId() == 0) {
            return sysRoleMapper.insertSelective(record);
        }
        return sysRoleMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(SysRole record) {
        return sysRoleMapper.deleteByPrimaryKey(record.getId());
    }

    @Override
    public int delete(List<SysRole> records) {
        for (SysRole record : records) {
            delete(record);
        }
        return 1;
    }

    @Override
    public SysRole findById(Long id) {
        return sysRoleMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageResult findPage(PageRequest pageRequest) {
        Object label = pageRequest.getParam("name");
        if (label != null) {
            return MybatisPageHelper.findPage(pageRequest, sysRoleMapper, "findPageByName", label);
        }
        return MybatisPageHelper.findPage(pageRequest, sysRoleMapper);
    }

    @Override
    public List<SysRole> findAll() {
        return sysRoleMapper.findAll();
    }
//    public SysRoleMapper getSysRoleMapper() {
//        return sysRoleMapper;
//    }
//
//    public void setSysRoleMapper(SysRoleMapper sysRoleMapper) {
//        this.sysRoleMapper = sysRoleMapper;
//    }
    @Override
    public List<SysMenu> findRoleMenus(Long roleId) {
        SysRole sysRole = sysRoleMapper.selectByPrimaryKey(roleId);
        if (SysConstants.ADMIN.equalsIgnoreCase(sysRole.getName())){
            return sysMenuMapper.findAll();
        }
        return sysMenuMapper.findRoleMenus(roleId);
    }

    @Transactional
    @Override
    public int saveRoleMenus(List<SysRoleMenu> records) {
        if(records == null || records.isEmpty()){
            return 1;  // 都返回1 ？？？？？？？？？
        }
        Long roleId = records.get(0).getRoleId();
        sysMenuMapper.deleteByPrimaryKey(roleId);
        for (SysRoleMenu record : records) {
            sysRoleMenuMapper.insertSelective(record);
        }
        return 1; // 都返回1 ？？？？？？？？？
    }

    @Override
    public List<SysRole> findByName(String name) {
        return sysRoleMapper.findByName(name);
    }
}
