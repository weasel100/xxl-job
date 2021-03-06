package com.xxl.job.admin.core.model;

import java.util.Date;

/**
 * xxl-job info
 *
 * @author xuxueli  2016-1-12 18:25:49
 */
public class XxlJobInfo {
	
	private Integer id=0;				// 主键ID	    (JobKey.name)

	private Integer jobGroup=0;		// 执行器主键ID	(JobKey.group)
	private String jobCron;		// 任务执行CRON表达式 【base on quartz】
	private String jobDesc;

	private Date addTime=new Date();
	private Date updateTime=new Date();

	private String author;		// 负责人
	private String alarmEmail;	// 报警邮件

	private String executorRouteStrategy;	// 执行器路由策略
	private String executorHandler;		    // 执行器，任务Handler名称
	private String executorParam;		    // 执行器，任务参数
	private String executorBlockStrategy;	// 阻塞处理策略
	private Integer executorTimeout=0;     		// 任务执行超时时间，单位秒
	private Integer executorFailRetryCount=0;		// 失败重试次数

	private String glueType;		// GLUE类型	#com.xxl.job.core.glue.GlueTypeEnum
	private String glueSource;		// GLUE源代码
	private String glueRemark;		// GLUE备注
	private Date glueUpdatetime=new Date();	// GLUE更新时间

	private String childJobId;		// 子任务ID，多个逗号分隔

	// copy from quartz
	private String jobStatus="0";		// 任务状态 【base on quartz】

	@Override
	public String toString() {
		return "XxlJobInfo{" +
				"id=" + id +
				", jobGroup=" + jobGroup +
				", jobCron='" + jobCron + '\'' +
				", jobDesc='" + jobDesc + '\'' +
				", addTime=" + addTime +
				", updateTime=" + updateTime +
				", author='" + author + '\'' +
				", alarmEmail='" + alarmEmail + '\'' +
				", executorRouteStrategy='" + executorRouteStrategy + '\'' +
				", executorHandler='" + executorHandler + '\'' +
				", executorParam='" + executorParam + '\'' +
				", executorBlockStrategy='" + executorBlockStrategy + '\'' +
				", executorTimeout=" + executorTimeout +
				", executorFailRetryCount=" + executorFailRetryCount +
				", glueType='" + glueType + '\'' +
				", glueSource='" + glueSource + '\'' +
				", glueRemark='" + glueRemark + '\'' +
				", glueUpdatetime=" + glueUpdatetime +
				", childJobId='" + childJobId + '\'' +
				", jobStatus='" + jobStatus + '\'' +
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

	public String getJobCron() {
		return jobCron;
	}

	public void setJobCron(String jobCron) {
		this.jobCron = jobCron;
	}

	public String getJobDesc() {
		return jobDesc;
	}

	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAlarmEmail() {
		return alarmEmail;
	}

	public void setAlarmEmail(String alarmEmail) {
		this.alarmEmail = alarmEmail;
	}

	public String getExecutorRouteStrategy() {
		return executorRouteStrategy;
	}

	public void setExecutorRouteStrategy(String executorRouteStrategy) {
		this.executorRouteStrategy = executorRouteStrategy;
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

	public String getExecutorBlockStrategy() {
		return executorBlockStrategy;
	}

	public void setExecutorBlockStrategy(String executorBlockStrategy) {
		this.executorBlockStrategy = executorBlockStrategy;
	}

	public Integer getExecutorTimeout() {
		return executorTimeout;
	}

	public void setExecutorTimeout(Integer executorTimeout) {
		this.executorTimeout = executorTimeout;
	}

	public Integer getExecutorFailRetryCount() {
		return executorFailRetryCount;
	}

	public void setExecutorFailRetryCount(Integer executorFailRetryCount) {
		this.executorFailRetryCount = executorFailRetryCount;
	}

	public String getGlueType() {
		return glueType;
	}

	public void setGlueType(String glueType) {
		this.glueType = glueType;
	}

	public String getGlueSource() {
		return glueSource;
	}

	public void setGlueSource(String glueSource) {
		this.glueSource = glueSource;
	}

	public String getGlueRemark() {
		return glueRemark;
	}

	public void setGlueRemark(String glueRemark) {
		this.glueRemark = glueRemark;
	}

	public Date getGlueUpdatetime() {
		return glueUpdatetime;
	}

	public void setGlueUpdatetime(Date glueUpdatetime) {
		this.glueUpdatetime = glueUpdatetime;
	}

	public String getChildJobId() {
		return childJobId;
	}

	public void setChildJobId(String childJobId) {
		this.childJobId = childJobId;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}
}
