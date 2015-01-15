/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : jfsnpm

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2014-10-31 16:04:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wf_cc_order
-- ----------------------------
DROP TABLE IF EXISTS `wf_cc_order`;
CREATE TABLE `wf_cc_order` (
  `order_Id` varchar(100) DEFAULT NULL COMMENT '����ʵ��ID',
  `actor_Id` varchar(100) DEFAULT NULL COMMENT '������ID',
  `status` tinyint(1) DEFAULT NULL COMMENT '״̬',
  KEY `IDX_CCORDER_ORDER` (`order_Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����ʵ����';

-- ----------------------------
-- Table structure for wf_hist_order
-- ----------------------------
DROP TABLE IF EXISTS `wf_hist_order`;
CREATE TABLE `wf_hist_order` (
  `id` varchar(100) NOT NULL COMMENT '����ID',
  `process_Id` varchar(100) NOT NULL COMMENT '���̶���ID',
  `order_State` tinyint(1) NOT NULL COMMENT '״̬',
  `creator` varchar(100) DEFAULT NULL COMMENT '������',
  `create_Time` varchar(50) NOT NULL COMMENT '����ʱ��',
  `end_Time` varchar(50) DEFAULT NULL COMMENT '���ʱ��',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '�������ʱ��',
  `priority` tinyint(1) DEFAULT NULL COMMENT '���ȼ�',
  `parent_Id` varchar(100) DEFAULT NULL COMMENT '������ID',
  `order_No` varchar(100) DEFAULT NULL COMMENT '����ʵ�����',
  `variable` varchar(2000) DEFAULT NULL COMMENT '��������json�洢',
  PRIMARY KEY (`id`),
  KEY `IDX_HIST_ORDER_PROCESSID` (`process_Id`) USING BTREE,
  KEY `IDX_HIST_ORDER_NO` (`order_No`) USING BTREE,
  KEY `FK_HIST_ORDER_PARENTID` (`parent_Id`) USING BTREE,
  CONSTRAINT `wf_hist_order_ibfk_1` FOREIGN KEY (`parent_Id`) REFERENCES `wf_hist_order` (`id`),
  CONSTRAINT `wf_hist_order_ibfk_2` FOREIGN KEY (`process_Id`) REFERENCES `wf_process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ʷ����ʵ����';

-- ----------------------------
-- Table structure for wf_hist_task
-- ----------------------------
DROP TABLE IF EXISTS `wf_hist_task`;
CREATE TABLE `wf_hist_task` (
  `id` varchar(100) NOT NULL COMMENT '����ID',
  `order_Id` varchar(100) NOT NULL COMMENT '����ʵ��ID',
  `task_Name` varchar(100) NOT NULL COMMENT '��������',
  `display_Name` varchar(200) NOT NULL COMMENT '������ʾ����',
  `task_Type` tinyint(1) NOT NULL COMMENT '��������',
  `perform_Type` tinyint(1) DEFAULT NULL COMMENT '��������',
  `task_State` tinyint(1) NOT NULL COMMENT '����״̬',
  `operator` varchar(100) DEFAULT NULL COMMENT '��������',
  `create_Time` varchar(50) NOT NULL COMMENT '���񴴽�ʱ��',
  `finish_Time` varchar(50) DEFAULT NULL COMMENT '�������ʱ��',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '�����������ʱ��',
  `action_Url` varchar(200) DEFAULT NULL COMMENT '������url',
  `parent_Task_Id` varchar(100) DEFAULT NULL COMMENT '������ID',
  `variable` varchar(2000) DEFAULT NULL COMMENT '��������json�洢',
  PRIMARY KEY (`id`),
  KEY `IDX_HIST_TASK_ORDER` (`order_Id`) USING BTREE,
  KEY `IDX_HIST_TASK_TASKNAME` (`task_Name`) USING BTREE,
  KEY `IDX_HIST_TASK_PARENTTASK` (`parent_Task_Id`) USING BTREE,
  CONSTRAINT `wf_hist_task_ibfk_1` FOREIGN KEY (`order_Id`) REFERENCES `wf_hist_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ʷ�����';

-- ----------------------------
-- Table structure for wf_hist_task_actor
-- ----------------------------
DROP TABLE IF EXISTS `wf_hist_task_actor`;
CREATE TABLE `wf_hist_task_actor` (
  `task_Id` varchar(100) NOT NULL COMMENT '����ID',
  `actor_Id` varchar(100) NOT NULL COMMENT '������ID',
  KEY `IDX_HIST_TASKACTOR_TASK` (`task_Id`) USING BTREE,
  CONSTRAINT `wf_hist_task_actor_ibfk_1` FOREIGN KEY (`task_Id`) REFERENCES `wf_hist_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ʷ��������߱�';

-- ----------------------------
-- Table structure for wf_order
-- ----------------------------
DROP TABLE IF EXISTS `wf_order`;
CREATE TABLE `wf_order` (
  `id` varchar(100) NOT NULL COMMENT '����ID',
  `parent_Id` varchar(100) DEFAULT NULL COMMENT '������ID',
  `process_Id` varchar(100) NOT NULL COMMENT '���̶���ID',
  `creator` varchar(100) DEFAULT NULL COMMENT '������',
  `create_Time` varchar(50) NOT NULL COMMENT '����ʱ��',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '�������ʱ��',
  `last_Update_Time` varchar(50) DEFAULT NULL COMMENT '�ϴθ���ʱ��',
  `last_Updator` varchar(100) DEFAULT NULL COMMENT '�ϴθ�����',
  `priority` tinyint(1) DEFAULT NULL COMMENT '���ȼ�',
  `parent_Node_Name` varchar(100) DEFAULT NULL COMMENT '�����������Ľڵ�����',
  `order_No` varchar(100) DEFAULT NULL COMMENT '����ʵ�����',
  `variable` varchar(2000) DEFAULT NULL COMMENT '��������json�洢',
  `version` int(3) DEFAULT NULL COMMENT '�汾',
  PRIMARY KEY (`id`),
  KEY `IDX_ORDER_PROCESSID` (`process_Id`) USING BTREE,
  KEY `IDX_ORDER_NO` (`order_No`) USING BTREE,
  KEY `FK_ORDER_PARENTID` (`parent_Id`) USING BTREE,
  CONSTRAINT `wf_order_ibfk_1` FOREIGN KEY (`parent_Id`) REFERENCES `wf_order` (`id`),
  CONSTRAINT `wf_order_ibfk_2` FOREIGN KEY (`process_Id`) REFERENCES `wf_process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����ʵ����';

-- ----------------------------
-- Table structure for wf_process
-- ----------------------------
DROP TABLE IF EXISTS `wf_process`;
CREATE TABLE `wf_process` (
  `id` varchar(100) NOT NULL COMMENT '����ID',
  `name` varchar(100) DEFAULT NULL COMMENT '��������',
  `display_Name` varchar(200) DEFAULT NULL COMMENT '������ʾ����',
  `type` varchar(100) DEFAULT NULL COMMENT '��������',
  `instance_Url` varchar(200) DEFAULT NULL COMMENT 'ʵ��url',
  `state` tinyint(1) DEFAULT NULL COMMENT '�����Ƿ����',
  `content` longblob COMMENT '����ģ�Ͷ���',
  `version` int(2) DEFAULT NULL COMMENT '�汾',
  `create_Time` varchar(50) DEFAULT NULL COMMENT '����ʱ��',
  `creator` varchar(50) DEFAULT NULL COMMENT '������',
  PRIMARY KEY (`id`),
  KEY `IDX_PROCESS_NAME` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���̶����';

-- ----------------------------
-- Table structure for wf_surrogate
-- ----------------------------
DROP TABLE IF EXISTS `wf_surrogate`;
CREATE TABLE `wf_surrogate` (
  `id` varchar(100) NOT NULL COMMENT '����ID',
  `process_Name` varchar(100) DEFAULT NULL COMMENT '��������',
  `operator` varchar(100) DEFAULT NULL COMMENT '��Ȩ��',
  `surrogate` varchar(100) DEFAULT NULL COMMENT '������',
  `odate` varchar(64) DEFAULT NULL COMMENT '����ʱ��',
  `sdate` varchar(64) DEFAULT NULL COMMENT '��ʼʱ��',
  `edate` varchar(64) DEFAULT NULL COMMENT '����ʱ��',
  `state` tinyint(1) DEFAULT NULL COMMENT '״̬',
  PRIMARY KEY (`id`),
  KEY `IDX_SURROGATE_OPERATOR` (`operator`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ί�д����';

-- ----------------------------
-- Table structure for wf_task
-- ----------------------------
DROP TABLE IF EXISTS `wf_task`;
CREATE TABLE `wf_task` (
  `id` varchar(100) NOT NULL COMMENT '����ID',
  `order_Id` varchar(100) NOT NULL COMMENT '����ʵ��ID',
  `task_Name` varchar(100) NOT NULL COMMENT '��������',
  `display_Name` varchar(200) NOT NULL COMMENT '������ʾ����',
  `task_Type` tinyint(1) NOT NULL COMMENT '��������',
  `perform_Type` tinyint(1) DEFAULT NULL COMMENT '��������',
  `operator` varchar(100) DEFAULT NULL COMMENT '��������',
  `create_Time` varchar(50) DEFAULT NULL COMMENT '���񴴽�ʱ��',
  `finish_Time` varchar(50) DEFAULT NULL COMMENT '�������ʱ��',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '�����������ʱ��',
  `action_Url` varchar(200) DEFAULT NULL COMMENT '�������url',
  `parent_Task_Id` varchar(100) DEFAULT NULL COMMENT '������ID',
  `variable` varchar(2000) DEFAULT NULL COMMENT '��������json�洢',
  `version` tinyint(1) DEFAULT NULL COMMENT '�汾',
  PRIMARY KEY (`id`),
  KEY `IDX_TASK_ORDER` (`order_Id`) USING BTREE,
  KEY `IDX_TASK_TASKNAME` (`task_Name`) USING BTREE,
  KEY `IDX_TASK_PARENTTASK` (`parent_Task_Id`) USING BTREE,
  CONSTRAINT `wf_task_ibfk_1` FOREIGN KEY (`order_Id`) REFERENCES `wf_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����';

-- ----------------------------
-- Table structure for wf_task_actor
-- ----------------------------
DROP TABLE IF EXISTS `wf_task_actor`;
CREATE TABLE `wf_task_actor` (
  `task_Id` varchar(100) NOT NULL COMMENT '����ID',
  `actor_Id` varchar(100) NOT NULL COMMENT '������ID',
  KEY `IDX_TASKACTOR_TASK` (`task_Id`) USING BTREE,
  CONSTRAINT `wf_task_actor_ibfk_1` FOREIGN KEY (`task_Id`) REFERENCES `wf_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������߱�';
