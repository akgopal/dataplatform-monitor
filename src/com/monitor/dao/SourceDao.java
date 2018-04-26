package com.monitor.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.monitor.model.*;
import com.monitor.util.DbUtil;

public class SourceDao {

    private Connection connection;
    private String statusQuery = "select serverName, taskOwner, max(latency) as latency, min(case taskStatus when 'RUNNING' then 1 when 'FINISHED_OK' then 1 else 0 end) as taskStatus  from vdp_monitor.srctask_status where taskName not like '%DEV%' or taskName not like '%TEST%' group by taskOwner, serverName";
    private String attnStatusQuery = "SELECT serverName,serverUrl,taskName,taskStatus,cdcAppliedInsert,cdcAppliedUpdate,cdcAppliedDelete,cdcAppliedDdl,fullLoadCompletedTables,fullLoadLoadingTables,fullLoadTotalRecordTransferred,fullLoadEstimatedRecords,fullLoadStartTime,fullLoadFinishTime,sourceThroughputRecords,sourceThroughputRecordsTotal,sourceThroughputVolume,sourceThroughputVolumeTotal,targetThroughputRecords,targetThroughputRecordsTotal,targetThroughputVolume,targetThroughputVolumeTotal,sourceLatency,targetLatency,overallLatency,freshStartTime,memoryUsage,diskUsage,statusTime,sourceCurrentDtm,sourceTailDtm,sourceTransDtm FROM attntask_status where taskName not like '%DEV%' or taskName not like '%TEST%'";
    private String clvrSrcStatusQuery = "select taskStatus,taskName,tableCount,statusTime,startTime,sourceTransDtm,sourceTailDtm,sourceLatency,sourceCurrentDtm,serverName,finishTime from clvrtask_status";
    
    ResultSet rs;
    Statement statement;
    public SourceDao() {}	
    
	private static Connection getConnection() 
			throws SQLException, 
				ClassNotFoundException 
	{
		Connection connection = DbUtil.
				getInstance().getConnection();
		return connection;
	}      
	
    public List<SourceHealth> getSourceHealth() {
        List<SourceHealth> tasks = new ArrayList<SourceHealth>();           
        try {        	
        	connection = getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(statusQuery);
            while (rs.next()) {
            	SourceHealth task = new SourceHealth();            	
            	task.setServerName(rs.getString("serverName"));
            	task.setOrgName(rs.getString("taskOwner"));
            	task.setTaskStatus(rs.getString("taskStatus"));
            	task.setlatency(rs.getInt("latency"));
            	tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        finally {
            if (rs != null) try { rs.close(); } catch (SQLException logOrIgnore) {}
            if (statement != null) try { statement.close(); } catch (SQLException logOrIgnore) {}           
            if (connection != null) try { connection.close(); } catch (SQLException e) {}			
        }        
        return tasks;
    }
    
    public List<SourceAttunityStatus> getSourceAttunityStatus() {
        List<SourceAttunityStatus> attnTasks = new ArrayList<SourceAttunityStatus>();           
        try {        	  
        	connection = getConnection();     	
            statement = connection.createStatement();
            rs = statement.executeQuery(attnStatusQuery);
            while (rs.next()) {
            	SourceAttunityStatus task = new SourceAttunityStatus();            	
            	task.setServerName(rs.getString("serverName"));
            	task.setServerUrl(rs.getString("serverUrl"));
            	task.setTaskName(rs.getString("taskName"));
            	task.setTaskStatus(rs.getString("taskStatus"));
            	task.setStatusTime(rs.getLong("statusTime"));
            	task.setFreshStartTime(rs.getLong("freshStartTime"));
            	task.setCdcAppliedInsert(rs.getLong("cdcAppliedInsert"));
            	task.setCdcAppliedUpdate(rs.getLong("cdcAppliedUpdate"));
            	task.setCdcAppliedDelete(rs.getLong("cdcAppliedDelete"));
            	task.setCdcAppliedDdl(rs.getInt("cdcAppliedDdl"));
            	task.setFullLoadCompletedTables(rs.getInt("fullLoadCompletedTables"));
            	task.setFullLoadLoadingTables(rs.getInt("fullLoadLoadingTables"));
            	task.setFullLoadTotalRecordTransferred(rs.getLong("fullLoadTotalRecordTransferred"));
            	task.setFullLoadEstimatedRecords(rs.getLong("fullLoadEstimatedRecords"));
            	task.setFullLoadStartTime(rs.getLong("fullLoadStartTime"));
            	task.setFullLoadFinishTime(rs.getLong("fullLoadFinishTime"));
            	task.setSourceThroughputRecords(rs.getInt("sourceThroughputRecords"));
            	task.setSourceThroughputRecordsTotal(rs.getInt("sourceThroughputRecordsTotal"));
            	task.setSourceThroughputVolume(rs.getInt("sourceThroughputVolume"));
            	task.setSourceThroughputVolumeTotal(rs.getInt("sourceThroughputVolumeTotal"));
            	task.setTargetThroughputRecords(rs.getInt("TargetThroughputRecords"));
            	task.setTargetThroughputRecordsTotal(rs.getInt("TargetThroughputRecordsTotal"));
            	task.setTargetThroughputVolume(rs.getInt("TargetThroughputVolume"));
            	task.setTargetThroughputVolumeTotal(rs.getInt("TargetThroughputVolumeTotal"));            	
            	task.setSourceLatency(rs.getInt("sourceLatency"));
            	task.setTargetLatency(rs.getInt("targetLatency"));
            	task.setOverallLatency(rs.getInt("overallLatency"));
            	task.setMemoryUsage(rs.getInt("memoryUsage"));
            	task.setDiskUsage(rs.getInt("diskUsage"));    
            	task.setSourceCurrentDtm(rs.getString("sourceCurrentDtm"));
            	task.setSourceTailDtm(rs.getString("sourceTailDtm"));
            	task.setSourceTransDtm(rs.getString("sourceTransDtm"));
            	attnTasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        finally {
            if (rs != null) try { rs.close(); } catch (SQLException logOrIgnore) {}
            if (statement != null) try { statement.close(); } catch (SQLException logOrIgnore) {}           
            if (connection != null) try { connection.close(); } catch (SQLException e) {}			
        }        
        return attnTasks;
    }    
        
    public List<SourceCloverStatus> getSourceCloverStatus() {
        List<SourceCloverStatus> clvrTasks = new ArrayList<SourceCloverStatus>();           
        try {        
        	connection = getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(clvrSrcStatusQuery);
            while (rs.next()) {
            	SourceCloverStatus task = new SourceCloverStatus();            	
            	task.setServerName(rs.getString("serverName"));
            	task.setTaskName(rs.getString("taskName"));
            	task.setTaskStatus(rs.getString("taskStatus"));
            	task.setStatusTime(rs.getString("statusTime"));
            	task.setStartTime(rs.getString("startTime"));
            	task.setFinishTime(rs.getString("finishTime"));
            	task.setTableCount(rs.getInt("tableCount"));
            	task.setSourceLatency(rs.getInt("sourceLatency"));
            	task.setSourceCurrentDtm(rs.getString("sourceCurrentDtm"));
            	task.setSourceTailDtm(rs.getString("sourceTailDtm"));
            	task.setSourceTransDtm(rs.getString("sourceTransDtm"));
            	clvrTasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        finally {
            if (rs != null) try { rs.close(); } catch (SQLException logOrIgnore) {}
            if (statement != null) try { statement.close(); } catch (SQLException logOrIgnore) {}           
            if (connection != null) try { connection.close(); } catch (SQLException e) {}			
        }        
        return clvrTasks;
    }       
    
  
    
}
