package com.monitor.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.influxdb.InfluxDB;
import org.influxdb.InfluxDBFactory;
import org.influxdb.dto.Query;
import org.influxdb.dto.QueryResult;
import com.monitor.model.*;


public class SummaryDao {
	
	private String cpuQueryTemplate="select host, time, last(usage_user) as value from \"system.cpu\" where time > (now() - 1h) and host =~ /.*";	   
	private String memQueryTemplate="select host, time, last(used_percent) as value from \"system.mem\" where time > (now() - 1h) and host =~ /.*";
	private String cloverServiceQueryTemplate="select server, time, last(status) as value from \"clover.status\" where time > (now() - 1h) group by server";	
	private String srQueryTemplate="select time, last(status) as value from \"schemaregistry.status\" where time > (now() - 1h)";
	private String msQueryTemplate="select server, time, last(status) as value from \"mysql.status\" where time > (now() - 1h) group by server";
	
	public List<ServerStatus> getschemeRegistryHealth() {
		
		List<ServerStatus> serverList = new ArrayList<ServerStatus>();
		InfluxDB influxDB = InfluxDBFactory.connect("http://10.46.48.31:8086", "root", "root");		
		String dbName = "metrics";
										
		Query query = new Query(srQueryTemplate, dbName);
		QueryResult resultset = influxDB.query(query);       	
		        				
        // iterate the results and print details
        for (QueryResult.Result result : resultset.getResults()) {
            // print details of the entire result
            
            // iterate the series within the result
            for (QueryResult.Series series : result.getSeries()) {            	
            	ServerStatus server = new ServerStatus();            	
            	String values = series.getValues().get(0).toString();
            	String valueList = values.substring(1, values.length()-1);                
                List<String> list = Arrays.asList(valueList.split(","));
                server.setTime(list.get(0).toString().trim());                                
                server.setStatus(list.get(1).toString().trim());
                server.setHostname("schemaregistry");
                serverList.add(server);
            }
        }		
        
        //Collections.sort(serverList, ServerStatus.hostCompare);
        
        influxDB.close();
		return serverList;		    
	}	
	
	public List<ServerStatus> getMySqlHealth() {
		
		List<ServerStatus> serverList = new ArrayList<ServerStatus>();
		InfluxDB influxDB = InfluxDBFactory.connect("http://10.46.48.31:8086", "root", "root");		
		String dbName = "metrics";
										
		Query query = new Query(msQueryTemplate, dbName);
		QueryResult resultset = influxDB.query(query);       	
		        				
        // iterate the results and print details
        for (QueryResult.Result result : resultset.getResults()) {
            // print details of the entire result
            
            // iterate the series within the result
            for (QueryResult.Series series : result.getSeries()) {            	
            	ServerStatus server = new ServerStatus();            	
            	String values = series.getValues().get(0).toString();
            	String valueList = values.substring(1, values.length()-1);                
                List<String> list = Arrays.asList(valueList.split(","));
                server.setTime(list.get(0).toString().trim());                                                
                server.setHostname(list.get(1).toString().trim());
                server.setStatus(list.get(2).toString().trim());
                serverList.add(server);
            }
        }		
        
        Collections.sort(serverList, ServerStatus.hostCompare);
        
        influxDB.close();
		return serverList;		    
	}		
	
