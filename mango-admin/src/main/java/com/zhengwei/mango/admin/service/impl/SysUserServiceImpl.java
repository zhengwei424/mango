package com.zhengwei.mango.admin.service.impl;

import com.zhengwei.mango.admin.dao.SysUserMapper;
import com.zhengwei.mango.admin.model.SysUser;
import com.zhengwei.mango.admin.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserMapper sysUserMapper;

    @Override
    public List<SysUser> findAll() {
        return sysUserMapper.findAll();
    }
}
