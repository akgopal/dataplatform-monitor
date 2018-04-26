package com.monitor.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.monitor.model.*;
import com.monitor.util.DbUtil;

public class KafkaDao {

	private Connection connection;
	private int noOfRecords;	
	
    ResultSet rs;
    Statement statement;
    
    public KafkaDao() {}	
    
	private static Connection getConnection() 
			throws SQLException, 
				ClassNotFoundException 
	{
		Connection connection = DbUtil.
				getInstance().getConnection();
		return connection;
	}       
	
	public List<KafkaOffset> getKafkaOffset(int offset,	int noOfRecords)
	{

		String query = "select SQL_CALC_FOUND_ROWS topic_nm, totalOffsets, availableOffsets, partitionCount, posted_dt from kafka_offsets where topic_nm <> '__consumer_offsets' limit " + offset + ", " + noOfRecords;		
		
		List<KafkaOffset> list = new ArrayList<KafkaOffset>();
		KafkaOffset topic = null;
		try {			
			connection = getConnection();
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(query);
			while (rs.next()) {
				topic = new KafkaOffset();				
				topic.setTopicNm(rs.getString("topic_nm"));
				topic.setTotalOffset(rs.getLong("totalOffsets"));
				topic.setAvailableOffset(rs.getLong("availableOffsets"));
				topic.setPartitionCount(rs.getInt("partitionCount"));								
				topic.setPostedDt(rs.getString("posted_dt"));
				list.add(topic);
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
		return list;
	}    
	
	public List<KafkaOffset> getKafkaPartitionOffset(int offset, int noOfRecords)
	{

		String query = "select SQL_CALC_FOUND_ROWS topic_nm, partition_nb, begin_offset, end_offset, posted_dt from kafka_offsets_by_partition where topic_nm <> '__consumer_offsets' limit " + offset + ", " + noOfRecords;		
		
		List<KafkaOffset> list = new ArrayList<KafkaOffset>();
		KafkaOffset topic = null;
		try {			
			connection = getConnection();
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(query);
			while (rs.next()) {
				topic = new KafkaOffset();				
				topic.setTopicNm(rs.getString("topic_nm"));
				topic.setBeginOffset(rs.getLong("begin_offset"));
				topic.setEndOffset(rs.getLong("end_offset"));
				topic.setPartitionNb(rs.getInt("partition_nb"));								
				topic.setPostedDt(rs.getString("posted_dt"));
				list.add(topic);
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
		return list;
	}  	
        
	public List<ConsumerLag> getKafkaConsumerLag(int offset, int noOfRecords)
	{

		String query = "select SQL_CALC_FOUND_ROWS consumer_group_id, topic,partition_nb,partition_status,start_offset,start_lag,end_offset,end_lag,posted_dt from vdp_monitor.kafka_consumer_lag order by cast(replace(consumer_group_id, 'lake-consumer-id-', '') as signed) limit " + offset + ", " + noOfRecords;		
		
		List<ConsumerLag> list = new ArrayList<ConsumerLag>();
		ConsumerLag consumer = null;
		try {			
			connection = getConnection();
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(query);
			while (rs.next()) {
				consumer = new ConsumerLag();				
				consumer.setConsumerGroup(rs.getString("consumer_group_id"));
				consumer.setTopic(rs.getString("topic"));
				consumer.setStartOffset(rs.getLong("start_offset"));
				consumer.setStartLag(rs.getLong("start_lag"));
				consumer.setEndOffset(rs.getLong("end_offset"));
				consumer.setEndLag(rs.getLong("end_lag"));
				consumer.setPartitionStatus(rs.getString("partition_status"));
				consumer.setPartition(rs.getInt("partition_nb"));							
				consumer.setPostedDt(rs.getString("posted_dt"));
				list.add(consumer);
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
		return list;
	}  	
      		
	
	public int getNoOfRecords() {
		return noOfRecords;
	}    	
    
}
