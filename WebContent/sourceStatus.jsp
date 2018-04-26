<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="js/jquery-1.5.1.min.js"></script>
	<script src="js/loadIFrame.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />
	<link rel="stylesheet" type="text/css" href="css/monitor.css">
	<title>VIG Data Platform - Data Feeds</title>
</head>

<body bgcolor="D8D5D9">
<div class="container">
	<table border="0" bgcolor='white' height="60" cellpadding="0" cellspacing="0" width="1600">
	<tr>
	<td align="left"><img src="img/logo.jpg" alt=""/></td>
	<td align="left"><div class="pageheader">Data Feeds</div></td>
	</tr>
	<tr>
	<td colspan="2" width="1600" align="center" VALIGN="top">
	  <img src="img/border.png" width="1600" height="30">
	</td>
	</tr>		
	</table>
	<table height="30" bgcolor="#CCE6EE" cellpadding="0" cellspacing="0" width="1600">
	<tr>
	<td>
	<ul id="menu" class="menu"> 
	</ul>
	</td>
	</tr>
	</table>
	<hr size="3" width="1600" align="left">
	<table border="0" cellpadding="20" cellspacing="0" width="1600" bgcolor="bfafb2">
	<tr>		
	<td bgcolor="#ffffff" align="center">	
	<div id="task_status"></div>	
    </td>
	<td bgcolor="#ffffff" align="center">	
	<div id="task_latency"></div>	
    </td>    
    </tr>
    </table> 
	<table border="0" cellpadding="20" cellspacing="1" width="1600" bgcolor="bfafb2">
	<tr>	
	<td bgcolor="f0fff0" class="statusheader" align="center">Attunity Task Detail</td>
	</tr>		
	<tr>		
	<td bgcolor="f0fff0">		
    	<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2" title="Details of Replication tasks Metrics">
        <thead>
            <tr bgcolor="#808080">                                
                <th width="180">Task Name</th>
                <th width="180">Details</th>                              
                <th width="180">Latency</th>                                              
                <th width="180">CDC Counters</th>     
                <th width="180">Full Load Counters</th>                
                <th width="180">Throughput</th>                                
            </tr>
        </thead>
        <tbody>
        <c:set var="i" value="0" />
            <c:forEach items="${attntasks}" var="task">
            <tr bgcolor="
                  	<c:choose>
            			<c:when test="${task.taskStatus == 'STOPPED'}">
            				<c:out value="#ff4500"/>    
            			</c:when>
            			<c:when test="${task.overallLatency > 3600}">
            				<c:out value="#e59400"/>    
            			</c:when>            			            			                  	
            			<c:when test="${i % 2 == 0}">
            				<c:out value="#ffffff"/>    
            			</c:when>            			
            			<c:otherwise>
                    		<c:out value="#ececec"/>
            			</c:otherwise>
            		</c:choose>	    
            		">                                       
                    <th bgcolor="#808080" width="180" align="left" ><a class="task" target="popup" href='<c:out value="${task.serverUrl}/#/taskMonitoring/${task.taskName}"/>'><c:out value="${task.taskName}" /></a></th>
                    <td class="process" width="360" align="left" valign="top">
                    	<table>
                    		<tr>
                    		<td width="80" align="left">Server</td>
                    		<td width="220" align="left">
                    		<c:out value="${task.serverName}" />
                    		</td>
                    		</tr>                    	
                    		<tr>
                    		<td width="80" align="left">Status</td>
                    		<td width="180" align="left">
                    		<c:out value="${task.taskStatus}" />
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Memory Usage</td>
                    		<td width="180" align="left">
                    		<c:out value="${task.memoryUsage}" /> kb
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Disk Usage</td>
                    		<td width="180" align="left">
                    		<c:out value="${task.diskUsage}" /> kb
                    		</td>                    		
                    		</tr>   
                    		<tr>
                    		<td width="120" align="left">Status Time</td>
                    		<td width="260" align="left">
                    		<c:out value="${task.statusTime}" />
                    		</td>
                    		</tr>       
                    		<tr>
                    		<td width="120" align="left">Start Time (Last)</td>
                    		<td width="260" align="left">
                    		<c:out value="${task.freshStartTime}" />
                    		</td>                    		
                    		</tr>                      		             		 
                    		<tr>
                    		<td width="180" align="left">Source Current Time</td>
                    		<td width="220" align="left">
                    		<c:out value="${task.sourceCurrentDtm}" />
                    		</td>                    		
                    		</tr>  
                    		<tr>
                    		<td width="180" align="left">Source Applied Time</td>
                    		<td width="220" align="left">
                    		<c:out value="${task.sourceTransDtm}" />
                    		</td>
                    		</tr>                    		 
                    		<tr>
                    		<td width="180" align="left">Source Tail Time</td>
                    		<td width="220" align="left">
                    		<c:out value="${task.sourceTailDtm}" />
                    		</td>                    		
                    		</tr>                    		                     		                    		                		                    		
                    	</table>
                    </td>                      
                    <td class="process" width="120" align="left" valign="top">
                    	<table>
                    		<tr>
                    		<td width="80" align="left"> Source </td>
                    		<td width="40" align="left">
                    		<c:out value="${task.sourceLatency}" /> sec
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="80" align="left"> Target </td>
                    		<td width="40" align="left">
                    		<c:out value="${task.targetLatency}" /> sec
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="80" align="left"> Overall </td>
                    		<td width="40" align="left">
                    		<c:out value="${task.overallLatency}" /> sec
                    		</td>
                    		</tr>                    		                    		
                    	</table>
                    </td>  
                    <td class="process" width="120" align="left" valign="top">
                    	<table>
                    		<tr>
                    		<td width="80" align="left">Insert</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.cdcAppliedInsert}" />
                    		</td>
                    		</tr>					
                    		<tr>
                    		<td width="80" align="left">Update</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.cdcAppliedUpdate}" />
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="80" align="left">Delete</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.cdcAppliedDelete}" />
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="80" align="left">DDL</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.cdcAppliedDdl}" />
                    		</td>                    		
                    		</tr>                    		                    		
                    	</table>
                    </td>     
                    <td class="process" width="320" align="left" valign="top">
                    	<table>
                    		<tr>
                    		<td width="120" align="left">Tables Count</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.fullLoadCompletedTables}" />
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Estimated Count</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.fullLoadEstimatedRecords}" />
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Transferred Count</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.fullLoadTotalRecordTransferred}" />
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Tables in Progress</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.fullLoadLoadingTables}" />
                    		</td>                    		
                    		</tr>   
                    		<tr>
                    		<td width="120" align="left">Start Time</td>
                    		<td width="220" align="left">
                    		<c:out value="${task.fullLoadStartTime}" />
                    		</td>                    		
                    		</tr>      
                    		<tr>
                    		<td width="120" align="left">Finish Time</td>
                    		<td width="220" align="left">
                    		<c:out value="${task.fullLoadFinishTime}" />
                    		</td>                    		
                    		</tr>                      		                		                 		                    		
                    	</table>
                    </td>         
                    <td class="process" width="300" align="left" valign="top">
                    	<table>
                    		<tr>
                    		<td class="health" colspan="2">Source</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Records (Last Hour)</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.sourceThroughputRecords}" />
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Records (Overall)</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.sourceThroughputRecordsTotal}" />
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Volume (Last Hour)</td>
                    		<td width="120" align="left">
                    		<c:out value="${task.sourceThroughputVolume}" /> kbyte/sec
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Volume (Overall)</td>
                    		<td width="120" align="left">
                    		<c:out value="${task.sourceThroughputVolumeTotal}" /> kbyte/sec
                    		</td>                    		
                    		</tr>   
                    		<tr>
                    		<td class="health" colspan="2">Target</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Records (Last Hour)</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.targetThroughputRecords}" />
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Records (Overall)</td>
                    		<td width="80" align="left">
                    		<c:out value="${task.targetThroughputRecordsTotal}" />
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Volume (Last Hour)</td>
                    		<td width="120" align="left">
                    		<c:out value="${task.targetThroughputVolume}" /> kbyte/sec
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="120" align="left">Volume (Overall)</td>
                    		<td width="120" align="left">
                    		<c:out value="${task.targetThroughputVolumeTotal}" /> kbyte/sec
                    		</td>                    		
                    		</tr>                     		                		                 		                    		
                    	</table>
                    </td>                                                                       
                </tr>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>
        </tbody>
    	</table>       
    </td>
    </tr>
    </table>  
	<table border="0" cellpadding="20" cellspacing="1" width="1600" bgcolor="bfafb2" >
	<tr>	
	<td bgcolor="f0fff0" class="statusheader" align="center">CloverETL Task Detail</td>
	</tr>		
	<tr>		
	<td bgcolor="f0fff0" align="center">		
    	<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2" title="Details of CloverETL tasks Metrics">
        <thead>
            <tr bgcolor="#808080">                                
                <th width="180">Task Name</th>
                <th width="180">Details</th>                              
                <th width="180">Latency</th>                                                  
                <th width="180">Source DTMs</th>                   
            </tr>
        </thead>
        <tbody>
        	<c:set var="i" value="0" />
            <c:forEach items="${clvrtasks}" var="task">
            <tr bgcolor="
                  	<c:choose>
            			<c:when test="${task.taskStatus == 'ERROR'}">
            				<c:out value="#ff4500"/>    
            			</c:when>    
            			<c:when test="${task.taskStatus == 'ABORTED'}">
            				<c:out value="#ff4500"/>    
            			</c:when>
            			<c:when test="${task.sourceLatency > 14400}">
            				<c:out value="#e59400"/>    
            			</c:when>        			                 	
            			<c:when test="${i % 2 == 0}">
            				<c:out value="#ffffff"/>    
            			</c:when>            			
            			<c:otherwise>
                    		<c:out value="#ececec"/>
            			</c:otherwise>
            		</c:choose>	       
            		">                                  
                    <th bgcolor="#808080" width="180" align="left"><c:out value="${task.taskName}" /></th>    
                    <td class="process" width="360" align="left" valign="top">
                    	<table>
                    		<tr>
                    		<td width="80" align="left">Server</td>
                    		<td width="220" align="left">
                    		<c:out value="${task.serverName}" />
                    		</td>
                    		</tr>                    	
                    		<tr>
                    		<td width="80" align="left">Status</td>
                    		<td width="180" align="left">
                    		<c:out value="${task.taskStatus}" />
                    		</td>
                    		</tr>
                    		<tr>
                    		<td width="80" align="left">Tables Count</td>
                    		<td width="180" align="left">
                    		<c:out value="${task.tableCount}" />
                    		</td>
                    		</tr>                    		
                    		<tr>
                    		<td width="120" align="left">Status Time</td>
                    		<td width="260" align="left">
                    		<c:out value="${task.statusTime}" />
                    		</td>
                    		</tr>       
                    		<tr>
                    		<td width="120" align="left">Start Time</td>
                    		<td width="260" align="left">
                    		<c:out value="${task.startTime}" />
                    		</td>                    		
                    		</tr>                      		             		 
                    		<tr>
                    		<td width="120" align="left">Finish Time</td>
                    		<td width="260" align="left">
                    		<c:out value="${task.finishTime}" />
                    		</td>                    		
                    		</tr>                                   		                     		                    		                		                    		
                    	</table>
                    </td>                         
                    <td class="process" width="340" align="left" valign="top">
                    	<table>
                    		<tr>
                    		<td width="80" align="left"> Source </td>
                    		<td width="80" align="left">
                    		<c:out value="${task.sourceLatency}" /> sec
                    		</td>
                    		</tr>                  		
                    	</table>                         		
                    <td class="process" width="340" align="left" valign="top">
                    	<table>                    		
                    		<tr>
                    		<td width="180" align="left">Source Current Time</td>
                    		<td width="220" align="left">
                    		<c:out value="${task.sourceCurrentDtm}" />
                    		</td>                    		
                    		</tr>  
                    		<tr>
                    		<td width="180" align="left">Source Applied Time</td>
                    		<td width="220" align="left">
                    		<c:out value="${task.sourceTransDtm}" />
                    		</td>
                    		</tr>                    		 
                    		<tr>
                    		<td width="180" align="left">Source Tail Time</td>
                    		<td width="220" align="left">
                    		<c:out value="${task.sourceTailDtm}" />
                    		</td>                    		
                    		</tr>                      		
                    	</table>                    
                    </td>
                </tr>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>                    
        </tbody>
    	</table>       
    </td>
    </tr>
    </table>  
	<hr size="1" width="1600" align="left">
	<table border="0" width="1600" height="30">
	<tr bgcolor='#acacac'>	
	<TD colspan="2" width="1600" ALIGN="CENTER" VALIGN="TOP">
	  <IMG SRC="img/border.png" WIDTH="1600" HEIGHT="30" BORDER="0">
	</TD>
	</tr>
	</table>
	<hr size="1" width="1600" align="left">          
</div> 
<script type="text/javascript">
	$(".menu").load("menu_navigation.html"); 
	loadIFrame("task_status","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?panelId=3&theme=light","width:500px;height:300px;border:0px;");
	loadIFrame("task_latency","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?panelId=1&theme=light","width:900px;height:300px;border:0px;");
</script>
</body>
</html>