	public List<ServerStatus> getCloverServerHealth() {
		
		List<ServerStatus> serverList = new ArrayList<ServerStatus>();
		InfluxDB influxDB = InfluxDBFactory.connect("http://10.46.48.31:8086", "root", "root");
		String dbName = "metrics";
						
		String squery = cpuQueryTemplate + "cloveretl*/ group by host";
				
		Query query = new Query(squery, dbName);
		QueryResult resultset = influxDB.query(query);    	            	
		        				
        // iterate the results and print details
        for (QueryResult.Result result : resultset.getResults()) {
            // print details of the entire result
            
            // iterate the series within the result
            for (QueryResult.Series series : result.getSeries()) {            	
            	ServerStatus server = new ServerStatus();            	
            	String values = series.getValues().get(0).toString();
            	String valueList = values.substring(1, values.length()-1);                
                List<String> list = Arrays.asList(valueList.split(","));
                server.setTime(list.get(0).toString().trim());
                server.setHostname(list.get(1).toString().trim());                
                server.setUsageCpu(list.get(2).toString().trim());
                serverList.add(server);
            }
        }		
        
		squery = memQueryTemplate + "cloveretl*/ group by host";
				
		query = new Query(squery, dbName);
		resultset = influxDB.query(query);				
        				
        // iterate the results and print details
        for (QueryResult.Result result : resultset.getResults()) {
            // print details of the entire result
            
            // iterate the series within the result
            for (QueryResult.Series series : result.getSeries()) {            	
            	ServerStatus server = new ServerStatus();            	
            	String values = series.getValues().get(0).toString();
            	String valueList = values.substring(1, values.length()-1);                
                List<String> list = Arrays.asList(valueList.split(","));
                server.setTime(list.get(0).toString().trim());
                server.setHostname(list.get(1).toString().trim());                
                server.setUsageMem(list.get(2).toString().trim());
                serverList.add(server);
            }
        }
				
		query = new Query(cloverServiceQueryTemplate, dbName);
		resultset = influxDB.query(query);				
        				
        // iterate the results and print details
        for (QueryResult.Result result : resultset.getResults()) {
            // print details of the entire result
            
            // iterate the series within the result
            for (QueryResult.Series series : result.getSeries()) {            	
            	ServerStatus server = new ServerStatus();            	
            	String values = series.getValues().get(0).toString();
            	String valueList = values.substring(1, values.length()-1);                
                List<String> list = Arrays.asList(valueList.split(","));
                server.setTime(list.get(0).toString().trim());
                server.setHostname(list.get(1).toString().trim());                
                server.setStatus(list.get(2).toString().trim());
                serverList.add(server);
            }
        }        
        
        Collections.sort(serverList, ServerStatus.hostCompare);
        
        influxDB.close();
		return serverList;		    
	}	
	
	public List<ServerStatus> getKafkaServerHealth() {
		
		List<ServerStatus> serverList = new ArrayList<ServerStatus>();
		InfluxDB influxDB = InfluxDBFactory.connect("http://10.46.48.31:8086", "root", "root");		
		String dbName = "metrics";
				
		
		String squery = cpuQueryTemplate + "kafka*/ group by host";
				
		Query query = new Query(squery, dbName);
		QueryResult resultset = influxDB.query(query);    	            	
		        				
        // iterate the results and print details
        for (QueryResult.Result result : resultset.getResults()) {
            // print details of the entire result
            
            // iterate the series within the result
            for (QueryResult.Series series : result.getSeries()) {            	
            	ServerStatus server = new ServerStatus();            	
            	String values = series.getValues().get(0).toString();
            	String valueList = values.substring(1, values.length()-1);                
                List<String> list = Arrays.asList(valueList.split(","));
                server.setTime(list.get(0).toString().trim());
                server.setHostname(list.get(1).toString().trim());                
                server.setUsageCpu(list.get(2).toString().trim());
                serverList.add(server);
            }
        }		
        
		squery = memQueryTemplate + "kafka*/ group by host";
				
		query = new Query(squery, dbName);
		resultset = influxDB.query(query);				
        				
        // iterate the results and print details
        for (QueryResult.Result result : resultset.getResults()) {
            // print details of the entire result
            
            // iterate the series within the result
            for (QueryResult.Series series : result.getSeries()) {            	
            	ServerStatus server = new ServerStatus();            	
            	String values = series.getValues().get(0).toString();
            	String valueList = values.substring(1, values.length()-1);                
                List<String> list = Arrays.asList(valueList.split(","));
                server.setTime(list.get(0).toString().trim());
                server.setHostname(list.get(1).toString().trim());                
                server.setUsageMem(list.get(2).toString().trim());
                serverList.add(server);
            }
        }
   
        Collections.sort(serverList, ServerStatus.hostCompare);
        
        influxDB.close();
		return serverList;		    
	}	
	
