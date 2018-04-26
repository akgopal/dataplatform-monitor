package com.monitor.model;

public class KafkaOffset {

	private String topicNm, postedDt;
	private int partitionNb, partitionCount;
	private long beginOffset, endOffset, totalOffset, availableOffset;
	
	public String getTopicNm() {
		return topicNm;
	}
	public void setTopicNm(String topicNm) {
		this.topicNm = topicNm;
	}
	public String getPostedDt() {
		return postedDt;
	}
	public void setPostedDt(String postedDt) {
		this.postedDt = postedDt;
	}
	public int getPartitionNb() {
		return partitionNb;
	}
	public void setPartitionNb(int partitionNb) {
		this.partitionNb = partitionNb;
	}
	public long getBeginOffset() {
		return beginOffset;
	}
	public void setBeginOffset(long beginOffset) {
		this.beginOffset = beginOffset;
	}
	public long getEndOffset() {
		return endOffset;
	}
	public void setEndOffset(long endOffset) {
		this.endOffset = endOffset;
	}
	public long getTotalOffset() {
		return totalOffset;
	}
	public void setTotalOffset(long totalOffset) {
		this.totalOffset = totalOffset;
	}
	public long getAvailableOffset() {
		return availableOffset;
	}
	public void setAvailableOffset(long availableOffset) {
		this.availableOffset = availableOffset;
	}
	public int getPartitionCount() {
		return partitionCount;
	}
	public void setPartitionCount(int partitionCount) {
		this.partitionCount = partitionCount;
	}

	
}
