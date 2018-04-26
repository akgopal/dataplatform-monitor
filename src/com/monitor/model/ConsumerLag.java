package com.monitor.model;

public class ConsumerLag {
	private String consumerGroup, topic, partitionStatus, postedDt;
	private int partition;
	private long startLag, startOffset, endLag, endOffset;
	public String getConsumerGroup() {
		return consumerGroup;
	}
	public void setConsumerGroup(String consumerGroup) {
		this.consumerGroup = consumerGroup;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getPartitionStatus() {
		return partitionStatus;
	}
	public void setPartitionStatus(String partitionStatus) {
		this.partitionStatus = partitionStatus;
	}
	public String getPostedDt() {
		return postedDt;
	}
	public void setPostedDt(String postedDt) {
		this.postedDt = postedDt;
	}
	public int getPartition() {
		return partition;
	}
	public void setPartition(int partition) {
		this.partition = partition;
	}
	public long getStartLag() {
		return startLag;
	}
	public void setStartLag(long startLag) {
		this.startLag = startLag;
	}
	public long getStartOffset() {
		return startOffset;
	}
	public void setStartOffset(long startOffset) {
		this.startOffset = startOffset;
	}
	public long getEndLag() {
		return endLag;
	}
	public void setEndLag(long endLag) {
		this.endLag = endLag;
	}
	public long getEndOffset() {
		return endOffset;
	}
	public void setEndOffset(long endOffset) {
		this.endOffset = endOffset;
	}
}
