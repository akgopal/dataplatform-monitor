package com.monitor.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.monitor.model.*;
import com.monitor.util.DbUtil;

public class LakeDao {
	private Connection connection;    
    private String lakeHealthQuery = "select system_nm, status, lag from vdp_monitor.dlake_health";
    private String lakeStatusQuery = "select consumer_id,kafka_topic_nm,system_nm,last_consumed_offset,consumed_offsets_by_partition,consumed_src_dtm,task_status,enabled_ind,posted_dt from vdp_monitor.dlake_status";
    private String lakeConsumerQuery = "select consumer_id, kafka_topic_nm, azure_storage_account, data_pipe_nm, enabled_ind from vdp_manage.clvetl_kafka_consumer";
    private String lakeConsumerList = "select distinct azure_storage_account from vdp_manage.clvetl_kafka_consumer";
    private String lakeNewConsumerList = "select distinct data_pipe_nm from vdp_manage.clvetl_kafka_consumer_add";
    private String lakeNewConsumer = "select kafka_topic_nm, data_pipe_nm from vdp_manage.clvetl_kafka_consumer_add";    
    private String azureStorage = "select l.storage_id, account_nm, sum(file_count) as file_count, sum(directory_size) as directory_size, max(posted_dt) as posted_dt from vdp_monitor.azure_storage_account_metrics m join vdp_manage.azure_storage_account_list l on m.storage_id = l.storage_id group by storage_id, account_nm order by storage_id";
    
    ResultSet rs;
    Statement statement;
    private int noOfRecords;	
    
    public LakeDao() {}	
    
	private static Connection getConnection() 
			throws SQLException, 
				ClassNotFoundException 
	{
		Connection connection = DbUtil.
				getInstance().getConnection();
		return connection;
	}    
    
	public int getNoOfRecords() {
		return noOfRecords;
	}    	
	
