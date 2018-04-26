package com.monitor.model;

public class SourceHealth {	
	private String serverName;
	private String orgName;	
	private String taskStatus;
	private int latency;
	
	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getServerName() {
		return serverName;		
	}	

	public void setServerName(String serverName) {
		this.serverName = serverName;		
	}		
		
	public String getTaskStatus() {
		return taskStatus;		
	}		
	
	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;		
	}		
	
	public int getlatency() {
		return latency;		
	}	

	public void setlatency(int latency) {
		this.latency = latency;		
	}					  		
}
