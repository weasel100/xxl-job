package com.xxl.job.admin.core.model;

import java.util.Date;

/**
 * xxl-job log, used to track trigger process
 * @author xuxueli  2015-12-19 23:19:09
 */
public class XxlJobLog {
	
	private Integer id=0;

	// job info
	private Integer jobGroup=0;
	private Integer jobId=0;

	// execute info
	private String executorAddress;
	private String executorHandler;
	private String executorParam;
	private String executorShardingParam;
	private Integer executorFailRetryCount=0;

	// trigger info
	private String triggerTime;
	private Integer triggerCode=0;
	private String triggerMsg;

	// handle info
	private String handleTime;
	private Integer handleCode=0;
	private String handleMsg;

	// alarm info
	private Integer alarmStatus=0;

	@Override
	public String toString() {
		return "XxlJobLog{" +
				"id=" + id +
				", jobGroup=" + jobGroup +
				", jobId=" + jobId +
				", executorAddress='" + executorAddress + '\'' +
				", executorHandler='" + executorHandler + '\'' +
				", executorParam='" + executorParam + '\'' +
				", executorShardingParam='" + executorShardingParam + '\'' +
				", executorFailRetryCount=" + executorFailRetryCount +
				", triggerTime='" + triggerTime + '\'' +
				", triggerCode=" + triggerCode +
				", triggerMsg='" + triggerMsg + '\'' +
				", handleTime='" + handleTime + '\'' +
				", handleCode=" + handleCode +
				", handleMsg='" + handleMsg + '\'' +
				", alarmStatus=" + alarmStatus +
				'}';
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getJobGroup() {
		return jobGroup;
	}

	public void setJobGroup(Integer jobGroup) {
		this.jobGroup = jobGroup;
	}

	public Integer getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}

	public String getExecutorAddress() {
		return executorAddress;
	}

	public void setExecutorAddress(String executorAddress) {
		this.executorAddress = executorAddress;
	}

	public String getExecutorHandler() {
		return executorHandler;
	}

	public void setExecutorHandler(String executorHandler) {
		this.executorHandler = executorHandler;
	}

	public String getExecutorParam() {
		return executorParam;
	}

	public void setExecutorParam(String executorParam) {
		this.executorParam = executorParam;
	}

	public String getExecutorShardingParam() {
		return executorShardingParam;
	}

	public void setExecutorShardingParam(String executorShardingParam) {
		this.executorShardingParam = executorShardingParam;
	}

	public Integer getExecutorFailRetryCount() {
		return executorFailRetryCount;
	}

	public void setExecutorFailRetryCount(Integer executorFailRetryCount) {
		this.executorFailRetryCount = executorFailRetryCount;
	}

	public String getTriggerTime() {
		return triggerTime;
	}

	public void setTriggerTime(String triggerTime) {
		this.triggerTime = triggerTime;
	}

	public Integer getTriggerCode() {
		return triggerCode;
	}

	public void setTriggerCode(Integer triggerCode) {
		this.triggerCode = triggerCode;
	}

	public String getTriggerMsg() {
		return triggerMsg;
	}

	public void setTriggerMsg(String triggerMsg) {
		this.triggerMsg = triggerMsg;
	}

	public String getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(String handleTime) {
		this.handleTime = handleTime;
	}

	public Integer getHandleCode() {
		return handleCode;
	}

	public void setHandleCode(Integer handleCode) {
		this.handleCode = handleCode;
	}

	public String getHandleMsg() {
		return handleMsg;
	}

	public void setHandleMsg(String handleMsg) {
		this.handleMsg = handleMsg;
	}

	public Integer getAlarmStatus() {
		return alarmStatus;
	}

	public void setAlarmStatus(Integer alarmStatus) {
		this.alarmStatus = alarmStatus;
	}
}
