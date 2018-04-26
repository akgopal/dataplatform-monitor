package com.monitor.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.monitor.model.*;
import com.monitor.util.DbUtil;

public class SchemaRegistryDao {

    private Connection connection;
    private String schemaMetaData = "select serverNm, taskNm, schemaNm, schemaId, tableNm, tableVersion, publishDtm, dataSchema from vdp_metadata.schema_registry where md5(concat(serverNm,taskNm,schemaNm,tableNm))='";
    private String schemaRegistryList = "select distinct serverNm, taskNm from vdp_metadata.schema_registry order by serverNm, taskNm";
    private String schemaRegistry = "select distinct serverNm, taskNm, schemaNm, tableNm, md5(concat(serverNm,taskNm,schemaNm,tableNm)) as hash from vdp_metadata.schema_registry order by serverNm, taskNm, schemaNm, tableNm";
    
    ResultSet rs;
    Statement statement;
    public SchemaRegistryDao() {}		
    
	private static Connection getConnection() 
			throws SQLException, 
				ClassNotFoundException 
	{
		Connection connection = DbUtil.
				getInstance().getConnection();
		return connection;
	}       
    
    public List<SchemaRegistry> getSchemaRegistry() {
        List<SchemaRegistry> srlist = new ArrayList<SchemaRegistry>();           
        try {   
        	connection = getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(schemaRegistry);
            while (rs.next()) {
            	SchemaRegistry sr = new SchemaRegistry();
            	sr.setServerNm(rs.getString("serverNm"));
            	sr.setTaskNm(rs.getString("taskNm"));
            	sr.setSchemaNm(rs.getString("schemaNm"));
            	sr.setTableNm(rs.getString("tableNm"));
            	sr.setHash(rs.getString("hash"));
            	srlist.add(sr);
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
        return srlist;
    }    
    
    public List<SchemaRegistry> getSchemaRegistryList() {
        List<SchemaRegistry> tlist = new ArrayList<SchemaRegistry>();           
        try {        	        	
        	connection = getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(schemaRegistryList);
            while (rs.next()) {
            	SchemaRegistry sr = new SchemaRegistry();
            	sr.setServerNm(rs.getString("serverNm"));
            	sr.setTaskNm(rs.getString("taskNm"));
            	tlist.add(sr);
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
        return tlist;
    }     
    
    public List<SchemaRegistry> getSchemaMetadata(String hash) {
        List<SchemaRegistry> srMeta = new ArrayList<SchemaRegistry>();           
        try {        
        	connection = getConnection();
            statement = connection.createStatement();
            String Query = schemaMetaData + hash + "'";
            rs = statement.executeQuery(Query);
            while (rs.next()) {
            	SchemaRegistry sr = new SchemaRegistry();
            	sr.setSchemaId(rs.getString("schemaId"));
            	sr.setSchemaNm(rs.getString("schemaNm"));
            	sr.setTableNm(rs.getString("tableNm"));
            	sr.setTableVersion(rs.getInt("tableVersion"));
            	sr.setDataSchema(rs.getString("dataSchema"));
            	sr.setPublishDtm(rs.getString("publishDtm"));
            	srMeta.add(sr);
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
        return srMeta;
    }   	
    
}
