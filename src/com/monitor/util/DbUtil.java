package com.monitor.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DbUtil {

	//static reference to itself
	private static DbUtil instance = new DbUtil();    
	private static Connection connection = null;
            
	private DbUtil() {}    
	
	public static DbUtil getInstance()	{
		return instance;
	}	
    
    public Connection getConnection() throws SQLException, 
	ClassNotFoundException{   
    	try{
    		Properties prop = new Properties();
    		InputStream inputStream = DbUtil.class.getClassLoader().getResourceAsStream("/db.properties");
    		prop.load(inputStream);
    		String driver = prop.getProperty("driver");
    		String url = prop.getProperty("url");
    		String user = prop.getProperty("user");
    		String password = prop.getProperty("password");			
    		Class.forName(driver);    	    	    	
            connection = DriverManager.getConnection(url, user, password);            
		} catch (FileNotFoundException e) {
		    e.printStackTrace();
		} catch (IOException e) {
		    e.printStackTrace();
		}
    	return connection;
    }
}