    public List<LakeHealth> getLakeHealth() {
        List<LakeHealth> lakeFeeds = new ArrayList<LakeHealth>();           
        try {        	        
        	connection = getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(lakeHealthQuery);
            while (rs.next()) {
            	LakeHealth feed = new LakeHealth();            	
            	feed.setFeedName(rs.getString("system_nm"));
            	feed.setLakeStatus(rs.getInt("status"));
            	feed.setLakeLatency(rs.getInt("lag"));
            	lakeFeeds.add(feed);
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
        return lakeFeeds;
    }         
    
    public List<LakeStatus> getLakeStatus() {
        List<LakeStatus> lakeRecords = new ArrayList<LakeStatus>();           
        try {        	        	
        	connection = getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(lakeStatusQuery);
            while (rs.next()) {
            	LakeStatus feed = new LakeStatus();            	            	
            	feed.setConsumerId(rs.getInt("consumer_id"));
            	feed.setKafkaTopicNm(rs.getString("kafka_topic_nm"));
            	feed.setFeedName(rs.getString("system_nm"));
            	feed.setLastConsumedOffset(rs.getString("last_consumed_offset"));
            	feed.setConsumedOffsets(rs.getString("consumed_offsets_by_partition"));
            	feed.setConsumedSrcDtm(rs.getString("consumed_src_dtm"));
            	feed.setTaskStatus(rs.getString("task_status"));
            	feed.setEnabledInd(rs.getBoolean("enabled_ind"));
            	feed.setPostedDtm(rs.getString("posted_dt"));
            	lakeRecords.add(feed);
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
        return lakeRecords;
    }   
    
    public List<LakeConsumer> getLakeConsumer() {
        List<LakeConsumer> lakeConsumers = new ArrayList<LakeConsumer>();           
        try {        	        	
        	connection = getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(lakeConsumerQuery);
            while (rs.next()) {
            	LakeConsumer consumer = new LakeConsumer();            	            	
            	consumer.setConsumerId(rs.getInt("consumer_id"));
            	consumer.setTopicNm(rs.getString("kafka_topic_nm"));            	
            	consumer.setAzureStorage(rs.getString("azure_storage_account"));            	
            	consumer.setTaskNm(rs.getString("data_pipe_nm"));
            	consumer.setEnabledInd(rs.getBoolean("enabled_ind"));
            	lakeConsumers.add(consumer);
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
        return lakeConsumers;
    }    
    
    public List<LakeConsumer> getLakeConsumerList() {
        List<LakeConsumer> lakeConsumers = new ArrayList<LakeConsumer>();           
        try {        	
        	connection = getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(lakeConsumerList);
            while (rs.next()) {
            	LakeConsumer consumer = new LakeConsumer();            	            	
            	consumer.setAzureStorage(rs.getString("azure_storage_account"));            	
            	lakeConsumers.add(consumer);
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
        return lakeConsumers;
    }     
    
    public List<LakeConsumer> getLakeNewConsumerList() {
        List<LakeConsumer> lakeConsumers = new ArrayList<LakeConsumer>();           
        try {        	
        	connection = getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(lakeNewConsumerList);
            while (rs.next()) {
            	LakeConsumer consumer = new LakeConsumer();            	            	
            	consumer.setTaskNm(rs.getString("data_pipe_nm"));
            	lakeConsumers.add(consumer);
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
        return lakeConsumers;
    }     
    
    public List<LakeConsumer> getLakeNewConsumer() {
        List<LakeConsumer> lakeConsumers = new ArrayList<LakeConsumer>();           
        try {      
        	connection = getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(lakeNewConsumer);
            while (rs.next()) {
            	LakeConsumer consumer = new LakeConsumer();            	            	
            	consumer.setTaskNm(rs.getString("data_pipe_nm"));
            	consumer.setTopicNm(rs.getString("kafka_topic_nm"));
            	lakeConsumers.add(consumer);
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
        return lakeConsumers;
    }       
    
    public void updateConsumerStatus (List<LakeConsumer> consumers) {
        try {
        	connection = getConnection();
        	String query = "update vdp_manage.clvetl_kafka_consumer set enabled_ind=? where consumer_id=?";
        	for(Integer i=0; i<consumers.size();i++)
        	{
        		PreparedStatement preparedStatement = connection.prepareStatement( query );        		
        		preparedStatement.setBoolean(1, consumers.get(i).getEnabledInd());
        		preparedStatement.setInt(2, consumers.get(i).getConsumerId());
        		preparedStatement.executeUpdate();
        		preparedStatement.close();
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
    }    
    
    public List<AzureStorage> getAzureStorageProperties (int offset, int noOfRecords) {
    	List<AzureStorage> accounts = new ArrayList<AzureStorage>();
    	String azureStorageProp = "select SQL_CALC_FOUND_ROWS l.storage_id, account_nm, directory_nm, file_count, directory_size, posted_dt from vdp_monitor.azure_storage_account_metrics m join vdp_manage.azure_storage_account_list l on m.storage_id = l.storage_id order by storage_id, directory_nm limit " + offset + ", " + noOfRecords;
    	AzureStorage blob = null;
        try {
        	connection = getConnection();   
        	statement = connection.createStatement();        	
        	rs = statement.executeQuery(azureStorageProp);
            while (rs.next()) {
            	blob = new AzureStorage();            	            	
            	blob.setStorageId(rs.getInt("storage_id"));
            	blob.setStorageNm(rs.getString("account_nm"));
            	blob.setDirectoryNm(rs.getString("directory_nm"));
            	blob.setPostedDt(rs.getString("posted_dt"));
            	blob.setFileCount(rs.getInt("file_count"));
            	blob.setDirectorySize(rs.getLong("directory_size"));
            	accounts.add(blob);
            }
			rs.close();		
			rs = statement.executeQuery("select FOUND_ROWS()");
			if(rs.next())
				this.noOfRecords = rs.getInt(1);            
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
        return accounts;
    }      
    
    
    public List<AzureStorage> getAzureStorageSize () {
    	List<AzureStorage> accounts = new ArrayList<AzureStorage>();
        try {
        	connection = getConnection();   
        	statement = connection.createStatement();
        	rs = statement.executeQuery(azureStorage);
            while (rs.next()) {
            	AzureStorage blob = new AzureStorage();            	            	
            	blob.setStorageId(rs.getInt("storage_id"));
            	blob.setStorageNm(rs.getString("account_nm"));
            	blob.setPostedDt(rs.getString("posted_dt"));
            	blob.setFileCount(rs.getInt("file_count"));
            	blob.setDirectorySize(rs.getLong("directory_size"));
            	accounts.add(blob);
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
        return accounts;
    }    
    
}
