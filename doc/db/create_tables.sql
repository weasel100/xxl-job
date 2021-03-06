DROP TABLE JOB_QRTZ_SIMPROP_TRIGGERS;
DROP TABLE JOB_QRTZ_BLOB_TRIGGERS;
DROP TABLE JOB_QRTZ_CALENDARS;
DROP TABLE JOB_QRTZ_SIMPLE_TRIGGERS;
DROP TABLE JOB_QRTZ_CRON_TRIGGERS;
DROP TABLE JOB_QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE JOB_QRTZ_FIRED_TRIGGERS;
DROP TABLE JOB_QRTZ_SCHEDULER_STATE;
DROP TABLE JOB_QRTZ_LOCKS;
DROP TABLE JOB_QRTZ_TRIGGER_INFO;
DROP TABLE JOB_QRTZ_TRIGGER_LOG;
DROP TABLE JOB_QRTZ_TRIGGER_LOGGLUE;
DROP TABLE JOB_QRTZ_TRIGGER_REGISTRY;
DROP TABLE JOB_QRTZ_TRIGGER_GROUP;
DROP TABLE JOB_QRTZ_TRIGGERS;
DROP TABLE JOB_QRTZ_JOB_DETAILS;

CREATE TABLE JOB_QRTZ_JOB_DETAILS
(
   SCHED_NAME          VARCHAR2 (120 CHAR) NOT NULL,
   JOB_NAME            VARCHAR2 (200 CHAR) NOT NULL,
   JOB_GROUP           VARCHAR2 (200 CHAR) NOT NULL,
   DESCRIPTION         VARCHAR2 (250 CHAR) NULL,
   JOB_CLASS_NAME      VARCHAR2 (250 CHAR) NOT NULL,
   IS_DURABLE          VARCHAR2 (1 CHAR) NOT NULL,
   IS_NONCONCURRENT    VARCHAR2 (1 CHAR) NOT NULL,
   IS_UPDATE_DATA      VARCHAR2 (1 CHAR) NOT NULL,
   REQUESTS_RECOVERY   VARCHAR2 (1 CHAR) NOT NULL,
   JOB_DATA            BLOB NULL,
   PRIMARY KEY (SCHED_NAME, JOB_NAME, JOB_GROUP)
);

CREATE TABLE JOB_QRTZ_TRIGGERS
(
   SCHED_NAME       VARCHAR2 (120 CHAR) NOT NULL,
   TRIGGER_NAME     VARCHAR2 (200 CHAR) NOT NULL,
   TRIGGER_GROUP    VARCHAR2 (200 CHAR) NOT NULL,
   JOB_NAME         VARCHAR2 (200 CHAR) NOT NULL,
   JOB_GROUP        VARCHAR2 (200 CHAR) NOT NULL,
   DESCRIPTION      VARCHAR2 (250 CHAR) NULL,
   NEXT_FIRE_TIME   INTEGER NULL,
   PREV_FIRE_TIME   INTEGER NULL,
   PRIORITY         INTEGER NULL,
   TRIGGER_STATE    VARCHAR2 (16 CHAR) NOT NULL,
   TRIGGER_TYPE     VARCHAR2 (8 CHAR) NOT NULL,
   START_TIME       INTEGER NOT NULL,
   END_TIME         INTEGER NULL,
   CALENDAR_NAME    VARCHAR2 (200 CHAR) NULL,
   MISFIRE_INSTR    INTEGER NULL,
   JOB_DATA         BLOB NULL,
   PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
   FOREIGN KEY (SCHED_NAME, JOB_NAME, JOB_GROUP) REFERENCES JOB_QRTZ_JOB_DETAILS (SCHED_NAME, JOB_NAME, JOB_GROUP)
);

CREATE TABLE JOB_QRTZ_SIMPLE_TRIGGERS
(
   SCHED_NAME        VARCHAR2 (120 CHAR) NOT NULL,
   TRIGGER_NAME      VARCHAR2 (200 CHAR) NOT NULL,
   TRIGGER_GROUP     VARCHAR2 (200 CHAR) NOT NULL,
   REPEAT_COUNT      INTEGER NOT NULL,
   REPEAT_INTERVAL   INTEGER NOT NULL,
   TIMES_TRIGGERED   INTEGER NOT NULL,
   PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
   FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP) REFERENCES JOB_QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE JOB_QRTZ_CRON_TRIGGERS
