package com.monitor.model;

public class AzureStorage {

	String storageNm, containerNm, directoryNm, postedDt;
	Integer fileCount, storageId;
	Long directorySize;
	
	public Integer getStorageId() {
		return storageId;
	}
	public void setStorageId(Integer storageId) {
		this.storageId = storageId;
	}	
	public String getStorageNm() {
		return storageNm;
	}
	public void setStorageNm(String storageNm) {
		this.storageNm = storageNm;
	}
	public String getContainerNm() {
		return containerNm;
	}
	public void setContainerNm(String containerNm) {
		this.containerNm = containerNm;
	}
	public String getDirectoryNm() {
		return directoryNm;
	}
	public void setDirectoryNm(String directoryNm) {
		this.directoryNm = directoryNm.substring(directoryNm.indexOf(".net/")+5, directoryNm.length());
	}
	public String getPostedDt() {
		return postedDt;
	}
	public void setPostedDt(String postedDt) {
		this.postedDt = postedDt;
	}
	public Integer getFileCount() {
		return fileCount;
	}
	public void setFileCount(Integer fileCount) {
		this.fileCount = fileCount;
	}
	public Long getDirectorySize() {
		return directorySize;
	}
	public void setDirectorySize(Long directorySize) {
		this.directorySize = directorySize;
	}
	
	
}
