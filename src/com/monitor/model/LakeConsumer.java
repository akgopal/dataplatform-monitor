package com.monitor.model;

public class LakeConsumer {
	private String topicNm, azureStorage, taskNm;
	private int consumerId;
	private boolean enabledInd;
	
	public String getTopicNm() {
		return topicNm;
	}
	public void setTopicNm(String topicNm) {
		this.topicNm = topicNm;
	}
	public String getAzureStorage() {
		return azureStorage;
	}
	public void setAzureStorage(String azureStorage) {
		this.azureStorage = azureStorage;
	}
	public String getTaskNm() {
		return taskNm;
	}
	public void setTaskNm(String taskNm) {
		this.taskNm = taskNm;
	}
	public int getConsumerId() {
		return consumerId;
	}
	public void setConsumerId(int consumerId) {
		this.consumerId = consumerId;
	}
	public boolean getEnabledInd() {
		return enabledInd;
	}
	public void setEnabledInd(boolean enabledInd) {
		this.enabledInd = enabledInd;
	}
	
}
