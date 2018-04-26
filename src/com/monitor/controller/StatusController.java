package com.monitor.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.monitor.dao.SourceDao;
import com.monitor.dao.SummaryDao;
import com.monitor.model.KafkaOffset;
import com.monitor.model.AzureStorage;
import com.monitor.model.ConsumerLag;
import com.monitor.model.LakeConsumer;
import com.monitor.dao.LakeDao;
import com.monitor.dao.KafkaDao;
import com.monitor.dao.SchemaRegistryDao;


/**
 * Servlet implementation class StatusController
 */


@WebServlet("/StatusController")
public class StatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LIST_SRC_STATUS = "/sourceStatus.jsp";
	private static String LIST_SCHEMA_REGISTRY = "/schemaRegistry.jsp";
	private static String LIST_SCHEMA_METADATA = "/schemaMetadata.jsp";	
	private static String LIST_ATTUNITY_STATUS = "/attunityStatus.jsp";	
	
	
	private static String LIST_LAKE_STATUS = "/lakeStatus.jsp";
	private static String LIST_AZURE_STORAGE = "/azureStatus.jsp";
	private static String LIST_LAKE_CONSUMER_STATUS = "/lakeEngine.jsp";
	
	private static String LIST_KAFKA_STATUS = "/kafkaStatus.jsp";
	private static String LIST_CONSUMER_STATUS = "/kafkaConsumer.jsp";
	
	private static String SUMMARY = "/summary.jsp";
	
    private SourceDao srcDao;
    private LakeDao lakeDao;
    private SchemaRegistryDao srDao;
    private KafkaDao kfDao;
    private SummaryDao sDao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatusController() {
        super();
        srcDao = new SourceDao();
        lakeDao = new LakeDao();
        srDao = new SchemaRegistryDao();
        kfDao = new KafkaDao();
        sDao = new SummaryDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String forward="";
        String action = request.getParameter("action");
        String hash = request.getParameter("hash"); 
        
//        ServletContext context = getServletContext();
        
        if (action.equalsIgnoreCase("summary")){
            forward = SUMMARY;
            request.setAttribute("tasks", srcDao.getSourceHealth());                 
            request.setAttribute("cloverSStatus", sDao.getCloverServerHealth());
            request.setAttribute("schemaStatus", sDao.getschemeRegistryHealth());
            request.setAttribute("mysqlStatus", sDao.getMySqlHealth());
            request.setAttribute("kafkaSStatus", sDao.getKafkaServerHealth());
            request.setAttribute("zookeeperSStatus", sDao.getZooServerHealth());
            request.setAttribute("attnSStatus", sDao.getAttunityServerHealth());
            request.setAttribute("lakeStatus", lakeDao.getLakeHealth());
            request.setAttribute("azureStorage", lakeDao.getAzureStorageSize());    
        }
        else if (action.equalsIgnoreCase("sourceStatus")){
            forward = LIST_SRC_STATUS;
            request.setAttribute("attntasks", srcDao.getSourceAttunityStatus());
            request.setAttribute("clvrtasks", srcDao.getSourceCloverStatus());            
        }           
        else if (action.equalsIgnoreCase("attunityStatus")){
            forward = LIST_ATTUNITY_STATUS;
        }          
        else if (action.equalsIgnoreCase("schemaRegistry")){
            forward = LIST_SCHEMA_REGISTRY;
            request.setAttribute("schemaRegistry", srDao.getSchemaRegistry());
            request.setAttribute("schemaRegistryList", srDao.getSchemaRegistryList());               
        }   
        else if (action.equalsIgnoreCase("schemaMetadata")){
            forward = LIST_SCHEMA_METADATA;
            request.setAttribute("schemaMetadata", srDao.getSchemaMetadata(hash));                   
        }        
        else if (action.equalsIgnoreCase("lakeStatus")){
            forward = LIST_LAKE_STATUS;
            request.setAttribute("lakeHealth", lakeDao.getLakeHealth());
            request.setAttribute("lakeStatus", lakeDao.getLakeStatus());                       
        }
        else if (action.equalsIgnoreCase("azureStatus")){
    		int page = 1;
    		int recordsPerPage = 25;
    		if(request.getParameter("page") != null)
    			page = Integer.parseInt(request.getParameter("page"));    		    		
    		
    		List<AzureStorage> list1 = lakeDao.getAzureStorageProperties((page-1)*recordsPerPage, recordsPerPage);    	
    		int noOfRecords = lakeDao.getNoOfRecords();
    		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
    		request.setAttribute("azureProperties", list1);
    		request.setAttribute("noOfPages", noOfPages);
    		request.setAttribute("currentPage", page);    		

            request.setAttribute("azureStorage", lakeDao.getAzureStorageSize());    		
            forward = LIST_AZURE_STORAGE;                       
        }        
        else if (action.equalsIgnoreCase("lakeEngine")){
            forward = LIST_LAKE_CONSUMER_STATUS;
            request.setAttribute("lakeConsumer", lakeDao.getLakeConsumer());
            request.setAttribute("lakeConsumerList", lakeDao.getLakeConsumerList());
            request.setAttribute("lakeNewConsumer", lakeDao.getLakeNewConsumer());
            request.setAttribute("lakeNewConsumerList", lakeDao.getLakeNewConsumerList());
            
        }        
        else if (action.equalsIgnoreCase("kafkaStatus")){
    		int page1 = 1;
    		int page2 = 1;
    		int recordsPerPage = 25;
    		if(request.getParameter("page1") != null)
    			page1 = Integer.parseInt(request.getParameter("page1"));    		    		
    		if(request.getParameter("page2") != null)
    			page2 = Integer.parseInt(request.getParameter("page2"));    		    		
    		
    		List<KafkaOffset> list1 = kfDao.getKafkaOffset((page1-1)*recordsPerPage, recordsPerPage);    		    		    		
    		int noOfKafkaOffsetRecords = kfDao.getNoOfRecords();
    		int noOfKafkaOffsetPages = (int) Math.ceil(noOfKafkaOffsetRecords * 1.0 / recordsPerPage);
    		request.setAttribute("offsetList", list1);
    		request.setAttribute("noOfPagesKafkaOffset", noOfKafkaOffsetPages);
    		request.setAttribute("currentPageKafkaOffset", page1);      	
    		
    		List<KafkaOffset> list2 = kfDao.getKafkaPartitionOffset((page2-1)*recordsPerPage, recordsPerPage);    		
    		int noOfKafkaPartOffsetRecords = kfDao.getNoOfRecords();
    		int noOfKafkaPartOffsetPages = (int) Math.ceil(noOfKafkaPartOffsetRecords * 1.0 / recordsPerPage);
    		request.setAttribute("partoffsetList", list2);
    		request.setAttribute("noOfPagesKafkaPartOffset", noOfKafkaPartOffsetPages);
    		request.setAttribute("currentPageKafkaPartOffset", page2);    		
    		
            forward = LIST_KAFKA_STATUS;
        }     
        else if (action.equalsIgnoreCase("kafkaConsumer")){
    		int page1 = 1;
    		int recordsPerPage = 30;
    		if(request.getParameter("page1") != null)
    			page1 = Integer.parseInt(request.getParameter("page1"));    		    		
    		
    		List<ConsumerLag> list1 = kfDao.getKafkaConsumerLag((page1-1)*recordsPerPage, recordsPerPage);    		    		    		
    		int noOfKafkaOffsetRecords = kfDao.getNoOfRecords();
    		int noOfKafkaOffsetPages = (int) Math.ceil(noOfKafkaOffsetRecords * 1.0 / recordsPerPage);
    		request.setAttribute("consumerList", list1);
    		request.setAttribute("noOfPages", noOfKafkaOffsetPages);
    		request.setAttribute("currentPage", page1);      	
    		    		
            forward = LIST_CONSUMER_STATUS;
        }                         
		response.getWriter().append("Served at: ").append(request.getContextPath());
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] TableList=null;		
		TableList =request.getParameterValues("TableList");
		String Type = request.getParameter("type");
		Boolean updateAction = null;
		if(Type.equals("0"))
			updateAction = false;
		if(Type.equals("1"))
			updateAction = true;		
		List<LakeConsumer> lakeConsumers = new ArrayList<LakeConsumer>();		
		for(Integer selectedIndex=0; selectedIndex < TableList.length; ++selectedIndex)
		{
			LakeConsumer consumer = new LakeConsumer();
			consumer.setConsumerId(Integer.parseInt(TableList[selectedIndex]));
			consumer.setEnabledInd(updateAction);
			lakeConsumers.add(consumer);
		}   
		lakeDao.updateConsumerStatus(lakeConsumers);		
		doGet(request, response);
	}

}
