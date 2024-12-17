package com.zhengwei.mango.admin.model;

import lombok.Data;

import java.util.Date;

/**
 * 基础模型
 */
@Data
public class BaseModel {
    private Long id;
    private String createBy;
    private Date createTime;
    private String lastUpdateBy;
    private Date lastUpdateTime;
}
