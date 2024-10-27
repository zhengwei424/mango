package com.zhengwei.mango.admin.model;

import lombok.Data;

import java.util.List;

@Data
public class SysMenu extends BaseModel {

    private String name;

    private Long parentId;

    private String url;

    private String perms;

    private Integer type;

    private String icon;

    private Integer orderNum;

    private Byte delFlag;

    // 非数据库字段
    private String parentName;
    // 非数据库字段
    private Integer level;
    // 非数据库字段
    private List<SysMenu> children;

}