(
   SCHED_NAME        VARCHAR2 (120 CHAR) NOT NULL,
   TRIGGER_NAME      VARCHAR2 (200 CHAR) NOT NULL,
   TRIGGER_GROUP     VARCHAR2 (200 CHAR) NOT NULL,
   CRON_EXPRESSION   VARCHAR2 (200 CHAR) NOT NULL,
   TIME_ZONE_ID      VARCHAR2 (80 CHAR),
   PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
   FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP) REFERENCES JOB_QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE JOB_QRTZ_SIMPROP_TRIGGERS
(
   SCHED_NAME      VARCHAR2 (120 CHAR) NOT NULL,
   TRIGGER_NAME    VARCHAR2 (200 CHAR) NOT NULL,
   TRIGGER_GROUP   VARCHAR2 (200 CHAR) NOT NULL,
   STR_PROP_1      VARCHAR2 (512 CHAR) NULL,
   STR_PROP_2      VARCHAR2 (512 CHAR) NULL,
   STR_PROP_3      VARCHAR2 (512 CHAR) NULL,
   INT_PROP_1      INTEGER NULL,
   INT_PROP_2      INTEGER NULL,
   LONG_PROP_1     INTEGER NULL,
   LONG_PROP_2     INTEGER NULL,
   DEC_PROP_1      NUMERIC (13, 4) NULL,
   DEC_PROP_2      NUMERIC (13, 4) NULL,
   BOOL_PROP_1     VARCHAR2 (1 CHAR) NULL,
   BOOL_PROP_2     VARCHAR2 (1 CHAR) NULL,
   PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
   FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP) REFERENCES JOB_QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE JOB_QRTZ_BLOB_TRIGGERS
(
   SCHED_NAME      VARCHAR2 (120 CHAR) NOT NULL,
   TRIGGER_NAME    VARCHAR2 (200 CHAR) NOT NULL,
   TRIGGER_GROUP   VARCHAR2 (200 CHAR) NOT NULL,
   BLOB_DATA       BLOB NULL,
   PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
   FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP) REFERENCES JOB_QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE JOB_QRTZ_CALENDARS
(
   SCHED_NAME      VARCHAR2 (120 CHAR) NOT NULL,
   CALENDAR_NAME   VARCHAR2 (200 CHAR) NOT NULL,
   CALENDAR        BLOB NOT NULL,
   PRIMARY KEY (SCHED_NAME, CALENDAR_NAME)
);

CREATE TABLE JOB_QRTZ_PAUSED_TRIGGER_GRPS
(
   SCHED_NAME      VARCHAR2 (120 CHAR) NOT NULL,
   TRIGGER_GROUP   VARCHAR2 (200 CHAR) NOT NULL,
   PRIMARY KEY (SCHED_NAME, TRIGGER_GROUP)
);

CREATE TABLE JOB_QRTZ_FIRED_TRIGGERS
(
   SCHED_NAME          VARCHAR2 (120 CHAR) NOT NULL,
   ENTRY_ID            VARCHAR2 (95 CHAR) NOT NULL,
   TRIGGER_NAME        VARCHAR2 (200 CHAR) NOT NULL,
   TRIGGER_GROUP       VARCHAR2 (200 CHAR) NOT NULL,
   INSTANCE_NAME       VARCHAR2 (200 CHAR) NOT NULL,
   FIRED_TIME          INTEGER NOT NULL,
   SCHED_TIME          INTEGER NOT NULL,
   PRIORITY            INTEGER NOT NULL,
   STATE               VARCHAR2 (16 CHAR) NOT NULL,
   JOB_NAME            VARCHAR2 (200 CHAR) NULL,
   JOB_GROUP           VARCHAR2 (200 CHAR) NULL,
   IS_NONCONCURRENT    VARCHAR2 (1 CHAR) NULL,
   REQUESTS_RECOVERY   VARCHAR2 (1 CHAR) NULL,
   PRIMARY KEY (SCHED_NAME, ENTRY_ID)
);

CREATE TABLE JOB_QRTZ_SCHEDULER_STATE
(
   SCHED_NAME          VARCHAR2 (120 CHAR) NOT NULL,
   INSTANCE_NAME       VARCHAR2 (200 CHAR) NOT NULL,
   LAST_CHECKIN_TIME   INTEGER NOT NULL,
   CHECKIN_INTERVAL    INTEGER NOT NULL,
   PRIMARY KEY (SCHED_NAME, INSTANCE_NAME)
);

