/*
MySQL Backup
Database: mango
Backup Time: 2024-12-17 16:34:21
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `mango`.`sys_config`;
DROP TABLE IF EXISTS `mango`.`sys_dept`;
DROP TABLE IF EXISTS `mango`.`sys_dict`;
DROP TABLE IF EXISTS `mango`.`sys_log`;
DROP TABLE IF EXISTS `mango`.`sys_login_log`;
DROP TABLE IF EXISTS `mango`.`sys_menu`;
DROP TABLE IF EXISTS `mango`.`sys_role`;
DROP TABLE IF EXISTS `mango`.`sys_role_dept`;
DROP TABLE IF EXISTS `mango`.`sys_role_menu`;
DROP TABLE IF EXISTS `mango`.`sys_user`;
DROP TABLE IF EXISTS `mango`.`sys_user_role`;
CREATE TABLE `sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` tinyint DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='系统配置表';
CREATE TABLE `sys_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `parent_id` bigint DEFAULT NULL COMMENT '上级机构ID，一级机构为0',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COMMENT='机构管理';
CREATE TABLE `sys_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` tinyint DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='字典表';
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2897 DEFAULT CHARSET=utf8mb3 COMMENT='系统操作日志';
CREATE TABLE `sys_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `status` varchar(50) DEFAULT NULL COMMENT '登录状态（online:在线，登录初始状态，方便统计在线人数；login:退出登录后将online置为login；logout:退出登录）',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2804 DEFAULT CHARSET=utf8mb3 COMMENT='系统登录日志';
CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL,类型：1.普通页面（如用户管理， /sys/user） 2.嵌套完整外部页面，以http(s)开头的链接 3.嵌套服务器页面，使用iframe:前缀+目标URL(如SQL监控， iframe:/druid/login.html, iframe:前缀会替换成服务器地址)',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：sys:user:add,sys:user:edit)',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COMMENT='菜单管理';
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COMMENT='角色管理';
CREATE TABLE `sys_role_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint DEFAULT NULL COMMENT '机构ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='角色机构';
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=623 DEFAULT CHARSET=utf8mb3 COMMENT='角色菜单';
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '用户名',
  `nick_name` varchar(150) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(150) DEFAULT NULL COMMENT '头像',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) DEFAULT NULL COMMENT '加密盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint DEFAULT NULL COMMENT '机构ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COMMENT='用户管理';
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3 COMMENT='用户角色';
BEGIN;
LOCK TABLES `mango`.`sys_config` WRITE;
DELETE FROM `mango`.`sys_config`;
INSERT INTO `mango`.`sys_config` (`id`,`value`,`label`,`type`,`description`,`sort`,`create_by`,`create_time`,`last_update_by`,`last_update_time`,`remarks`,`del_flag`) VALUES (1, '#14889A', 'theme', 'color', '主题色', 0, 'admin', '2018-09-23 19:52:54', NULL, NULL, '主题色', 0);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mango`.`sys_dept` WRITE;
DELETE FROM `mango`.`sys_dept`;
INSERT INTO `mango`.`sys_dept` (`id`,`name`,`parent_id`,`order_num`,`create_by`,`create_time`,`last_update_by`,`last_update_time`,`del_flag`) VALUES (1, '重工集团', NULL, 0, 'admin', '2018-09-23 19:35:22', NULL, NULL, 0),(2, '牧尘集团', NULL, 1, 'admin', '2018-09-23 19:35:55', NULL, NULL, 0),(3, '三国集团', NULL, 2, 'admin', '2018-09-23 19:36:24', NULL, NULL, 0),(4, '上海分公司', 2, 0, 'admin', '2018-09-23 19:37:03', NULL, NULL, 0),(5, '北京分公司', 1, 1, 'admin', '2018-09-23 19:37:17', NULL, NULL, 0),(6, '北京分公司', 2, 1, 'admin', '2018-09-23 19:37:28', NULL, NULL, 0),(7, '技术部', 5, 0, 'admin', '2018-09-23 19:38:00', NULL, NULL, 0),(8, '技术部', 4, 0, 'admin', '2018-09-23 19:38:10', NULL, NULL, 0),(9, '技术部', 6, 0, 'admin', '2018-09-23 19:38:17', NULL, NULL, 0),(10, '市场部', 5, 0, 'admin', '2018-09-23 19:38:45', NULL, NULL, 0),(11, '市场部', 6, 0, 'admin', '2018-09-23 19:39:01', NULL, NULL, 0),(12, '魏国', 3, 0, 'admin', '2018-09-23 19:40:42', NULL, NULL, 0);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mango`.`sys_dict` WRITE;
DELETE FROM `mango`.`sys_dict`;
INSERT INTO `mango`.`sys_dict` (`id`,`value`,`label`,`type`,`description`,`sort`,`create_by`,`create_time`,`last_update_by`,`last_update_time`,`remarks`,`del_flag`) VALUES (1, 'male', '男', 'sex', '性别', 0, 'admin', '2018-09-23 19:52:54', NULL, NULL, '性别', 0),(2, 'female', '女', 'sex', '性别', 1, 'admin', '2018-09-23 19:53:17', NULL, NULL, '性别', 0);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mango`.`sys_log` WRITE;
DELETE FROM `mango`.`sys_log`;
INSERT INTO `mango`.`sys_log` (`id`,`user_name`,`operation`,`method`,`params`,`time`,`ip`,`create_by`,`create_time`,`last_update_by`,`last_update_time`) VALUES (1, 'admin', NULL, 'com.louis.kitty.admin.sevice.impl.SysDictServiceImpl.findPage()', '{\"columnFilters\":{\"label\":{\"name\":\"label\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}', 4, '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:16', NULL, NULL),(2, 'admin', NULL, 'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()', '{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}', 4, '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:17', NULL, NULL),(3, 'admin', NULL, 'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()', '{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}', 36, '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:18', NULL, NULL),(4, 'admin', NULL, 'com.louis.kitty.admin.sevice.impl.SysDictServiceImpl.findPage()', '{\"columnFilters\":{\"label\":{\"name\":\"label\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}', 4, '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:20', NULL, NULL),(5, 'admin', NULL, 'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()', '{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}', 4, '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:20', NULL, NULL),(6, 'admin', NULL, 'com.louis.kitty.admin.sevice.impl.SysUserServiceImpl.findPage()', '{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}', 27, '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:21', NULL, NULL),(7, 'admin', NULL, 'com.louis.kitty.admin.sevice.impl.SysRoleServiceImpl.findPage()', '{\"columnFilters\":{\"name\":{\"name\":\"name\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}', 4, '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:22', NULL, NULL),(8, 'admin', NULL, 'com.louis.kitty.admin.sevice.impl.SysDictServiceImpl.findPage()', '{\"columnFilters\":{\"label\":{\"name\":\"label\",\"value\":\"\"}},\"pageNum\":1,\"pageSize\":8}', 4, '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:23', NULL, NULL),(2798, NULL, NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findByName()', '\"admin\"', 361, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL),(2799, NULL, NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findByName()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL),(2800, NULL, NULL, 'com.louis.mango.admin.service.impl.SysMenuServiceImpl.findByUser()', '\"admin\"', 43, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL),(2801, NULL, NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findPermissions()', '\"admin\"', 49, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL),(2802, NULL, NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findByName()', '\"admin\"', 221, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL),(2803, NULL, NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findByName()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL),(2804, NULL, NULL, 'com.louis.mango.admin.service.impl.SysMenuServiceImpl.findByUser()', '\"admin\"', 37, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL),(2805, NULL, NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findPermissions()', '\"admin\"', 43, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL),(2806, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysLoginLogServiceImpl.writeLoginLog()', '\"admin\"', 138, '0:0:0:0:0:0:0:1', 'admin', '2019-01-21 10:15:43', NULL, NULL),(2807, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysMenuServiceImpl.findTree()', '\"admin\"', 15, '0:0:0:0:0:0:0:1', 'admin', '2019-01-21 10:15:44', NULL, NULL),(2808, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysMenuServiceImpl.findByUser()', '\"admin\"', 16, '0:0:0:0:0:0:0:1', 'admin', '2019-01-21 10:15:44', NULL, NULL),(2809, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findPermissions()', '\"admin\"', 22, '0:0:0:0:0:0:0:1', 'admin', '2019-01-21 10:15:44', NULL, NULL),(2876, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysLoginLogServiceImpl.findPage()', '{\"pageNum\":1,\"pageSize\":9,\"params\":[{\"name\":\"userName\",\"value\":\"\"}]}', 13, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:10', NULL, NULL),(2877, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysRoleServiceImpl.findPage()', '{\"pageNum\":1,\"pageSize\":9,\"params\":[{\"name\":\"name\",\"value\":\"\"}]}', 15, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:13', NULL, NULL),(2878, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysMenuServiceImpl.findTree()', 'null', 10, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:13', NULL, NULL),(2879, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysDeptServiceImpl.findTree()', NULL, 3, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:14', NULL, NULL),(2880, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysDeptServiceImpl.findTree()', NULL, 2, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:14', NULL, NULL),(2881, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findPage()', '{\"pageNum\":1,\"pageSize\":9,\"params\":[{\"name\":\"name\",\"value\":\"\"}]}', 49, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:14', NULL, NULL),(2882, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysRoleServiceImpl.findAll()', NULL, 1, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:14', NULL, NULL),(2883, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysMenuServiceImpl.findTree()', 'null', 3, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:15', NULL, NULL),(2884, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysConfigServiceImpl.findPage()', '{\"pageNum\":1,\"pageSize\":9,\"params\":[{\"name\":\"label\",\"value\":\"\"}]}', 8, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:15', NULL, NULL),(2885, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysLoginLogServiceImpl.findPage()', '{\"pageNum\":1,\"pageSize\":9,\"params\":[{\"name\":\"userName\",\"value\":\"\"}]}', 7, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:16', NULL, NULL),(2886, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysDeptServiceImpl.findTree()', NULL, 2, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:22', NULL, NULL),(2887, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findPage()', '{\"pageNum\":1,\"pageSize\":9,\"params\":[{\"name\":\"name\",\"value\":\"\"}]}', 61, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:22', NULL, NULL),(2888, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysRoleServiceImpl.findAll()', NULL, 1, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:22', NULL, NULL),(2889, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findPage()', '{\"pageNum\":2,\"pageSize\":9,\"params\":[{\"name\":\"name\",\"value\":\"\"}]}', 18, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:25', NULL, NULL),(2890, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysRoleServiceImpl.findAll()', NULL, 2, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:25', NULL, NULL),(2891, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findPage()', '{\"pageNum\":1,\"pageSize\":9,\"params\":[{\"name\":\"name\",\"value\":\"\"}]}', 43, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:27', NULL, NULL),(2892, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysRoleServiceImpl.findAll()', NULL, 1, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:27', NULL, NULL),(2893, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.createUserExcelFile()', '{\"pageNum\":1,\"pageSize\":100000,\"params\":[{\"name\":\"name\",\"value\":\"\"}]}', 1577, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:48:38', NULL, NULL),(2894, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysDeptServiceImpl.findTree()', NULL, 1, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:49:24', NULL, NULL),(2895, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysUserServiceImpl.findPage()', '{\"pageNum\":1,\"pageSize\":9,\"params\":[{\"name\":\"name\",\"value\":\"\"}]}', 75, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:49:24', NULL, NULL),(2896, 'admin', NULL, 'com.louis.mango.admin.service.impl.SysRoleServiceImpl.findAll()', NULL, 2, '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:49:24', NULL, NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mango`.`sys_login_log` WRITE;
DELETE FROM `mango`.`sys_login_log`;
INSERT INTO `mango`.`sys_login_log` (`id`,`user_name`,`status`,`ip`,`create_by`,`create_time`,`last_update_by`,`last_update_time`) VALUES (1, 'admin', 'login', '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:16', NULL, NULL),(2, 'admin', 'logout', '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:17', NULL, NULL),(3, 'admin', 'login', '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:18', NULL, NULL),(4, 'admin', 'logout', '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:20', NULL, NULL),(5, 'admin', 'login', '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:20', NULL, NULL),(6, 'admin', 'logout', '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:21', NULL, NULL),(7, 'admin', 'login', '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:22', NULL, NULL),(8, 'admin', 'login', '0:0:0:0:0:0:0:1', 'admin', '2018-09-23 19:54:23', 'admin', '2019-01-21 10:15:43'),(2798, 'admin', 'logout', '0:0:0:0:0:0:0:1', 'admin', '2019-01-21 10:15:43', NULL, NULL),(2799, 'admin', 'login', '0:0:0:0:0:0:0:1', 'admin', '2019-01-21 10:15:43', 'admin', '2019-01-21 10:16:54'),(2800, 'admin', 'logout', '0:0:0:0:0:0:0:1', 'admin', '2019-01-21 10:16:54', NULL, NULL),(2801, 'admin', 'login', '0:0:0:0:0:0:0:1', 'admin', '2019-01-21 10:16:54', 'admin', '2019-01-22 14:43:09'),(2802, 'admin', 'logout', '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:43:09', NULL, NULL),(2803, 'admin', 'online', '0:0:0:0:0:0:0:1', 'admin', '2019-01-22 14:43:09', NULL, NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mango`.`sys_menu` WRITE;
DELETE FROM `mango`.`sys_menu`;
INSERT INTO `mango`.`sys_menu` (`id`,`name`,`parent_id`,`url`,`perms`,`type`,`icon`,`order_num`,`create_by`,`create_time`,`last_update_by`,`last_update_time`,`del_flag`) VALUES (1, '系统管理', 0, NULL, NULL, 0, 'fa-address-card-o', 0, NULL, NULL, NULL, NULL, 0),(2, '用户管理', 1, '/sys/user', NULL, 1, 'fa-user-o', 1, NULL, NULL, NULL, NULL, 0),(3, '查询', 2, NULL, 'sys:user:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(4, '新增', 2, NULL, 'sys:user:add', 2, 'fa-plus', 0, NULL, NULL, NULL, NULL, 0),(5, '编辑', 2, NULL, 'sys:user:edit', 2, 'fa-edit', 0, NULL, NULL, NULL, NULL, 0),(6, '删除', 2, NULL, 'sys:user:delete', 2, 'fa-trash', 0, NULL, NULL, NULL, NULL, 0),(7, '机构管理', 1, '/sys/dept', NULL, 1, 'fa-building-o', 2, NULL, NULL, NULL, NULL, 0),(8, '查询', 7, NULL, 'sys:dept:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(9, '新增', 7, NULL, 'sys:dept:add', 2, 'fa-plus', 0, NULL, NULL, NULL, NULL, 0),(10, '编辑', 7, NULL, 'sys:dept:edit', 2, 'fa-edit', 0, NULL, NULL, NULL, NULL, 0),(11, '删除', 7, NULL, 'sys:dept:delete', 2, 'fa-trash', 0, NULL, NULL, NULL, NULL, 0),(12, '角色管理', 1, '/sys/role', NULL, 1, 'fa-user-o', 4, NULL, NULL, NULL, NULL, 0),(13, '查询', 12, NULL, 'sys:role:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(14, '新增', 12, NULL, 'sys:role:add', 2, 'fa-plus', 0, NULL, NULL, NULL, NULL, 0),(15, '编辑', 12, NULL, 'sys:role:edit', 2, 'fa-edit', 0, NULL, NULL, NULL, NULL, 0),(16, '删除', 12, NULL, 'sys:role:delete', 2, 'fa-trash', 0, NULL, NULL, NULL, NULL, 0),(17, '菜单管理', 1, '/sys/menu', NULL, 1, 'fa-list', 5, NULL, NULL, NULL, NULL, 0),(18, '查询', 17, NULL, 'sys:menu:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(19, '新增', 17, NULL, 'sys:menu:add', 2, 'fa-plus', 0, NULL, NULL, NULL, NULL, 0),(20, '编辑', 17, NULL, 'sys:menu:edit', 2, 'fa-edit', 0, NULL, NULL, NULL, NULL, 0),(21, '删除', 17, NULL, 'sys:menu:delete', 2, 'fa-trash', 0, NULL, NULL, NULL, NULL, 0),(22, '字典管理', 1, '/sys/dict', NULL, 1, 'fa-book', 7, NULL, NULL, NULL, NULL, 0),(23, '查询', 22, NULL, 'sys:dict:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(24, '新增', 22, NULL, 'sys:dict:add', 2, 'fa-plus', 0, NULL, NULL, NULL, NULL, 0),(25, '编辑', 22, NULL, 'sys:dict:edit', 2, 'fa-edit', 0, NULL, NULL, NULL, NULL, 0),(26, '删除', 22, NULL, 'sys:dict:delete', 2, 'fa-trash', 0, NULL, NULL, NULL, NULL, 0),(27, '系统配置', 1, '/sys/config', NULL, 1, 'fa-cog', 7, NULL, NULL, NULL, NULL, 0),(28, '查询', 27, NULL, 'sys:config:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(29, '新增', 27, NULL, 'sys:config:add', 2, 'fa-plus', 0, NULL, NULL, NULL, NULL, 0),(30, '编辑', 27, NULL, 'sys:config:edit', 2, 'fa-edit', 0, NULL, NULL, NULL, NULL, 0),(31, '删除', 27, NULL, 'sys:config:delete', 2, 'fa-trash', 0, NULL, NULL, NULL, NULL, 0),(32, '登录日志', 1, '/sys/loginlog', NULL, 1, 'fa-newspaper-o', 8, NULL, NULL, 'admin', '2018-09-23 19:32:28', 0),(33, '查询', 32, NULL, 'sys:loginlog:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(34, '删除', 32, NULL, 'sys:loginlog:delete', 2, 'fa-trash', 0, NULL, NULL, NULL, NULL, 0),(35, '操作日志', 1, '/sys/log', NULL, 1, 'fa-hand-paper-o', 8, NULL, NULL, 'admin', '2018-09-23 19:32:28', 0),(36, '查询', 35, NULL, 'sys:log:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(37, '删除', 35, NULL, 'sys:log:delete', 2, 'fa-trash', 0, NULL, NULL, NULL, NULL, 0),(38, '系统监控', 0, '', '', 0, 'fa-bar-chart-o', 4, 'admin', '2018-12-27 10:57:29', 'admin', '2019-01-10 17:31:04', 0),(39, '数据监控', 38, 'http://127.0.0.1:8001/druid/login.html', NULL, 1, 'fa-industry', 0, NULL, NULL, 'admin', '2018-12-27 11:03:45', 0),(40, '查询', 39, NULL, 'sys:druid:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(41, '服务监控', 38, 'http://127.0.0.1:8000/', NULL, 1, 'fa-bar-chart-o', 1, 'admin', '2018-11-02 20:02:15', 'admin', '2018-12-27 11:03:53', 0),(42, '查询', 41, NULL, 'sys:monitor:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(43, '服务治理', 0, '', '', 0, 'fa-cube', 2, 'admin', '2018-12-27 11:05:48', 'admin', '2018-12-27 11:06:39', 0),(44, '注册中心', 43, 'http://127.0.0.1:7001', NULL, 1, 'fa-calendar-check-o', 0, 'admin', '2018-11-03 11:06:48', 'admin', '2018-12-27 11:08:11', 0),(45, '查询', 44, NULL, 'sys:consul:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(46, '接口文档', 0, 'http://127.0.0.1:8001/swagger-ui.html', NULL, 1, 'fa-folder-o', 3, NULL, NULL, 'admin', '2018-12-27 11:04:18', 0),(47, '查询', 46, NULL, 'sys:swagger:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(48, '代码生成', 0, '/generator/generator', '', 1, 'fa-file-code-o', 5, 'admin', '2018-11-15 14:39:30', 'admin', '2018-11-15 14:56:18', 0),(49, '查询', 48, NULL, 'sys:generator:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(50, '在线用户', 0, '/sys/online', '', 1, 'fa-users', 5, 'admin', '2018-11-15 14:39:30', 'admin', '2018-11-15 14:56:18', 0),(51, '查询', 50, NULL, 'sys:online:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(52, '使用案例', 0, NULL, NULL, 0, 'fa-lightbulb-o', 6, NULL, NULL, 'admin', '2018-11-15 14:39:43', 0),(53, '国际化', 52, '/demo/i18n', NULL, 1, 'fa-language', 1, NULL, NULL, NULL, NULL, 0),(54, '查询', 53, NULL, 'sys:dict:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0),(55, '换皮肤', 52, '/demo/theme', NULL, 1, 'fa-flask', 2, NULL, NULL, NULL, NULL, 0),(56, '查询', 55, NULL, 'sys:dict:view', 2, 'fa-search', 0, NULL, NULL, NULL, NULL, 0);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mango`.`sys_role` WRITE;
DELETE FROM `mango`.`sys_role`;
INSERT INTO `mango`.`sys_role` (`id`,`name`,`remark`,`create_by`,`create_time`,`last_update_by`,`last_update_time`,`del_flag`) VALUES (1, 'admin', '超级管理员', 'admin', '2019-01-19 11:11:11', 'admin', '2019-01-19 19:07:18', 0),(2, 'mng', '项目经理', 'admin', '2019-01-19 11:11:11', 'admin', '2019-01-19 11:39:28', 0),(3, 'dev', '开发人员', 'admin', '2019-01-19 11:11:11', 'admin', '2019-01-19 11:39:28', 0),(4, 'test', '测试人员', 'admin', '2019-01-19 11:11:11', 'admin', '2019-01-19 11:11:11', 0);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mango`.`sys_role_dept` WRITE;
DELETE FROM `mango`.`sys_role_dept`;
INSERT INTO `mango`.`sys_role_dept` (`id`,`role_id`,`dept_id`,`create_by`,`create_time`,`last_update_by`,`last_update_time`) VALUES (1, 1, 1, 'admin', '2019-01-11 08:30:37', 'admin', '2019-01-11 08:30:25'),(2, 2, 2, 'admin', '2019-01-11 08:31:01', 'admin', '2019-01-11 08:31:04'),(3, 3, 3, 'admin', '2019-01-11 08:31:18', 'admin', '2019-01-11 08:31:21');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mango`.`sys_role_menu` WRITE;
DELETE FROM `mango`.`sys_role_menu`;
INSERT INTO `mango`.`sys_role_menu` (`id`,`role_id`,`menu_id`,`create_by`,`create_time`,`last_update_by`,`last_update_time`) VALUES (431, 8, 1, 'admin', '2018-09-23 19:55:08', NULL, NULL),(432, 8, 2, 'admin', '2018-09-23 19:55:08', NULL, NULL),(433, 8, 9, 'admin', '2018-09-23 19:55:08', NULL, NULL),(434, 8, 3, 'admin', '2018-09-23 19:55:08', NULL, NULL),(435, 8, 13, 'admin', '2018-09-23 19:55:08', NULL, NULL),(436, 8, 4, 'admin', '2018-09-23 19:55:08', NULL, NULL),(437, 8, 17, 'admin', '2018-09-23 19:55:08', NULL, NULL),(438, 8, 5, 'admin', '2018-09-23 19:55:08', NULL, NULL),(439, 8, 21, 'admin', '2018-09-23 19:55:08', NULL, NULL),(440, 8, 7, 'admin', '2018-09-23 19:55:08', NULL, NULL),(441, 8, 31, 'admin', '2018-09-23 19:55:08', NULL, NULL),(442, 8, 8, 'admin', '2018-09-23 19:55:08', NULL, NULL),(443, 8, 6, 'admin', '2018-09-23 19:55:08', NULL, NULL),(444, 8, 35, 'admin', '2018-09-23 19:55:08', NULL, NULL),(469, 2, 1, NULL, NULL, NULL, NULL),(470, 2, 2, NULL, NULL, NULL, NULL),(471, 2, 3, NULL, NULL, NULL, NULL),(472, 2, 4, NULL, NULL, NULL, NULL),(473, 2, 5, NULL, NULL, NULL, NULL),(474, 2, 6, NULL, NULL, NULL, NULL),(475, 2, 7, NULL, NULL, NULL, NULL),(476, 2, 8, NULL, NULL, NULL, NULL),(477, 2, 9, NULL, NULL, NULL, NULL),(478, 2, 10, NULL, NULL, NULL, NULL),(479, 2, 11, NULL, NULL, NULL, NULL),(480, 2, 12, NULL, NULL, NULL, NULL),(481, 2, 13, NULL, NULL, NULL, NULL),(482, 2, 14, NULL, NULL, NULL, NULL),(483, 2, 15, NULL, NULL, NULL, NULL),(484, 2, 16, NULL, NULL, NULL, NULL),(485, 2, 17, NULL, NULL, NULL, NULL),(486, 2, 18, NULL, NULL, NULL, NULL),(487, 2, 19, NULL, NULL, NULL, NULL),(488, 2, 20, NULL, NULL, NULL, NULL),(489, 2, 21, NULL, NULL, NULL, NULL),(490, 2, 22, NULL, NULL, NULL, NULL),(491, 2, 23, NULL, NULL, NULL, NULL),(492, 2, 24, NULL, NULL, NULL, NULL),(493, 2, 25, NULL, NULL, NULL, NULL),(494, 2, 26, NULL, NULL, NULL, NULL),(495, 2, 27, NULL, NULL, NULL, NULL),(496, 2, 28, NULL, NULL, NULL, NULL),(497, 2, 29, NULL, NULL, NULL, NULL),(498, 2, 30, NULL, NULL, NULL, NULL),(499, 2, 31, NULL, NULL, NULL, NULL),(500, 2, 32, NULL, NULL, NULL, NULL),(501, 2, 33, NULL, NULL, NULL, NULL),(502, 2, 34, NULL, NULL, NULL, NULL),(503, 2, 35, NULL, NULL, NULL, NULL),(504, 2, 36, NULL, NULL, NULL, NULL),(505, 2, 37, NULL, NULL, NULL, NULL),(506, 2, 43, NULL, NULL, NULL, NULL),(507, 2, 44, NULL, NULL, NULL, NULL),(508, 2, 45, NULL, NULL, NULL, NULL),(509, 2, 46, NULL, NULL, NULL, NULL),(510, 2, 47, NULL, NULL, NULL, NULL),(511, 2, 38, NULL, NULL, NULL, NULL),(512, 2, 39, NULL, NULL, NULL, NULL),(513, 2, 40, NULL, NULL, NULL, NULL),(514, 2, 41, NULL, NULL, NULL, NULL),(515, 2, 42, NULL, NULL, NULL, NULL),(516, 2, 48, NULL, NULL, NULL, NULL),(517, 2, 49, NULL, NULL, NULL, NULL),(518, 2, 50, NULL, NULL, NULL, NULL),(519, 2, 51, NULL, NULL, NULL, NULL),(520, 2, 52, NULL, NULL, NULL, NULL),(521, 2, 53, NULL, NULL, NULL, NULL),(522, 2, 54, NULL, NULL, NULL, NULL),(523, 2, 55, NULL, NULL, NULL, NULL),(524, 2, 56, NULL, NULL, NULL, NULL),(572, 3, 1, 'admin', '2019-01-22 14:45:28', NULL, NULL),(573, 3, 2, 'admin', '2019-01-22 14:45:28', NULL, NULL),(574, 3, 3, 'admin', '2019-01-22 14:45:28', NULL, NULL),(575, 3, 4, 'admin', '2019-01-22 14:45:28', NULL, NULL),(576, 3, 5, 'admin', '2019-01-22 14:45:28', NULL, NULL),(577, 3, 6, 'admin', '2019-01-22 14:45:28', NULL, NULL),(578, 3, 7, 'admin', '2019-01-22 14:45:28', NULL, NULL),(579, 3, 8, 'admin', '2019-01-22 14:45:28', NULL, NULL),(580, 3, 12, 'admin', '2019-01-22 14:45:28', NULL, NULL),(581, 3, 13, 'admin', '2019-01-22 14:45:28', NULL, NULL),(582, 3, 17, 'admin', '2019-01-22 14:45:28', NULL, NULL),(583, 3, 18, 'admin', '2019-01-22 14:45:28', NULL, NULL),(584, 3, 22, 'admin', '2019-01-22 14:45:28', NULL, NULL),(585, 3, 23, 'admin', '2019-01-22 14:45:28', NULL, NULL),(586, 3, 24, 'admin', '2019-01-22 14:45:28', NULL, NULL),(587, 3, 25, 'admin', '2019-01-22 14:45:28', NULL, NULL),(588, 3, 26, 'admin', '2019-01-22 14:45:28', NULL, NULL),(589, 3, 27, 'admin', '2019-01-22 14:45:28', NULL, NULL),(590, 3, 28, 'admin', '2019-01-22 14:45:28', NULL, NULL),(591, 3, 29, 'admin', '2019-01-22 14:45:28', NULL, NULL),(592, 3, 30, 'admin', '2019-01-22 14:45:28', NULL, NULL),(593, 3, 31, 'admin', '2019-01-22 14:45:28', NULL, NULL),(594, 3, 32, 'admin', '2019-01-22 14:45:28', NULL, NULL),(595, 3, 33, 'admin', '2019-01-22 14:45:28', NULL, NULL),(596, 3, 35, 'admin', '2019-01-22 14:45:28', NULL, NULL),(597, 3, 36, 'admin', '2019-01-22 14:45:28', NULL, NULL),(598, 3, 43, 'admin', '2019-01-22 14:45:28', NULL, NULL),(599, 3, 44, 'admin', '2019-01-22 14:45:28', NULL, NULL),(600, 3, 45, 'admin', '2019-01-22 14:45:28', NULL, NULL),(601, 3, 38, 'admin', '2019-01-22 14:45:28', NULL, NULL),(602, 3, 39, 'admin', '2019-01-22 14:45:28', NULL, NULL),(603, 3, 40, 'admin', '2019-01-22 14:45:28', NULL, NULL),(604, 3, 41, 'admin', '2019-01-22 14:45:28', NULL, NULL),(605, 3, 42, 'admin', '2019-01-22 14:45:28', NULL, NULL),(606, 3, 50, 'admin', '2019-01-22 14:45:28', NULL, NULL),(607, 3, 51, 'admin', '2019-01-22 14:45:28', NULL, NULL),(608, 4, 1, 'admin', '2019-01-22 14:46:44', NULL, NULL),(609, 4, 2, 'admin', '2019-01-22 14:46:44', NULL, NULL),(610, 4, 3, 'admin', '2019-01-22 14:46:44', NULL, NULL),(611, 4, 7, 'admin', '2019-01-22 14:46:44', NULL, NULL),(612, 4, 8, 'admin', '2019-01-22 14:46:44', NULL, NULL),(613, 4, 17, 'admin', '2019-01-22 14:46:44', NULL, NULL),(614, 4, 18, 'admin', '2019-01-22 14:46:44', NULL, NULL),(615, 4, 32, 'admin', '2019-01-22 14:46:44', NULL, NULL),(616, 4, 33, 'admin', '2019-01-22 14:46:44', NULL, NULL),(617, 4, 35, 'admin', '2019-01-22 14:46:44', NULL, NULL),(618, 4, 36, 'admin', '2019-01-22 14:46:44', NULL, NULL),(619, 4, 46, 'admin', '2019-01-22 14:46:44', NULL, NULL),(620, 4, 47, 'admin', '2019-01-22 14:46:44', NULL, NULL),(621, 4, 50, 'admin', '2019-01-22 14:46:44', NULL, NULL),(622, 4, 51, 'admin', '2019-01-22 14:46:44', NULL, NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mango`.`sys_user` WRITE;
DELETE FROM `mango`.`sys_user`;
INSERT INTO `mango`.`sys_user` (`id`,`name`,`nick_name`,`avatar`,`password`,`salt`,`email`,`mobile`,`status`,`dept_id`,`create_by`,`create_time`,`last_update_by`,`last_update_time`,`del_flag`) VALUES (1, 'admin', '超管', NULL, 'bd1718f058d8a02468134432b8656a86', 'YzcmCZNvbXocrsz9dm8e', 'admin@qq.com', '13612345678', 1, 4, 'admin', '2018-08-14 11:11:11', 'admin', '2018-08-14 11:11:11', 0),(22, 'liubei', '刘备', NULL, 'bd1718f058d8a02468134432b8656a86', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 7, 'admin', '2018-09-23 19:43:00', 'admin', '2019-01-10 11:41:13', 0),(23, 'zhaoyun', '赵云', NULL, 'bd1718f058d8a02468134432b8656a86', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 7, 'admin', '2018-09-23 19:43:44', 'admin', '2018-09-23 19:43:52', 0),(24, 'zhugeliang', '诸葛亮', NULL, 'bd1718f058d8a02468134432b8656a86', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 7, 11, 'admin', '2018-09-23 19:44:23', 'admin', '2018-09-23 19:44:29', 0),(25, 'caocao', '曹操', NULL, 'bd1718f058d8a02468134432b8656a86', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 8, 'admin', '2018-09-23 19:45:32', 'admin', '2019-01-10 17:59:14', 0),(26, 'dianwei', '典韦', NULL, 'bd1718f058d8a02468134432b8656a86', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 10, 'admin', '2018-09-23 19:45:48', 'admin', '2018-09-23 19:45:57', 0),(27, 'xiahoudun', '夏侯惇', NULL, 'bd1718f058d8a02468134432b8656a86', 'YzcmCZNvbXocrsz9dm8e', 'test@qq.com', '13889700023', 1, 8, 'admin', '2018-09-23 19:46:09', 'admin', '2018-09-23 19:46:17', 0);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mango`.`sys_user_role` WRITE;
DELETE FROM `mango`.`sys_user_role`;
INSERT INTO `mango`.`sys_user_role` (`id`,`user_id`,`role_id`,`create_by`,`create_time`,`last_update_by`,`last_update_time`) VALUES (1, 1, 1, NULL, NULL, NULL, NULL),(2, 2, 1, NULL, NULL, NULL, NULL),(26, 5, 3, NULL, NULL, NULL, NULL),(33, 6, 2, NULL, NULL, NULL, NULL),(34, 4, 2, NULL, NULL, NULL, NULL),(35, 9, 2, NULL, NULL, NULL, NULL),(36, 10, 3, NULL, NULL, NULL, NULL),(37, 11, 2, NULL, NULL, NULL, NULL),(38, 12, 3, NULL, NULL, NULL, NULL),(39, 15, 2, NULL, NULL, NULL, NULL),(41, 16, 3, NULL, NULL, NULL, NULL),(42, 8, 2, NULL, NULL, NULL, NULL),(43, 7, 4, NULL, NULL, NULL, NULL),(45, 18, 2, NULL, NULL, NULL, NULL),(46, 17, 3, NULL, NULL, NULL, NULL),(47, 3, 4, NULL, NULL, NULL, NULL),(48, 21, 2, NULL, NULL, NULL, NULL),(58, 30, 2, NULL, NULL, NULL, NULL),(59, 32, 3, NULL, NULL, NULL, NULL),(73, 33, 8, NULL, NULL, NULL, NULL),(74, 25, 8, NULL, NULL, NULL, NULL),(75, 25, 2, NULL, NULL, NULL, NULL),(80, 22, 2, NULL, NULL, NULL, NULL),(81, 23, 3, NULL, NULL, NULL, NULL),(82, 24, 4, NULL, NULL, NULL, NULL),(83, 26, 3, NULL, NULL, NULL, NULL),(85, 29, 2, NULL, NULL, NULL, NULL),(86, 28, 4, NULL, NULL, NULL, NULL),(87, 27, 3, NULL, NULL, NULL, NULL),(90, 31, 2, NULL, NULL, NULL, NULL),(91, 31, 3, NULL, NULL, NULL, NULL);
UNLOCK TABLES;
COMMIT;
