/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.19.150
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 192.168.19.150:3306
 Source Schema         : trade_stock

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 27/02/2020 21:32:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_account_warn_template
-- ----------------------------
DROP TABLE IF EXISTS `t_account_warn_template`;
CREATE TABLE `t_account_warn_template`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `warnType` tinyint(3) NOT NULL COMMENT '预警类型 (0: 止损, 1:止盈)',
  `notifyType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知方式(APP:站内信，EMAIL：邮件，SMS：短信)',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板内容',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '消息状态（0：启用， 1： 禁用）',
  `lastUpdateBy` bigint(19) NULL DEFAULT NULL COMMENT '最后跟新人id',
  `lastUpdateUser` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人名称',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updateTime` timestamp(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_warnType`(`warnType`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户预警通知模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_account_warn_template
-- ----------------------------
INSERT INTO `t_account_warn_template` VALUES (14, 0, 'SMS', '尊敬的客户， 您所持有的产品${stockCode}$， 当前价格${stockPrice}$元， 已达到止损比例${stopProfitRate}$，请您及时处理。', '账户预警通知', 0, 10429, 'haper_center2', '2020-02-27 04:00:40', '2020-02-27 04:00:40');
INSERT INTO `t_account_warn_template` VALUES (15, 1, 'EMAIL', '尊敬的客户， 您所持有的产品${stockCode}$， 当前价格${stockPrice}$元， 已达到止损比例${stopProfitRate}$，请您及时处理。', '账户预警通知', 0, 10429, 'haper_center2', '2020-02-27 04:29:06', '2020-02-27 04:29:06');

-- ----------------------------
-- Table structure for t_authority_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_menu`;
CREATE TABLE `t_authority_menu`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `parentId` bigint(19) NULL DEFAULT NULL COMMENT '上级menu_id',
  `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型id',
  `menuCode` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编码',
  `menuName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `menuUri` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URI',
  `menuLevel` tinyint(3) NOT NULL COMMENT '菜单等级',
  `operationSecurity` tinyint(3) NOT NULL COMMENT '是否需要操作授权（0不需要（默认） ，1需要）',
  `menuSeq` tinyint(3) NOT NULL COMMENT '位置排序',
  `menuIco` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(3) NOT NULL COMMENT '菜单状态(0无效,1有效)',
  `isOpen` tinyint(3) NULL DEFAULT 0 COMMENT '只对2级菜单生效。0闭合，1打开',
  `isShow` tinyint(3) NULL DEFAULT NULL COMMENT '是否显示 (0--否  1--是)',
  `componentSrc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件标识（前后分离使用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_menu
-- ----------------------------
INSERT INTO `t_authority_menu` VALUES (1, NULL, 'COMPANY', 'Sys', '系统管理test', '/sys', 0, 1, 0, 'example', 1, 0, 1, 'Layout');
INSERT INTO `t_authority_menu` VALUES (2, 1, 'COMPANY', 'SysAdmin', '用户管理', '/sys/admin', 0, 1, 0, 'table', 1, 0, 1, '/sysAdmin/index');
INSERT INTO `t_authority_menu` VALUES (3, 1, 'COMPANY', 'SysAccess', '菜单管理', 'access', 0, 1, 2, 'table', 1, 0, 1, '/sysAccess/index');
INSERT INTO `t_authority_menu` VALUES (4, 1, 'COMPANY', 'SysRole', '角色管理', 'role', 0, 1, 1, 'table', 1, 0, 1, '/sysRole/index');
INSERT INTO `t_authority_menu` VALUES (5, 1, 'COMPANY', 'authorityMenu', '机构菜单管理', '/authorityMenu.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityMenu/index');
INSERT INTO `t_authority_menu` VALUES (6, 1, 'COMPANY', 'authorityInstitution', '机构类型管理', '/authorityInstitution.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityInstitution/index');
INSERT INTO `t_authority_menu` VALUES (7, 1, 'COMPANY', 'authorityRole', '机构角色管理列表', '/authorityRole.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityRole/index');
INSERT INTO `t_authority_menu` VALUES (8, 1, 'COMPANY', 'authorityUser', '系统操作用户管理', '/authorityUser.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityUser/index');
INSERT INTO `t_authority_menu` VALUES (9, 1, 'COMPANY', 'authorityCompany', '公司管理', '/authorityCompany.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityCompany/index');
INSERT INTO `t_authority_menu` VALUES (10, 1, 'COMPANY', 'authorityTradeStock', '产品管理', '/authorityTradeStock.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityTradeStock/index');
INSERT INTO `t_authority_menu` VALUES (11, 1, 'COMPANY', 'authorityTradeUser', '投资客户管理', '/authorityTradeUser.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityTradeUser/index');
INSERT INTO `t_authority_menu` VALUES (12, 1, 'COMPANY', 'authorityTradeAccount', '交易账号管理', '/authorityTradeAccount.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityTradeAccount/index');
INSERT INTO `t_authority_menu` VALUES (13, 1, 'COMPANY', 'authorityTradeGroup', '客户组管理', '/authorityTradeGroup.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityTradeGroup/index');
INSERT INTO `t_authority_menu` VALUES (14, 1, 'COMPANY', 'authorityTradeOrder', '订单列表', '/authorityTradeOrder.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityTradeOrder/index');
INSERT INTO `t_authority_menu` VALUES (15, 1, 'COMPANY', 'authorityTradeDeal', '成交记录管理', '/authorityTradeDeal.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityTradeDeal/index');
INSERT INTO `t_authority_menu` VALUES (16, 1, 'COMPANY', 'authorityTradePosition', '持仓管理', '/authorityTradePosition.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityTradePosition/index');
INSERT INTO `t_authority_menu` VALUES (17, 1, 'COMPANY', 'authorityAccountNotifyTemplate', '客户消息模板配置', '/authorityAccountNotifyTemplate.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityAccountNotifyTemplate/index');
INSERT INTO `t_authority_menu` VALUES (18, 1, 'COMPANY', 'authorityAccountNotifyMessage', '客户消息列表', '/authorityAccountNotifyMessage.*', 0, 1, 1, 'table', 1, 0, 1, '/authorityAccountNotifyMessage/index');

-- ----------------------------
-- Table structure for t_authority_menu_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_menu_operation`;
CREATE TABLE `t_authority_menu_operation`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `menuId` bigint(19) NULL DEFAULT NULL COMMENT '自定义菜单id',
  `operationName` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作名称',
  `operationUri` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作URI地址',
  `operationIco` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作图标',
  `status` tinyint(3) NOT NULL COMMENT '状态（0无效1有效）',
  `operationResouceUrl` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限菜单url',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fkmenuId`(`menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12217 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单操作表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_menu_operation
-- ----------------------------
INSERT INTO `t_authority_menu_operation` VALUES (12152, 6, '新增', '/authorityInstitution', 'POST', 1, '/authorityInstitution');
INSERT INTO `t_authority_menu_operation` VALUES (12153, 6, '查询', '/authorityInstitution.*', 'GET', 1, '/authorityInstitution');
INSERT INTO `t_authority_menu_operation` VALUES (12154, 6, '修改', '/authorityInstitution/.*', 'PUT', 1, '/authorityInstitution');
INSERT INTO `t_authority_menu_operation` VALUES (12155, 6, '删除', '/authorityInstitution/.*', 'DELETE', 1, '/authorityInstitution');
INSERT INTO `t_authority_menu_operation` VALUES (12156, 8, '查询', '/authorityUser.*', 'GET', 1, '/authorityUser');
INSERT INTO `t_authority_menu_operation` VALUES (12157, 8, '新增', '/authorityUser', 'POST', 1, '/authorityUser');
INSERT INTO `t_authority_menu_operation` VALUES (12158, 8, '修改', '/authorityUser/.*', 'PUT', 1, '/authorityUser');
INSERT INTO `t_authority_menu_operation` VALUES (12159, 8, '删除', '/authorityUser/.*, /authorityUserRole.*', 'DELETE', 1, '/authorityUser');
INSERT INTO `t_authority_menu_operation` VALUES (12160, 8, '重置密码', '/authorityUser/resetPwd', 'POST', 1, '/authorityUser');
INSERT INTO `t_authority_menu_operation` VALUES (12161, 8, '分配角色', '/authorityLogic/userAssignRoles, /authorityUserRole.*', 'POST', 1, '/authorityUser');
INSERT INTO `t_authority_menu_operation` VALUES (12162, 7, '查询', '/authorityRole.*', 'GET', 1, '/authorityRole');
INSERT INTO `t_authority_menu_operation` VALUES (12163, 7, '新增', '/authorityRole', 'POST', 1, '/authorityRole');
INSERT INTO `t_authority_menu_operation` VALUES (12164, 7, '修改', '/authorityRole/.*', 'PUT', 1, '/authorityRole');
INSERT INTO `t_authority_menu_operation` VALUES (12165, 7, '删除', '/authorityRole/.*', 'DELETE', 1, '/authorityRole');
INSERT INTO `t_authority_menu_operation` VALUES (12166, 7, '分配权限', '/authorityLogic/savePrivileges', 'POST', 1, '/authorityRole');
INSERT INTO `t_authority_menu_operation` VALUES (12171, 5, '新增', '/authorityMenu', 'POST', 1, '/authorityMenu');
INSERT INTO `t_authority_menu_operation` VALUES (12172, 5, '查询', '/authorityMenu.*', 'GET', 1, '/authorityMenu');
INSERT INTO `t_authority_menu_operation` VALUES (12173, 5, '修改', '/authorityMenu/.*', 'PUT', 1, '/authorityMenu');
INSERT INTO `t_authority_menu_operation` VALUES (12174, 5, '删除', '/authorityMenu/.*', 'DELETE', 1, '/authorityMenu');
INSERT INTO `t_authority_menu_operation` VALUES (12175, 5, '菜单操作维护', '/authorityMenuOperation.*', 'GET', 1, '/authorityMenu');
INSERT INTO `t_authority_menu_operation` VALUES (12176, 9, '新增', '/authorityLogic/saveCompany', 'POST', 1, '/authorityCompany');
INSERT INTO `t_authority_menu_operation` VALUES (12177, 9, '查询', '/authorityCompany.*', 'GET', 1, '/authorityCompany');
INSERT INTO `t_authority_menu_operation` VALUES (12178, 9, '修改', '/authorityCompany/.*', 'PUT', 1, '/authorityCompany');
INSERT INTO `t_authority_menu_operation` VALUES (12179, 9, '删除', '/authorityLogic/deleteCompany', 'POST', 1, '/authorityCompany');
INSERT INTO `t_authority_menu_operation` VALUES (12180, 10, '新增', '/authorityTradeStock', 'POST', 1, '/authorityTradeStock');
INSERT INTO `t_authority_menu_operation` VALUES (12181, 10, '查询', '/authorityTradeStock.*', 'GET', 1, '/authorityTradeStock');
INSERT INTO `t_authority_menu_operation` VALUES (12182, 10, '修改', '/authorityTradeStock/.*', 'PUT', 1, '/authorityTradeStock');
INSERT INTO `t_authority_menu_operation` VALUES (12183, 10, '删除', '/authorityTradeStock/.*', 'DELETE', 1, '/authorityTradeStock');
INSERT INTO `t_authority_menu_operation` VALUES (12184, 10, '设置热门产品', '/authorityTradeStock/search/updateStockTag.*', 'GET', 1, '/authorityTradeStock');
INSERT INTO `t_authority_menu_operation` VALUES (12185, 11, '新增', '/authorityTradeUser', 'POST', 1, '/authorityTradeUser');
INSERT INTO `t_authority_menu_operation` VALUES (12186, 11, '查询', '/authorityTradeUser.*', 'GET', 1, '/authorityTradeUser');
INSERT INTO `t_authority_menu_operation` VALUES (12187, 11, '修改', '/authorityTradeUser/.*', 'PUT', 1, '/authorityTradeUser');
INSERT INTO `t_authority_menu_operation` VALUES (12188, 11, '删除', '/authorityTradeUser/.*', 'DELETE', 1, '/authorityTradeUser');
INSERT INTO `t_authority_menu_operation` VALUES (12189, 12, '新增', '/authorityTradeAccount', 'POST', 1, '/authorityTradeAccount');
INSERT INTO `t_authority_menu_operation` VALUES (12190, 12, '查询', '/authorityTradeAccount.*', 'GET', 1, '/authorityTradeAccount');
INSERT INTO `t_authority_menu_operation` VALUES (12191, 12, '修改', '/authorityTradeAccount/.*', 'PUT', 1, '/authorityTradeAccount');
INSERT INTO `t_authority_menu_operation` VALUES (12192, 12, '删除', '/authorityTradeAccount/.*', 'DELETE', 1, '/authorityTradeAccount');
INSERT INTO `t_authority_menu_operation` VALUES (12193, 13, '新增', '/authorityTradeGroup', 'POST', 1, '/authorityTradeGroup');
INSERT INTO `t_authority_menu_operation` VALUES (12194, 13, '查询', '/authorityTradeGroup.*', 'GET', 1, '/authorityTradeGroup');
INSERT INTO `t_authority_menu_operation` VALUES (12195, 13, '修改', '/authorityTradeGroup/.*', 'PUT', 1, '/authorityTradeGroup');
INSERT INTO `t_authority_menu_operation` VALUES (12196, 13, '删除', '/authorityTradeGroup/.*', 'DELETE', 1, '/authorityTradeGroup');
INSERT INTO `t_authority_menu_operation` VALUES (12197, 14, '新增', '/authorityTradeOrder', 'POST', 1, '/authorityTradeOrder');
INSERT INTO `t_authority_menu_operation` VALUES (12198, 14, '查询', '/authorityTradeOrder.*', 'GET', 1, '/authorityTradeOrder');
INSERT INTO `t_authority_menu_operation` VALUES (12199, 14, '修改', '/authorityTradeOrder/.*', 'PUT', 1, '/authorityTradeOrder');
INSERT INTO `t_authority_menu_operation` VALUES (12200, 14, '删除', '/authorityTradeOrder/.*', 'DELETE', 1, '/authorityTradeOrder');
INSERT INTO `t_authority_menu_operation` VALUES (12201, 15, '新增', '/authorityTradeDeal', 'POST', 1, '/authorityTradeDeal');
INSERT INTO `t_authority_menu_operation` VALUES (12202, 15, '查询', '/authorityTradeDeal.*', 'GET', 1, '/authorityTradeDeal');
INSERT INTO `t_authority_menu_operation` VALUES (12203, 15, '修改', '/authorityTradeDeal/.*', 'PUT', 1, '/authorityTradeDeal');
INSERT INTO `t_authority_menu_operation` VALUES (12204, 15, '删除', '/authorityTradeDeal/.*', 'DELETE', 1, '/authorityTradeDeal');
INSERT INTO `t_authority_menu_operation` VALUES (12205, 16, '新增', '/authorityTradePosition', 'POST', 1, '/authorityTradePosition');
INSERT INTO `t_authority_menu_operation` VALUES (12206, 16, '查询', '/authorityTradePosition.*', 'GET', 1, '/authorityTradePosition');
INSERT INTO `t_authority_menu_operation` VALUES (12207, 16, '修改', '/authorityTradePosition/.*', 'PUT', 1, '/authorityTradePosition');
INSERT INTO `t_authority_menu_operation` VALUES (12208, 16, '删除', '/authorityTradePosition/.*', 'DELETE', 1, '/authorityTradePosition');
INSERT INTO `t_authority_menu_operation` VALUES (12209, 17, '新增', '/authorityAccountNotifyTemplate', 'POST', 1, '/authorityAccountNotifyTemplate');
INSERT INTO `t_authority_menu_operation` VALUES (12210, 17, '查询', '/authorityAccountNotifyTemplate.*', 'GET', 1, '/authorityAccountNotifyTemplate');
INSERT INTO `t_authority_menu_operation` VALUES (12211, 17, '修改', '/authorityAccountNotifyTemplate/.*', 'PUT', 1, '/authorityAccountNotifyTemplate');
INSERT INTO `t_authority_menu_operation` VALUES (12212, 17, '删除', '/authorityAccountNotifyTemplate/.*', 'DELETE', 1, '/authorityAccountNotifyTemplate');
INSERT INTO `t_authority_menu_operation` VALUES (12213, 18, '新增', '/authorityAccountNotifyMessage', 'POST', 1, '/authorityAccountNotifyMessage');
INSERT INTO `t_authority_menu_operation` VALUES (12214, 18, '查询', '/authorityAccountNotifyMessage.*', 'GET', 1, '/authorityAccountNotifyMessage');
INSERT INTO `t_authority_menu_operation` VALUES (12215, 18, '修改', '/authorityAccountNotifyMessage/.*', 'PUT', 1, '/authorityAccountNotifyMessage');
INSERT INTO `t_authority_menu_operation` VALUES (12216, 18, '删除', '/authorityAccountNotifyMessage/.*', 'DELETE', 1, '/authorityAccountNotifyMessage');

-- ----------------------------
-- Table structure for t_authority_no_limit_uri
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_no_limit_uri`;
CREATE TABLE `t_authority_no_limit_uri`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `noLimitUri` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不限制的uri',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_noLimitUri`(`noLimitUri`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开放菜单表（无须权限认证）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_no_limit_uri
-- ----------------------------
INSERT INTO `t_authority_no_limit_uri` VALUES (4, '/authorityUser/getUserPrivileges');
INSERT INTO `t_authority_no_limit_uri` VALUES (1, '/authorityUser/login');
INSERT INTO `t_authority_no_limit_uri` VALUES (5, '/authorityUser/updatePwd');
INSERT INTO `t_authority_no_limit_uri` VALUES (3, '/swagger-resources/.*');
INSERT INTO `t_authority_no_limit_uri` VALUES (2, '/webjars/.*');

-- ----------------------------
-- Table structure for t_authority_role
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_role`;
CREATE TABLE `t_authority_role`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型id',
  `institutionId` bigint(19) NULL DEFAULT NULL COMMENT '对应机构类型下的机构id',
  `roleName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `roleDec` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `isAdmin` tinyint(3) NULL DEFAULT 0 COMMENT '1：机构下的管理员角色，0: 普通角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10174 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_role
-- ----------------------------
INSERT INTO `t_authority_role` VALUES (1, 'GROUPS', 9999, 'admin', ' 管理员', 1);
INSERT INTO `t_authority_role` VALUES (10171, 'COMPANY', 10065, '御金融公司管理员角色', '1', 1);
INSERT INTO `t_authority_role` VALUES (10172, 'COMPANY', 10066, '测试公司管理角色', '管理员', 1);
INSERT INTO `t_authority_role` VALUES (10173, 'COMPANY', 10068, '测试公司管理角色', '管理员', 1);

-- ----------------------------
-- Table structure for t_authority_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_role_menu`;
CREATE TABLE `t_authority_role_menu`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `roleId` bigint(19) NOT NULL COMMENT '自定义角色id',
  `menuId` bigint(19) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_roleId_menuId`(`roleId`, `menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23661 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_role_menu
-- ----------------------------
INSERT INTO `t_authority_role_menu` VALUES (23645, 10171, 1);
INSERT INTO `t_authority_role_menu` VALUES (23579, 10171, 2);
INSERT INTO `t_authority_role_menu` VALUES (23580, 10171, 4);
INSERT INTO `t_authority_role_menu` VALUES (23581, 10171, 5);
INSERT INTO `t_authority_role_menu` VALUES (23582, 10171, 6);
INSERT INTO `t_authority_role_menu` VALUES (23583, 10171, 7);
INSERT INTO `t_authority_role_menu` VALUES (23584, 10171, 8);
INSERT INTO `t_authority_role_menu` VALUES (23658, 10172, 2);
INSERT INTO `t_authority_role_menu` VALUES (23659, 10172, 3);
INSERT INTO `t_authority_role_menu` VALUES (23660, 10172, 4);

-- ----------------------------
-- Table structure for t_authority_role_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_role_operation`;
CREATE TABLE `t_authority_role_operation`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `roleId` bigint(19) NULL DEFAULT NULL COMMENT '自定义角色id',
  `operationId` bigint(19) NULL DEFAULT NULL COMMENT '自定义操作id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `fk_operation_role_id`(`operationId`, `roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50523 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色操作关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_role_operation
-- ----------------------------
INSERT INTO `t_authority_role_operation` VALUES (50389, 10171, 10123);
INSERT INTO `t_authority_role_operation` VALUES (50390, 10171, 10124);
INSERT INTO `t_authority_role_operation` VALUES (50391, 10171, 10125);
INSERT INTO `t_authority_role_operation` VALUES (50392, 10171, 10126);
INSERT INTO `t_authority_role_operation` VALUES (50393, 10171, 10127);
INSERT INTO `t_authority_role_operation` VALUES (50395, 10171, 10133);
INSERT INTO `t_authority_role_operation` VALUES (50396, 10171, 10134);
INSERT INTO `t_authority_role_operation` VALUES (50397, 10171, 10135);
INSERT INTO `t_authority_role_operation` VALUES (50398, 10171, 10136);
INSERT INTO `t_authority_role_operation` VALUES (50502, 10171, 12120);
INSERT INTO `t_authority_role_operation` VALUES (50394, 10171, 12146);
INSERT INTO `t_authority_role_operation` VALUES (50399, 10171, 12148);
INSERT INTO `t_authority_role_operation` VALUES (50400, 10171, 12149);
INSERT INTO `t_authority_role_operation` VALUES (50401, 10171, 12150);
INSERT INTO `t_authority_role_operation` VALUES (50402, 10171, 12151);
INSERT INTO `t_authority_role_operation` VALUES (50403, 10171, 12152);
INSERT INTO `t_authority_role_operation` VALUES (50433, 10173, 12152);
INSERT INTO `t_authority_role_operation` VALUES (50404, 10171, 12153);
INSERT INTO `t_authority_role_operation` VALUES (50434, 10173, 12153);
INSERT INTO `t_authority_role_operation` VALUES (50405, 10171, 12154);
INSERT INTO `t_authority_role_operation` VALUES (50435, 10173, 12154);
INSERT INTO `t_authority_role_operation` VALUES (50406, 10171, 12155);
INSERT INTO `t_authority_role_operation` VALUES (50436, 10173, 12155);
INSERT INTO `t_authority_role_operation` VALUES (50407, 10171, 12156);
INSERT INTO `t_authority_role_operation` VALUES (50442, 10173, 12156);
INSERT INTO `t_authority_role_operation` VALUES (50408, 10171, 12157);
INSERT INTO `t_authority_role_operation` VALUES (50443, 10173, 12157);
INSERT INTO `t_authority_role_operation` VALUES (50409, 10171, 12158);
INSERT INTO `t_authority_role_operation` VALUES (50444, 10173, 12158);
INSERT INTO `t_authority_role_operation` VALUES (50410, 10171, 12159);
INSERT INTO `t_authority_role_operation` VALUES (50514, 10172, 12159);
INSERT INTO `t_authority_role_operation` VALUES (50445, 10173, 12159);
INSERT INTO `t_authority_role_operation` VALUES (50411, 10171, 12160);
INSERT INTO `t_authority_role_operation` VALUES (50513, 10172, 12160);
INSERT INTO `t_authority_role_operation` VALUES (50446, 10173, 12160);
INSERT INTO `t_authority_role_operation` VALUES (50412, 10171, 12161);
INSERT INTO `t_authority_role_operation` VALUES (50447, 10173, 12161);
INSERT INTO `t_authority_role_operation` VALUES (50413, 10171, 12162);
INSERT INTO `t_authority_role_operation` VALUES (50437, 10173, 12162);
INSERT INTO `t_authority_role_operation` VALUES (50414, 10171, 12163);
INSERT INTO `t_authority_role_operation` VALUES (50438, 10173, 12163);
INSERT INTO `t_authority_role_operation` VALUES (50415, 10171, 12164);
INSERT INTO `t_authority_role_operation` VALUES (50439, 10173, 12164);
INSERT INTO `t_authority_role_operation` VALUES (50416, 10171, 12165);
INSERT INTO `t_authority_role_operation` VALUES (50440, 10173, 12165);
INSERT INTO `t_authority_role_operation` VALUES (50417, 10171, 12166);
INSERT INTO `t_authority_role_operation` VALUES (50441, 10173, 12166);
INSERT INTO `t_authority_role_operation` VALUES (50419, 10171, 12171);
INSERT INTO `t_authority_role_operation` VALUES (50428, 10173, 12171);
INSERT INTO `t_authority_role_operation` VALUES (50420, 10171, 12172);
INSERT INTO `t_authority_role_operation` VALUES (50429, 10173, 12172);
INSERT INTO `t_authority_role_operation` VALUES (50421, 10171, 12173);
INSERT INTO `t_authority_role_operation` VALUES (50430, 10173, 12173);
INSERT INTO `t_authority_role_operation` VALUES (50422, 10171, 12174);
INSERT INTO `t_authority_role_operation` VALUES (50431, 10173, 12174);
INSERT INTO `t_authority_role_operation` VALUES (50423, 10171, 12175);
INSERT INTO `t_authority_role_operation` VALUES (50432, 10173, 12175);
INSERT INTO `t_authority_role_operation` VALUES (50424, 10171, 12176);
INSERT INTO `t_authority_role_operation` VALUES (50448, 10173, 12176);
INSERT INTO `t_authority_role_operation` VALUES (50425, 10171, 12177);
INSERT INTO `t_authority_role_operation` VALUES (50449, 10173, 12177);
INSERT INTO `t_authority_role_operation` VALUES (50426, 10171, 12178);
INSERT INTO `t_authority_role_operation` VALUES (50450, 10173, 12178);
INSERT INTO `t_authority_role_operation` VALUES (50427, 10171, 12179);
INSERT INTO `t_authority_role_operation` VALUES (50451, 10173, 12179);
INSERT INTO `t_authority_role_operation` VALUES (50476, 10171, 12180);
INSERT INTO `t_authority_role_operation` VALUES (50477, 10171, 12181);
INSERT INTO `t_authority_role_operation` VALUES (50478, 10171, 12182);
INSERT INTO `t_authority_role_operation` VALUES (50479, 10171, 12183);
INSERT INTO `t_authority_role_operation` VALUES (50480, 10171, 12184);
INSERT INTO `t_authority_role_operation` VALUES (50481, 10171, 12185);
INSERT INTO `t_authority_role_operation` VALUES (50482, 10171, 12186);
INSERT INTO `t_authority_role_operation` VALUES (50483, 10171, 12187);
INSERT INTO `t_authority_role_operation` VALUES (50484, 10171, 12188);
INSERT INTO `t_authority_role_operation` VALUES (50485, 10171, 12189);
INSERT INTO `t_authority_role_operation` VALUES (50486, 10171, 12190);
INSERT INTO `t_authority_role_operation` VALUES (50487, 10171, 12191);
INSERT INTO `t_authority_role_operation` VALUES (50488, 10171, 12192);
INSERT INTO `t_authority_role_operation` VALUES (50489, 10171, 12193);
INSERT INTO `t_authority_role_operation` VALUES (50490, 10171, 12194);
INSERT INTO `t_authority_role_operation` VALUES (50491, 10171, 12195);
INSERT INTO `t_authority_role_operation` VALUES (50492, 10171, 12196);
INSERT INTO `t_authority_role_operation` VALUES (50499, 10171, 12197);
INSERT INTO `t_authority_role_operation` VALUES (50500, 10171, 12198);
INSERT INTO `t_authority_role_operation` VALUES (50501, 10171, 12199);
INSERT INTO `t_authority_role_operation` VALUES (50505, 10171, 12201);
INSERT INTO `t_authority_role_operation` VALUES (50506, 10171, 12202);
INSERT INTO `t_authority_role_operation` VALUES (50507, 10171, 12203);
INSERT INTO `t_authority_role_operation` VALUES (50508, 10171, 12204);
INSERT INTO `t_authority_role_operation` VALUES (50509, 10171, 12205);
INSERT INTO `t_authority_role_operation` VALUES (50510, 10171, 12206);
INSERT INTO `t_authority_role_operation` VALUES (50511, 10171, 12207);
INSERT INTO `t_authority_role_operation` VALUES (50512, 10171, 12208);
INSERT INTO `t_authority_role_operation` VALUES (50515, 10171, 12209);
INSERT INTO `t_authority_role_operation` VALUES (50516, 10171, 12210);
INSERT INTO `t_authority_role_operation` VALUES (50517, 10171, 12211);
INSERT INTO `t_authority_role_operation` VALUES (50518, 10171, 12212);
INSERT INTO `t_authority_role_operation` VALUES (50519, 10171, 12213);
INSERT INTO `t_authority_role_operation` VALUES (50520, 10171, 12214);
INSERT INTO `t_authority_role_operation` VALUES (50521, 10171, 12215);
INSERT INTO `t_authority_role_operation` VALUES (50522, 10171, 12216);

-- ----------------------------
-- Table structure for t_authority_user
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_user`;
CREATE TABLE `t_authority_user`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '自定义用户id',
  `userAccount` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号（登录用）',
  `userPassword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `userName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `lastLoginTime` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `lastLoginIp` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登陆IP',
  `createTime` datetime(0) NOT NULL COMMENT '用户创建时间',
  `creatorUserAccount` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人的账号',
  `status` tinyint(3) NOT NULL COMMENT '状态（0无效1有效）',
  `isAdmin` tinyint(3) NULL DEFAULT 0 COMMENT '是否管理员（0否1是）',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型id',
  `institutionId` bigint(19) NULL DEFAULT NULL COMMENT '对应机构类型下的机构id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_userAccount`(`userAccount`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10432 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_user
-- ----------------------------
INSERT INTO `t_authority_user` VALUES (10352, 'company_mina03', '4QrcOUm6Wau+VuBX8g+IPg==', 'company_mina03', NULL, NULL, '2019-05-17 09:08:44', '10.185.18.124', '2019-05-07 18:34:27', NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO `t_authority_user` VALUES (10429, 'test', '4QrcOUm6Wau+VuBX8g+IPg==', 'haper_center2', NULL, NULL, '2020-02-27 04:00:22', '192.168.19.1', '2019-05-10 19:27:15', NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO `t_authority_user` VALUES (10430, 'test123', 'Qpf0SxOVUjUkWySXOZ16kw==', 'test111', '', 'hxx688@163.com', '2019-08-03 10:42:11', '192.168.123.240', '2019-08-01 04:22:02', 'test', 1, 0, '', NULL, NULL);
INSERT INTO `t_authority_user` VALUES (10431, 'test12', '4QrcOUm6Wau+VuBX8g+IPg==', 'test12', '', 'test@123.com', '2019-08-03 10:29:21', NULL, '2019-08-03 10:29:21', 'test', 1, NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for t_authority_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_authority_user_role`;
CREATE TABLE `t_authority_user_role`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '序列id',
  `userId` bigint(19) NULL DEFAULT NULL COMMENT '用户id',
  `roleId` bigint(19) NOT NULL COMMENT '角色id',
  `roleName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色机构类型',
  `institutionId` bigint(19) NULL DEFAULT NULL COMMENT '角色对应机构类型下的机构id',
  `institutionName` varchar(46) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色对应的机构名称',
  `createBy` bigint(19) NULL DEFAULT NULL COMMENT '创建人id',
  `createUser` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastUpdateBy` bigint(19) NULL DEFAULT NULL COMMENT '最后跟新人id',
  `lastUpdateUser` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人名称',
  `lastUpdateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10434 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_authority_user_role
-- ----------------------------
INSERT INTO `t_authority_user_role` VALUES (10001, 10352, 10171, '御金汇公司管理员角色', 'COMPNAY', 10065, 'B端公司', 1, '系统管理员', '2019-04-22 09:24:13', 1, '系统管理员', '2019-08-03 00:15:31');
INSERT INTO `t_authority_user_role` VALUES (10002, 10429, 10171, '御金汇公司管理员角色', 'COMPANY', 10065, 'B端公司', 1, '系统管理员', '2019-04-30 10:45:00', 1, '系统管理员', '2019-08-03 00:15:34');
INSERT INTO `t_authority_user_role` VALUES (10430, 10430, 10171, '御金融公司管理员角色', 'COMPANY', 10065, '御金汇公司', 1, NULL, '2019-08-02 03:20:43', 1, NULL, '2019-08-02 03:20:43');
INSERT INTO `t_authority_user_role` VALUES (10431, 10437, 10173, '测试公司管理角色', 'COMPANY', 10068, NULL, 10429, 'haper_center2', '2019-11-21 02:21:04', 10429, 'haper_center2', '2019-11-21 02:21:04');
INSERT INTO `t_authority_user_role` VALUES (10433, 10431, 1, 'admin', 'GROUPS', 9999, NULL, 10429, 'haper_center2', '2019-11-21 04:59:14', 10429, 'haper_center2', '2019-11-21 04:59:14');

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `companyName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称\r\n             ',
  `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型',
  `contactUser` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人',
  `contactPhone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `adminUser` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员账号',
  `status` tinyint(3) NOT NULL COMMENT '状态(0:有效， 2：禁用）',
  `createUser` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lastUpdateUser` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人名称',
  `lastUpdateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accountNo`(`contactUser`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公司（交易商）表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES (1, '测试公司', 'company', 'test', '13800138000', 'tester', 1, NULL, NULL, NULL, '2019-09-26 23:50:52');
INSERT INTO `t_company` VALUES (2, '测试公司', 'COMPANY', 'tester', '13800138000', 'admin', 1, 'haper_center2', '2019-11-20 21:11:19', 'haper_center2', '2019-11-20 21:11:19');
INSERT INTO `t_company` VALUES (3, '测试公司', 'COMPANY', 'tester', '13800138000', 'admin', 1, 'haper_center2', '2019-11-20 21:15:42', 'haper_center2', '2019-11-20 21:15:42');
INSERT INTO `t_company` VALUES (4, '测试公司', 'COMPANY', 'tester', '13800138000', 'admin', 1, 'haper_center2', '2019-11-21 01:26:17', 'haper_center2', '2019-11-21 01:26:17');
INSERT INTO `t_company` VALUES (6, '测试公司', 'COMPANY', 'tester', '13800138000', 'admin', 1, 'haper_center2', '2019-11-21 02:21:04', 'haper_center2', '2019-11-21 02:21:04');
INSERT INTO `t_company` VALUES (7, '测试公司', 'COMPANY', 'tester', '13800138000', 'admin', 1, 'haper_center2', '2019-11-21 02:22:54', 'haper_center2', '2019-11-21 02:22:54');

-- ----------------------------
-- Table structure for t_institution
-- ----------------------------
DROP TABLE IF EXISTS `t_institution`;
CREATE TABLE `t_institution`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `institutionTypeId` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型id',
  `detailInstitutionId` bigint(20) NULL DEFAULT NULL COMMENT '机构关联id',
  `detailInstitutionName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构关联名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10069 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_institution
-- ----------------------------
INSERT INTO `t_institution` VALUES (10065, 'COMPANY', 192418, '御金汇公司');
INSERT INTO `t_institution` VALUES (10066, 'COMPANY', 4, '测试公司');
INSERT INTO `t_institution` VALUES (10068, 'COMPANY', 6, '测试公司');

-- ----------------------------
-- Table structure for t_institution_type
-- ----------------------------
DROP TABLE IF EXISTS `t_institution_type`;
CREATE TABLE `t_institution_type`  (
  `institutionTypeId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构类型id',
  `institutionTypeName` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型名称',
  `sort` tinyint(3) NULL DEFAULT NULL COMMENT '类型排序',
  PRIMARY KEY (`institutionTypeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构类型预置表（预置机构类型标识）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_institution_type
-- ----------------------------
INSERT INTO `t_institution_type` VALUES ('COMPANY', '交易商', 3);
INSERT INTO `t_institution_type` VALUES ('GROUPS', '顶层公司', 1);
INSERT INTO `t_institution_type` VALUES ('SERVICE_OPERATE', '运营中心', 2);

-- ----------------------------
-- Table structure for t_oauth_client_details 命名方式和其他不统一，需要注意
-- ----------------------------
DROP TABLE IF EXISTS `t_oauth_client_details`;
CREATE TABLE `t_oauth_client_details`  (
  `client_id` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_oauth_client_details
-- ----------------------------
INSERT INTO `t_oauth_client_details` VALUES ('admin', NULL, 'ISMvKXpXpadDiUoOSoAfww==', 'read_writer', 'password_refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_oauth_client_details` VALUES ('app', NULL, '0qV9wdiD/SH7mVFpnfccxw==', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');

-- ----------------------------
-- Table structure for t_seq
-- ----------------------------
DROP TABLE IF EXISTS `t_seq`;
CREATE TABLE `t_seq`  (
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键标识',
  `nextId` bigint(21) NULL DEFAULT NULL COMMENT '下一个序列ID',
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '序列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_seq
-- ----------------------------
INSERT INTO `t_seq` VALUES ('USER_ACC', 100);
INSERT INTO `t_seq` VALUES ('USER_NO', 110);

-- ----------------------------
-- Table structure for t_trade_account
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_account`;
CREATE TABLE `t_trade_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `userId` bigint(20) NOT NULL,
  `accountNo` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易账号',
  `balance` bigint(21) NULL DEFAULT NULL COMMENT '余额',
  `tradeGroupId` bigint(20) NOT NULL COMMENT '账户组ID',
  `activeTime` datetime(0) NULL DEFAULT NULL COMMENT '开户时间',
  `status` tinyint(3) NOT NULL COMMENT '状态(0:有效， 1：锁定， 2：禁用）',
  `institutionTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构类型id',
  `institutionId` bigint(19) NULL DEFAULT NULL COMMENT '对应机构类型下的机构id',
  `companyId` bigint(20) NULL DEFAULT NULL COMMENT '公司ID',
  `userName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `tradeGroupName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账户组名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accountNo`(`accountNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_trade_account
-- ----------------------------
INSERT INTO `t_trade_account` VALUES (1, 1, '8600001', 166112000, 1, '2019-08-15 19:51:00', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_trade_account` VALUES (2, 8, '8600002', 945500, 1, '2019-08-15 19:51:00', 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_trade_account_settlement
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_account_settlement`;
CREATE TABLE `t_trade_account_settlement`  (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `userId` bigint(19) NULL DEFAULT NULL COMMENT '用户ID',
  `accountId` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易账号ID',
  `dealId` bigint(21) NULL DEFAULT NULL COMMENT '成交记录ID',
  `tradeTime` datetime(0) NULL DEFAULT NULL COMMENT '交易时间',
  `stockId` bigint(19) NULL DEFAULT NULL COMMENT '股票ID',
  `stockCode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '股票代码',
  `currency` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `direction` tinyint(3) NOT NULL COMMENT '买卖方向',
  `tradeAmount` bigint(21) NULL DEFAULT NULL COMMENT '交易金额',
  `tradeVolume` bigint(19) NULL DEFAULT NULL COMMENT '交易数量',
  `tradePrice` bigint(19) NULL DEFAULT NULL COMMENT '交易价格',
  `taxes` bigint(19) NULL DEFAULT NULL COMMENT '税费（印花税+过户费+交易规费）',
  `commission` bigint(19) NULL DEFAULT NULL COMMENT '佣金',
  `status` tinyint(3) NOT NULL COMMENT '状态(0:有效， 1：删除）',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accountNo`(`accountId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 281 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账号交割结算单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_trade_account_settlement
-- ----------------------------
INSERT INTO `t_trade_account_settlement` VALUES (269, 1, '1', 20, '2019-08-26 03:41:08', 2, '601398', 'CNY', 0, 54200, 100, 542, NULL, 650, 0, '2019-08-26 09:13:49');
INSERT INTO `t_trade_account_settlement` VALUES (270, 1, '1', 21, '2019-08-26 03:45:46', 2, '601398', 'CNY', 0, 54200, 100, 542, NULL, 650, 0, '2019-08-26 09:14:01');
INSERT INTO `t_trade_account_settlement` VALUES (271, 1, '1', 22, '2019-08-26 03:54:47', 2, '601398', 'CNY', 0, 54200, 100, 542, NULL, 650, 0, '2019-08-26 09:14:13');
INSERT INTO `t_trade_account_settlement` VALUES (272, 1, '1', 23, '2019-08-26 03:55:14', 2, '601398', 'CNY', 0, 54200, 100, 542, NULL, 650, 0, '2019-08-26 09:14:15');
INSERT INTO `t_trade_account_settlement` VALUES (273, 1, '1', 24, '2019-08-26 03:55:23', 2, '601398', 'CNY', 0, 54200, 100, 542, NULL, 650, 0, '2019-08-26 09:14:15');
INSERT INTO `t_trade_account_settlement` VALUES (274, 1, '1', 25, '2019-08-26 03:56:26', 2, '601398', 'CNY', 0, 54200, 100, 542, NULL, 650, 0, '2019-08-26 09:14:15');
INSERT INTO `t_trade_account_settlement` VALUES (275, 1, '1', 26, '2019-08-26 04:21:08', 2, '601398', 'CNY', 0, 539000, 1000, 539, NULL, 6468, 0, '2019-08-26 09:14:15');
INSERT INTO `t_trade_account_settlement` VALUES (276, 1, '1', 27, '2019-08-26 07:17:42', 2, '601398', 'CNY', 0, 539000, 1000, 539, NULL, 6468, 0, '2019-08-26 09:14:15');
INSERT INTO `t_trade_account_settlement` VALUES (277, 1, '1', 1969, '2020-02-20 21:29:33', 1, '601318', 'CNY', 0, 824000000, 100000, 8240, NULL, 9888000, 0, '2020-02-25 03:04:12');
INSERT INTO `t_trade_account_settlement` VALUES (278, 1, '1', 1970, '2020-02-20 21:45:23', 1, '601318', 'CNY', 1, 823900000, 100000, 8239, NULL, 9886800, 0, '2020-02-25 03:04:12');
INSERT INTO `t_trade_account_settlement` VALUES (279, 1, '1', 1971, '2020-02-21 08:22:01', 1, '601318', 'CNY', 0, 824000000, 100000, 8240, NULL, 9888000, 0, '2020-02-25 03:04:12');
INSERT INTO `t_trade_account_settlement` VALUES (280, 1, '1', 1972, '2020-02-21 09:02:28', 1, '601318', 'CNY', 0, 824000, 100, 8240, NULL, 9888, 0, '2020-02-25 03:04:12');

-- ----------------------------
-- Table structure for t_trade_global_config
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_global_config`;
CREATE TABLE `t_trade_global_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置项编号',
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类编号(BASIC:基础配置， BUSINESS： 业务配置,  SYSTEM：系统项配置)',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置项的值',
  `status` tinyint(2) NOT NULL COMMENT '状态(0:启用， 1：禁用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_key`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统全局配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_trade_global_config
-- ----------------------------
INSERT INTO `t_trade_global_config` VALUES (1, 'REG_OPEN_ACCOUNT', 'SYSTEM', 'N', 0);

-- ----------------------------
-- Table structure for t_trade_group
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_group`;
CREATE TABLE `t_trade_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `groupNo` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户组编号',
  `groupName` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户组名称',
  `currency` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易币种（CNY:人民币， HKD：港币，USD：美元）',
  `companyId` bigint(20) NOT NULL COMMENT '公司ID',
  `commissionRate` double(4, 2) NULL DEFAULT NULL COMMENT '佣金比例， 单位：%',
  `taxesRate` double(4, 2) NULL DEFAULT NULL COMMENT '税费比例， 单位：%',
  `level` tinyint(3) NULL DEFAULT NULL COMMENT '账户等级（0：普通，1：VIP）',
  `status` tinyint(3) NOT NULL COMMENT '状态(0:启用， 1：禁用）',
  `craeteTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `companyName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_groupNo`(`groupNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_trade_group
-- ----------------------------
INSERT INTO `t_trade_group` VALUES (1, 'STANDARD', '标准组', 'CNY', 1, 1.20, NULL, NULL, 0, '2019-08-15 20:24:06', '测试公司');

-- ----------------------------
-- Table structure for t_trade_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_stock`;
CREATE TABLE `t_trade_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '股票编号',
  `categoryId` bigint(20) NOT NULL COMMENT '股票分类ID',
  `marketNo` tinyint(3) NULL DEFAULT NULL COMMENT '股票市场(0: 上交所， 1：深交所，2：港股， 3：美股）',
  `currency` double(12, 2) NULL DEFAULT NULL COMMENT '交易币种（CNY:人民币， HKD：港币，USD：美元）',
  `unit` int(11) NOT NULL DEFAULT 100 COMMENT '股票单位（默认为：100）',
  `tag` tinyint(3) NULL DEFAULT NULL COMMENT '标签(0:普通， 1：热门)',
  `status` tinyint(2) NOT NULL COMMENT '状态(0:启用， 1：禁用）',
  `marketSource` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '行情来源',
  `display_order` int(11) NULL DEFAULT NULL COMMENT '显示顺序, 升序排列',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `craeteTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `highRate` int(11) NULL DEFAULT NULL COMMENT '涨幅',
  `lowRate` int(11) NULL DEFAULT NULL COMMENT '跌幅',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_trade_stock
-- ----------------------------
INSERT INTO `t_trade_stock` VALUES (1, '中国平安', '601318', 1, 0, NULL, 100, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_trade_stock` VALUES (2, '工商银行', '601398', 1, 0, NULL, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_trade_stock` VALUES (4, '美的集团', '000333', 2, 1, NULL, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_trade_stock_category
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_stock_category`;
CREATE TABLE `t_trade_stock_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类编号',
  `status` tinyint(2) NOT NULL COMMENT '状态(0:启用， 1：禁用）',
  `startMins` bigint(255) NULL DEFAULT NULL,
  `endMins` bigint(255) NULL DEFAULT NULL,
  `commissionRate` bigint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '股票分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_trade_stock_category
-- ----------------------------
INSERT INTO `t_trade_stock_category` VALUES (1, '上证A股', 'sh', 1, 540, 1195, 112);
INSERT INTO `t_trade_stock_category` VALUES (2, '深交所', 'sz', 1, 540, 1195, 112);

-- ----------------------------
-- Table structure for t_trade_user
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_user`;
CREATE TABLE `t_trade_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `userNo` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户编号',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `userPwd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `lastLoginIp` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近一次用户登陆IP',
  `lastLoginTime` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(3) NOT NULL COMMENT '状态(0:有效， 1：锁定， 2：禁用）',
  `craeteTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `institutionTypeId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构类型id',
  `institutionId` bigint(19) NULL DEFAULT NULL COMMENT '对应机构类型下的机构id',
  `idcard` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `companyName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `companyId` bigint(20) NULL DEFAULT NULL COMMENT '公司ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userNo`(`userNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_trade_user
-- ----------------------------
INSERT INTO `t_trade_user` VALUES (1, 'admin', 'admin', 'ISMvKXpXpadDiUoOSoAfww==', '123', 'hekun@itcast.cn', NULL, NULL, '2020-02-27 07:00:16', 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_trade_user` VALUES (8, 'test', 'test123', 'test', '13800', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_trade_user` VALUES (10, '00000102', 'test123', 'test', '138001', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_trade_user` VALUES (11, '00000103', 'test123123', '123', '23213121', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_trade_user` VALUES (12, '00000104', 'test1', '123456', '13800138000', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_trade_user` VALUES (23, '00000115', '', '1qaz2w', '15011039537', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_trade_user` VALUES (24, '00000105', 'test1234', '4QrcOUm6Wau+VuBX8g+IPg==', '13800138001', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_trade_user` VALUES (29, '00000110', 'test12345', '4QrcOUm6Wau+VuBX8g+IPg==', '13800138003', 'hekun@itcast.cn', NULL, NULL, NULL, 0, NULL, 'company', NULL, NULL, '测试公司', 1);

-- ----------------------------
-- Table structure for t_trade_user_file
-- ----------------------------
DROP TABLE IF EXISTS `t_trade_user_file`;
CREATE TABLE `t_trade_user_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键标识',
  `userId` bigint(16) NOT NULL COMMENT '用户ID',
  `bizType` tinyint(3) NOT NULL COMMENT '业务类型（0：身份证， 1：银行卡， 2：信用卡）',
  `fileId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件ID',
  `filename` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `fileType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `filePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `status` tinyint(3) NOT NULL COMMENT '状态(0:有效， 1：无效）',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_trade_user_file
-- ----------------------------
INSERT INTO `t_trade_user_file` VALUES (1, 1, 0, '1201704953404592128', '123.jpg', 'image/jpeg', NULL, 0, '2019-07-26 04:02:10', '2019-07-27 01:02:05');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime(0) NOT NULL,
  `log_modified` datetime(0) NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 687 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
