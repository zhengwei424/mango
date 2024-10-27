package com.zhengwei.mango.admin.model;

import lombok.Data;

@Data
public class SysLoginLog extends BaseModel {

    private String userName;

    private String status;

    private String ip;

}