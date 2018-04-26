package com.monitor.model;

public class LakeStatus {
	private int consumerId;
	private String kafkaTopicNm;
	private String feedName;
	private String lastConsumedOffset;
	private String consumedOffsets;
	private String consumedSrcDtm;
	private String postedDtm;
	private String taskStatus;
	private boolean enabledInd;
	
	public String getFeedName() {
		return feedName;
	}
	public void setFeedName(String feedName) {
		this.feedName = feedName;
	}
	public String getLastConsumedOffset() {
		return lastConsumedOffset;
	}
	public void setLastConsumedOffset(String lastConsumedOffset) {
		this.lastConsumedOffset = lastConsumedOffset;
	}
	public String getConsumedOffsets() {
		return consumedOffsets;
	}
	public void setConsumedOffsets(String consumedOffsets) {
		this.consumedOffsets = consumedOffsets;
	}
	public String getConsumedSrcDtm() {
		return consumedSrcDtm;
	}
	public void setConsumedSrcDtm(String consumedSrcDtm) {
		this.consumedSrcDtm = consumedSrcDtm;
	}
	public String getPostedDtm() {
		return postedDtm;
	}
	public void setPostedDtm(String postedDtm) {
		this.postedDtm = postedDtm;
	}
	public String getTaskStatus() {
		return taskStatus;
	}
	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}
	public boolean isEnabledInd() {
		return enabledInd;
	}
	public void setEnabledInd(boolean enabledInd) {
		this.enabledInd = enabledInd;
	}
	public int getConsumerId() {
		return consumerId;
	}
	public void setConsumerId(int consumerId) {
		this.consumerId = consumerId;
	}
	public String getKafkaTopicNm() {
		return kafkaTopicNm;
	}
	public void setKafkaTopicNm(String kafkaTopicNm) {
		this.kafkaTopicNm = kafkaTopicNm;
	}

}