	public List<ServerStatus> getZooServerHealth() {
		
		List<ServerStatus> serverList = new ArrayList<ServerStatus>();
		InfluxDB influxDB = InfluxDBFactory.connect("http://10.46.48.31:8086", "root", "root");		
		String dbName = "metrics";
				
		
		String squery = cpuQueryTemplate + "zookeeper*/ group by host";
				
		Query query = new Query(squery, dbName);
		QueryResult resultset = influxDB.query(query);    	            	
		        				
        // iterate the results and print details
        for (QueryResult.Result result : resultset.getResults()) {
            // print details of the entire result
            
            // iterate the series within the result
            for (QueryResult.Series series : result.getSeries()) {            	
            	ServerStatus server = new ServerStatus();            	
            	String values = series.getValues().get(0).toString();
            	String valueList = values.substring(1, values.length()-1);                
                List<String> list = Arrays.asList(valueList.split(","));
                server.setTime(list.get(0).toString().trim());
                server.setHostname(list.get(1).toString().trim());                
                server.setUsageCpu(list.get(2).toString().trim());
                serverList.add(server);
            }
        }		
        
		squery = memQueryTemplate + "zookeeper*/ group by host";
				
		query = new Query(squery, dbName);
		resultset = influxDB.query(query);				
        				
        // iterate the results and print details
        for (QueryResult.Result result : resultset.getResults()) {
            // print details of the entire result
            
            // iterate the series within the result
            for (QueryResult.Series series : result.getSeries()) {            	
            	ServerStatus server = new ServerStatus();            	
            	String values = series.getValues().get(0).toString();
            	String valueList = values.substring(1, values.length()-1);                
                List<String> list = Arrays.asList(valueList.split(","));
                server.setTime(list.get(0).toString().trim());
                server.setHostname(list.get(1).toString().trim());                
                server.setUsageMem(list.get(2).toString().trim());
                serverList.add(server);
            }
        }
      
        Collections.sort(serverList, ServerStatus.hostCompare);
        
        influxDB.close();
		return serverList;		    
	}		

	public List<ServerStatus> getAttunityServerHealth() {
		
		List<ServerStatus> serverList = new ArrayList<ServerStatus>();
		InfluxDB influxDB = InfluxDBFactory.connect("http://10.46.48.31:8086", "root", "root");		
		String dbName = "metrics";				
		
		String squery = cpuQueryTemplate + "attunity*/ group by host";
				
		Query query = new Query(squery, dbName);
		QueryResult resultset = influxDB.query(query);
		        				
        // iterate the results and print details
        for (QueryResult.Result result : resultset.getResults()) {
            // print details of the entire result
            
            // iterate the series within the result
            for (QueryResult.Series series : result.getSeries()) {            	
            	ServerStatus server = new ServerStatus();            	
            	String values = series.getValues().get(0).toString();
            	String valueList = values.substring(1, values.length()-1);                
                List<String> list = Arrays.asList(valueList.split(","));
                server.setTime(list.get(0).toString().trim());
                server.setHostname(list.get(1).toString().trim());                
                server.setUsageCpu(list.get(2).toString().trim());
                serverList.add(server);
            }
        }		
        
		squery = memQueryTemplate + "attunity*/ group by host";
				
		query = new Query(squery, dbName);
		resultset = influxDB.query(query);				
        				
        // iterate the results and print details
        for (QueryResult.Result result : resultset.getResults()) {
            // print details of the entire result
            
            // iterate the series within the result
            for (QueryResult.Series series : result.getSeries()) {            	
            	ServerStatus server = new ServerStatus();            	
            	String values = series.getValues().get(0).toString();
            	String valueList = values.substring(1, values.length()-1);                
                List<String> list = Arrays.asList(valueList.split(","));
                server.setTime(list.get(0).toString().trim());
                server.setHostname(list.get(1).toString().trim());                
                server.setUsageMem(list.get(2).toString().trim());
                serverList.add(server);
            }
        }

        if(!serverList.isEmpty())
        	Collections.sort(serverList, ServerStatus.hostCompare);
        
        influxDB.close();
		return serverList;
	}		
	
}
