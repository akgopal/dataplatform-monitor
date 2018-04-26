package com.monitor.model;

public class SourceCloverStatus {
	private String serverName;
	private String taskName;
	private String taskStatus;
	private String statusTime;
	private int tableCount;
	private String startTime;
	private String finishTime;
	private int sourceLatency;
	private String sourceCurrentDtm;
	private String sourceTransDtm;
	private String sourceTailDtm;
	
	public String getServerName() {
		return serverName;
	}
	public void setServerName(String serverName) {
		this.serverName = serverName;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getTaskStatus() {
		return taskStatus;
	}
	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}
	public String getStatusTime() {
		return statusTime;
	}
	public void setStatusTime(String statusTime) {
		this.statusTime = statusTime;
	}
	
	public void setSourceLatency(int sourceLatency) {
		this.sourceLatency = sourceLatency;
	}
	public int getSourceLatency() {
		return sourceLatency;
	}	
	public String getSourceCurrentDtm() {
		return sourceCurrentDtm;
	}
	public void setSourceCurrentDtm(String sourceCurrentDtm) {		
		this.sourceCurrentDtm = sourceCurrentDtm;
	}
	public String getSourceTransDtm() {
		return sourceTransDtm;
	}
	public void setSourceTransDtm(String sourceTransDtm) {
		this.sourceTransDtm = sourceTransDtm;
	}
	public String getSourceTailDtm() {
		return sourceTailDtm;
	}
	public void setSourceTailDtm(String sourceTailDtm) {
		this.sourceTailDtm = sourceTailDtm;
	}
	public String getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public int getTableCount() {
		return tableCount;
	}
	public void setTableCount(int tableCount) {
		this.tableCount = tableCount;
	}	
}