CREATE TABLE JOB_QRTZ_LOCKS
(
   SCHED_NAME   VARCHAR2 (120 CHAR) NOT NULL,
   LOCK_NAME    VARCHAR2 (40 CHAR) NOT NULL,
   PRIMARY KEY (SCHED_NAME, LOCK_NAME)
);



CREATE TABLE JOB_QRTZ_TRIGGER_INFO
(
   id                          INTEGER NOT NULL,
   job_group                   INTEGER NOT NULL,
   job_cron                    VARCHAR2 (128 CHAR) NOT NULL,
   job_desc                    VARCHAR2 (255 CHAR) NOT NULL,
   add_time                    DATE DEFAULT NULL,
   update_time                 DATE DEFAULT NULL,
   author                      VARCHAR2 (64 CHAR) DEFAULT NULL,
   alarm_email                 VARCHAR2 (255 CHAR) DEFAULT NULL,
   executor_route_strategy     VARCHAR2 (50 CHAR) DEFAULT NULL,
   executor_handler            VARCHAR2 (255 CHAR) DEFAULT NULL,
   executor_param              VARCHAR2 (512 CHAR) DEFAULT NULL,
   executor_block_strategy     VARCHAR2 (50 CHAR) DEFAULT NULL,
   executor_timeout            INTEGER NOT NULL,
   executor_fail_retry_count   INTEGER NOT NULL,
   glue_type                   VARCHAR2 (50 CHAR) NOT NULL,
   glue_source                 CLOB,
   glue_remark                 VARCHAR2 (128 CHAR) DEFAULT NULL,
   glue_updatetime             DATE DEFAULT NULL,
   child_jobid                 VARCHAR2 (255 CHAR) DEFAULT NULL,
   PRIMARY KEY (id)
);
alter table JOB_QRTZ_TRIGGER_INFO modify executor_timeout default 0;
alter table JOB_QRTZ_TRIGGER_INFO modify executor_fail_retry_count default 0;
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.job_group IS '执行器主键ID';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.job_cron IS '任务执行CRON';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.author IS '作者';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.alarm_email IS '报警邮件';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.executor_route_strategy IS '执行器路由策略';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.executor_handler IS '执行器任务handler';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.executor_param IS '执行器任务参数';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.executor_block_strategy IS '阻塞处理策略';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.executor_timeout IS '任务执行超时时间，单位秒';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.executor_fail_retry_count IS '失败重试次数';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.glue_type IS 'GLUE类型';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.glue_source IS 'GLUE源代码';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.glue_remark IS 'GLUE备注';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.glue_updatetime IS 'GLUE更新时间';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_INFO.child_jobid IS '子任务ID，多个逗号分隔';

CREATE TABLE JOB_QRTZ_TRIGGER_LOG
(
   id                          INTEGER NOT NULL,
   job_group                   INTEGER NOT NULL,
   job_id                      INTEGER NOT NULL,
   executor_address            VARCHAR2 (255 CHAR) DEFAULT NULL,
   executor_handler            VARCHAR2 (255 CHAR) DEFAULT NULL,
   executor_param              VARCHAR2 (512 CHAR) DEFAULT NULL,
   executor_sharding_param     VARCHAR2 (20 CHAR) DEFAULT NULL,
   executor_fail_retry_count   INTEGER NOT NULL,
   trigger_time                DATE DEFAULT NULL,
   trigger_code                INTEGER NOT NULL,
   trigger_msg                 CLOB,
   handle_time                 DATE DEFAULT NULL,
   handle_code                 INTEGER NOT NULL,
   handle_msg                  CLOB,
   alarm_status                INTEGER NOT NULL,
   PRIMARY KEY (id)
);

CREATE INDEX I_TRIGGER_LOG_TRIGGER_TIME
   ON JOB_QRTZ_TRIGGER_LOG (trigger_time);

CREATE INDEX I_TRIGGER_LOG_HANDLE_CODE
   ON JOB_QRTZ_TRIGGER_LOG (handle_code);

