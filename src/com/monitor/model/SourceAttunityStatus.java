package com.monitor.model;
import java.util.Date;

public class SourceAttunityStatus {
	private String serverName;
	private String serverUrl;
	private String taskName;
	private String taskStatus;
	private Date statusTime;
	private Date freshStartTime;
	private Long cdcAppliedInsert;
	private Long cdcAppliedUpdate;
	private Long cdcAppliedDelete;
	private int cdcAppliedDdl;
	private int fullLoadCompletedTables;
	private int fullLoadLoadingTables;
	private Long fullLoadTotalRecordTransferred;
	private Long fullLoadEstimatedRecords;
	private Date fullLoadStartTime;
	private Date fullLoadFinishTime;
	private int sourceThroughputRecords;
	private int sourceThroughputRecordsTotal;
	private int sourceThroughputVolume;
	private int sourceThroughputVolumeTotal;
	private int targetThroughputRecords;
	private int targetThroughputRecordsTotal;
	private int targetThroughputVolume;
	private int targetThroughputVolumeTotal;
	private int sourceLatency;
	private int targetLatency;
	private int overallLatency;
	private int memoryUsage;
	private int diskUsage;
	private String sourceCurrentDtm;
	private String sourceTransDtm;
	private String sourceTailDtm;
	
	public String getServerName() {
		return serverName;
	}
	public void setServerName(String serverName) {
		this.serverName = serverName;
	}
	public String getServerUrl() {
		return serverUrl;
	}
	public void setServerUrl(String serverUrl) {
		this.serverUrl = serverUrl;
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
	public Date getStatusTime() {
		return statusTime;
	}
	public void setStatusTime(Long statusTime) {
		this.statusTime = new Date(statusTime*1000L);
	}
	public Date getFreshStartTime() {
		return freshStartTime;
	}
	public void setFreshStartTime(Long freshStartTime) {
		this.freshStartTime = new Date(freshStartTime/1000L);
	}
	public Long getCdcAppliedInsert() {
		return cdcAppliedInsert;
	}
	public void setCdcAppliedInsert(Long cdcAppliedInsert) {
		this.cdcAppliedInsert = cdcAppliedInsert;
	}
	public Long getCdcAppliedUpdate() {
		return cdcAppliedUpdate;
	}
	public void setCdcAppliedUpdate(Long cdcAppliedUpdate) {
		this.cdcAppliedUpdate = cdcAppliedUpdate;
	}
	public Long getCdcAppliedDelete() {
		return cdcAppliedDelete;
	}
	public void setCdcAppliedDelete(Long cdcAppliedDelete) {
		this.cdcAppliedDelete = cdcAppliedDelete;
	}
	public int getCdcAppliedDdl() {
		return cdcAppliedDdl;
	}
	public void setCdcAppliedDdl(int cdcAppliedDdl) {
		this.cdcAppliedDdl = cdcAppliedDdl;
	}
	public int getFullLoadCompletedTables() {
		return fullLoadCompletedTables;
	}
	public void setFullLoadCompletedTables(int fullLoadCompletedTables) {
		this.fullLoadCompletedTables = fullLoadCompletedTables;
	}
	public int getFullLoadLoadingTables() {
		return fullLoadLoadingTables;
	}
	public void setFullLoadLoadingTables(int fullLoadLoadingTables) {
		this.fullLoadLoadingTables = fullLoadLoadingTables;
	}
	public Long getFullLoadEstimatedRecords() {
		return fullLoadEstimatedRecords;
	}
	public void setFullLoadEstimatedRecords(Long fullLoadEstimatedRecords) {
		this.fullLoadEstimatedRecords = fullLoadEstimatedRecords;
	}
	public Long getFullLoadTotalRecordTransferred() {
		return fullLoadTotalRecordTransferred;
	}
	public void setFullLoadTotalRecordTransferred(Long fullLoadTotalRecordTransferred) {
		this.fullLoadTotalRecordTransferred = fullLoadTotalRecordTransferred;
	}
	public Date getFullLoadStartTime() {
		return fullLoadStartTime;
	}
	public void setFullLoadStartTime(long fullLoadStartTime) {
		this.fullLoadStartTime = new Date(fullLoadStartTime/1000L) ;
	}
	public Date getFullLoadFinishTime() {
		return fullLoadFinishTime;
	}
	public void setFullLoadFinishTime(long fullLoadFinishTime) {		
		this.fullLoadFinishTime = new Date(fullLoadFinishTime/1000L);
	}
	public int getSourceThroughputRecords() {
		return sourceThroughputRecords;
	}
	public void setSourceThroughputRecords(int sourceThroughputRecords) {
		this.sourceThroughputRecords = sourceThroughputRecords;
	}
	public int getSourceThroughputRecordsTotal() {
		return sourceThroughputRecordsTotal;
	}
	public void setSourceThroughputRecordsTotal(int sourceThroughputRecordsTotal) {
		this.sourceThroughputRecordsTotal = sourceThroughputRecordsTotal;
	}
	public int getSourceThroughputVolume() {
		return sourceThroughputVolume;
	}
	public void setSourceThroughputVolume(int sourceThroughputVolume) {
		this.sourceThroughputVolume = sourceThroughputVolume;
	}
	public int getSourceThroughputVolumeTotal() {
		return sourceThroughputVolumeTotal;
	}
	public void setSourceThroughputVolumeTotal(int sourceThroughputVolumeTotal) {
		this.sourceThroughputVolumeTotal = sourceThroughputVolumeTotal;
	}
	public int getTargetThroughputRecords() {
		return targetThroughputRecords;
	}
	public void setTargetThroughputRecords(int targetThroughputRecords) {
		this.targetThroughputRecords = targetThroughputRecords;
	}
	public int getTargetThroughputVolume() {
		return targetThroughputVolume;
	}
	public void setTargetThroughputVolume(int targetThroughputVolume) {
		this.targetThroughputVolume = targetThroughputVolume;
	}
	public int getTargetThroughputRecordsTotal() {
		return targetThroughputRecordsTotal;
	}
	public void setTargetThroughputRecordsTotal(int targetThroughputRecordsTotal) {
		this.targetThroughputRecordsTotal = targetThroughputRecordsTotal;
	}
	public int getTargetThroughputVolumeTotal() {
		return targetThroughputVolumeTotal;
	}
	public void setTargetThroughputVolumeTotal(int targetThroughputVolumeTotal) {
		this.targetThroughputVolumeTotal = targetThroughputVolumeTotal;
	}
	public int getSourceLatency() {
		return sourceLatency;
	}
	public void setSourceLatency(int sourceLatency) {
		this.sourceLatency = sourceLatency;
	}
	public int getTargetLatency() {
		return targetLatency;
	}
	public void setTargetLatency(int targetLatency) {
		this.targetLatency = targetLatency;
	}
	public int getOverallLatency() {
		return overallLatency;
	}
	public void setOverallLatency(int overallLatency) {
		this.overallLatency = overallLatency;
	}
	public int getMemoryUsage() {
		return memoryUsage;
	}
	public void setMemoryUsage(int memoryUsage) {
		this.memoryUsage = memoryUsage;
	}
	public int getDiskUsage() {
		return diskUsage;
	}
	public void setDiskUsage(int diskUsage) {
		this.diskUsage = diskUsage;
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
	
	
}
