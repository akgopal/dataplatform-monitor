package com.monitor.model;

public class SchemaRegistry {
	private String serverNm, taskNm, schemaNm, tableNm, publishDtm, dataSchema, schemaId, hash;
	
	private int tableVersion;

	public String getServerNm() {
		return serverNm;
	}
	public void setServerNm(String serverNm) {
		this.serverNm = serverNm;
	}
	public String getTaskNm() {
		return taskNm;
	}
	public void setTaskNm(String taskNm) {
		this.taskNm = taskNm;
	}
	public String getSchemaNm() {
		return schemaNm;
	}
	public void setSchemaNm(String schemaNm) {
		this.schemaNm = schemaNm;
	}
	public String getTableNm() {
		return tableNm;
	}
	public void setTableNm(String tableNm) {
		this.tableNm = tableNm;
	}
	public String getPublishDtm() {
		return publishDtm;
	}
	public void setPublishDtm(String publishDtm) {
		this.publishDtm = publishDtm;
	}
	public String getDataSchema() {
		return dataSchema;
	}
	public void setDataSchema(String dataSchema) {
		this.dataSchema = dataSchema;
	}
	public String getSchemaId() {
		return schemaId;
	}
	public void setSchemaId(String schemaId) {
		this.schemaId = schemaId;
	}
	public int getTableVersion() {
		return tableVersion;
	}
	public void setTableVersion(int tableVersion) {
		this.tableVersion = tableVersion;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	
}
