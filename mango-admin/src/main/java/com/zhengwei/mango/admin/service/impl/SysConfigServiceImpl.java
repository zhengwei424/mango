package com.zhengwei.mango.admin.service.impl;

import com.zhengwei.mango.admin.dao.SysConfigMapper;
import com.zhengwei.mango.admin.model.SysConfig;
import com.zhengwei.mango.admin.service.SysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhengwei.mango.core.page.MybatisPageHelper;
import com.zhengwei.mango.core.page.PageRequest;
import com.zhengwei.mango.core.page.PageResult;

import java.util.List;

@Service
public class SysConfigServiceImpl implements SysConfigService {

    @Autowired
    private SysConfigMapper sysConfigMapper;

    @Override
    public int save(SysConfig record) {
        if (record.getId() == null || record.getId() == 0) {
            return sysConfigMapper.insertSelective(record);
        }
        return sysConfigMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(SysConfig record) {
        return sysConfigMapper.deleteByPrimaryKey(record.getId());
    }

    @Override
    public int delete(List<SysConfig> records) {
        for (SysConfig record : records) {
            delete(record);
        }
        return 1;
    }

    @Override
    public SysConfig findById(Long id) {
        return sysConfigMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageResult findPage(PageRequest pageRequest) {
        Object label = pageRequest.getParam("label");
        if (label != null) {
            return MybatisPageHelper.findPage(pageRequest, sysConfigMapper, "findPageByLabel", label);
        }
        return MybatisPageHelper.findPage(pageRequest, sysConfigMapper);
    }

    @Override
    public List<SysConfig> findByLabel(String label) {
        return sysConfigMapper.findByLabel(label);
    }
}
