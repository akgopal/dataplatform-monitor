package com.monitor.model;

import java.util.Comparator;

public class ServerStatus implements Comparable<ServerStatus>{
	private String hostname, usageCpu, usageMem, usageDisk, load, diskPath, time, status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}

	public String getUsageCpu() {
		return usageCpu;
	}

	public void setUsageCpu(String usageCpu) {
		this.usageCpu = usageCpu;
	}

	public String getUsageMem() {
		return usageMem;
	}

	public void setUsageMem(String usageMem) {
		this.usageMem = usageMem;
	}

	public String getUsageDisk() {
		return usageDisk;
	}

	public void setUsageDisk(String usageDisk) {
		this.usageDisk = usageDisk;
	}

	public String getLoad() {
		return load;
	}

	public void setLoad(String load) {
		this.load = load;
	}

	public String getDiskPath() {
		return diskPath;
	}

	public void setDiskPath(String diskPath) {
		this.diskPath = diskPath;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int compareTo(ServerStatus comparehost) {
		return this.hostname.compareToIgnoreCase(comparehost.getHostname());
	}	
	
    public static Comparator<ServerStatus> hostCompare = new Comparator<ServerStatus>() {
        @Override
        public int compare(ServerStatus o1, ServerStatus o2) {
            return o1.compareTo(o2);
        }
    };
}
