package com.zhengwei.mango.service.impl;

import com.zhengwei.mango.dao.SysUserMapper;
import com.zhengwei.mango.model.SysUser;
import com.zhengwei.mango.service.SysUserService;
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
