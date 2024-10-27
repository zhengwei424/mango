package com.zhengwei.mango.admin.model;

import lombok.Data;

import java.util.List;

@Data
public class SysDept extends BaseModel {

    private String name;

    private Long parentId;

    private Integer orderNum;

    private Byte delFlag;

    // 非数据库字段???????
    private List<SysDept> children;
    private String parentName;
    private Integer level;
}