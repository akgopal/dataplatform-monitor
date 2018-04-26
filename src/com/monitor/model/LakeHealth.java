package com.monitor.model;

public class LakeHealth {
	private String feedName;
	private int lakeStatus;
	private int lakeLatency;
	
	public int getLakeLatency() {
		return lakeLatency;
	}
	public void setLakeLatency(int lakeLatency) {
		this.lakeLatency = lakeLatency;
	}
	public int getLakeStatus() {
		return lakeStatus;
	}
	public void setLakeStatus(int lakeStatus) {
		this.lakeStatus = lakeStatus;
	}
	public String getFeedName() {
		return feedName;
	}
	public void setFeedName(String feedName) {
		this.feedName = feedName;
	}	
	
}
