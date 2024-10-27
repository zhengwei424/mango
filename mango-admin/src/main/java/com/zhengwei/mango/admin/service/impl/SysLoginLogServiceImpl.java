package com.zhengwei.mango.admin.service.impl;

import com.zhengwei.mango.admin.dao.SysLoginLogMapper;
import com.zhengwei.mango.admin.model.SysLoginLog;
import com.zhengwei.mango.admin.service.SysLoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhengwei.mango.core.page.MybatisPageHelper;
import com.zhengwei.mango.core.page.PageRequest;
import com.zhengwei.mango.core.page.PageResult;

import java.util.List;

@Service
public class SysLoginLogServiceImpl implements SysLoginLogService {
    @Autowired
    private SysLoginLogMapper sysLoginLogMapper;

    @Override
    public int save(SysLoginLog record) {
        if (record.getId() == null || record.getId() == 0) {
            return sysLoginLogMapper.insertSelective(record);
        }
        return sysLoginLogMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(SysLoginLog record) {
        return sysLoginLogMapper.deleteByPrimaryKey(record.getId());
    }

    @Override
    public int delete(List<SysLoginLog> records) {
        for (SysLoginLog record : records) {
            delete(record);
        }
        return 1;
    }

    @Override
    public SysLoginLog findById(Long id) {
        return sysLoginLogMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageResult findPage(PageRequest pageRequest) {
        Object username = pageRequest.getParam("username");
        Object status = pageRequest.getParam("status");

        if (username != null) {
            return MybatisPageHelper.findPage(pageRequest, sysLoginLogMapper, "findPageByUsername", username);
        }

        if (status != null) {
            return MybatisPageHelper.findPage(pageRequest, sysLoginLogMapper, "findPageByStatus", status);
        }

        return MybatisPageHelper.findPage(pageRequest, sysLoginLogMapper);
    }
}