alter table JOB_QRTZ_TRIGGER_LOG modify executor_fail_retry_count default 0;
alter table JOB_QRTZ_TRIGGER_LOG modify alarm_status default 0;
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.job_group IS '执行器主键ID';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.job_id IS '任务，主键ID';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.executor_address IS '执行器地址，本次执行的地址';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.executor_handler IS '执行器任务handler';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.executor_param IS '执行器任务参数';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.executor_sharding_param IS '执行器任务分片参数，格式如 1/2';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.executor_fail_retry_count IS '失败重试次数';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.trigger_time IS '调度-时间';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.trigger_code IS '调度-结果';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.trigger_msg IS '调度-日志';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.handle_time IS '执行-时间';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.handle_code IS '执行-状态';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.handle_msg IS '执行-日志';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOG.alarm_status IS '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败';

CREATE TABLE JOB_QRTZ_TRIGGER_LOGGLUE
(
   id            INTEGER NOT NULL,
   job_id        INTEGER NOT NULL,
   glue_type     VARCHAR2 (50 CHAR) DEFAULT NULL,
   glue_source   CLOB,
   glue_remark   VARCHAR2 (128 CHAR) NOT NULL,
   add_time      Date NULL,
   update_time   Date NULL ,
   PRIMARY KEY (id)
);

alter table JOB_QRTZ_TRIGGER_LOGGLUE modify update_time default sysdate;
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOGGLUE.job_id IS '任务，主键ID';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOGGLUE.glue_type IS 'GLUE类型';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOGGLUE.glue_source IS 'GLUE源代码';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_LOGGLUE.glue_remark IS 'GLUE备注';

CREATE TABLE JOB_QRTZ_TRIGGER_REGISTRY
(
   id               INTEGER NOT NULL,
   registry_group   VARCHAR2 (255 CHAR) NOT NULL,
   registry_key     VARCHAR2 (255 CHAR) NOT NULL,
   registry_value   VARCHAR2 (255 CHAR) NOT NULL,
   update_time      date NOT NULL,
   PRIMARY KEY (id)
);
alter table JOB_QRTZ_TRIGGER_REGISTRY modify update_time default sysdate;

CREATE TABLE JOB_QRTZ_TRIGGER_GROUP
(
   id             INTEGER NOT NULL,
   app_name       VARCHAR2 (64 CHAR) NOT NULL,
   title          VARCHAR2 (12 CHAR) NOT NULL,
   orderk         INTEGER NOT NULL,
   address_type   INTEGER NOT NULL,
   address_list   VARCHAR2 (512),
   PRIMARY KEY (id)
);

COMMENT ON COLUMN JOB_QRTZ_TRIGGER_GROUP.app_name IS '执行器AppName';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_GROUP.title IS '执行器名称';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_GROUP.orderk IS '排序';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_GROUP.address_type IS '执行器地址类型：0=自动注册、1=手动录入';
COMMENT ON COLUMN JOB_QRTZ_TRIGGER_GROUP.address_list IS '执行器地址列表，多地址逗号分隔';
DROP SEQUENCE JOB_QRTZ_TRIGGER_INFO_ID;
CREATE SEQUENCE JOB_QRTZ_TRIGGER_INFO_ID
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCACHE
NOCYCLE
NOORDER
NOKEEP
GLOBAL;

DROP SEQUENCE JOB_QRTZ_TRIGGER_LOG_ID;
CREATE SEQUENCE JOB_QRTZ_TRIGGER_LOG_ID
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCACHE
NOCYCLE
NOORDER
NOKEEP
GLOBAL;
DROP SEQUENCE JOB_QRTZ_TRIGGER_LOGGLUE_ID;
CREATE SEQUENCE JOB_QRTZ_TRIGGER_LOGGLUE_ID
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCACHE
NOCYCLE
NOORDER
NOKEEP
GLOBAL;
DROP SEQUENCE JOB_QRTZ_TRIGGER_REGISTRY_ID;
CREATE SEQUENCE JOB_QRTZ_TRIGGER_REGISTRY_ID
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCACHE
NOCYCLE
NOORDER
NOKEEP
GLOBAL;
DROP SEQUENCE JOB_QRTZ_TRIGGER_GROUP_ID;
CREATE SEQUENCE JOB_QRTZ_TRIGGER_GROUP_ID
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCACHE
NOCYCLE
NOORDER
NOKEEP
GLOBAL;


INSERT INTO  JOB_QRTZ_TRIGGER_GROUP ( id ,  app_name ,  title , orderk ,  address_type ,  address_list )
    VALUES (1, 'xxl-job-executor-sample', '示例执行器', 1, 0, '');

COMMIT;

