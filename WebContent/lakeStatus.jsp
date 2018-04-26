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
	<title>VIG Data Platform - Lake Publishing</title>
</head>

<body bgcolor="D8D5D9">
<div class="container">
	<table border="0" bgcolor='white' height="60" cellpadding="0" cellspacing="0" width="1600">
	<tr>
	<td align="left"><img src="img/logo.jpg" alt=""/></td>
	<td align="left"><div class="pageheader">Lake Publishing</div></td>
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
	<td bgcolor="f0fff0" class="statusheader" align="center">Lake Publishing Detail</td>
	</tr>		
	<tr>		
	<td bgcolor="f0fff0" align="left">		
		<c:forEach items="${lakeHealth}" var="lakeHealth">			
		<p style="font-family:arial;color:#25383C;font-size:10pt;font-weight:600;valign:left"><c:out value="${lakeHealth.feedName}" /></p>
    	<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2" width= "1540"  title="Details of lake consumer Metrics">
        <thead>
            <tr bgcolor="#808080">                                
                <th width="360">Kafka Topic</th>
                <th width="500">Consumed Offsets</th>                                                                                           
                <th width="180">Consumed Source Time</th>     
                <th width="180">Status Time</th>                
                <th width="120">Last Status</th>                                
            </tr>
        </thead>
        <tbody>
        <c:set var="i" value="0" />
            <c:forEach items="${lakeStatus}" var="lakeStatus">
                <c:if test="${lakeStatus.feedName == lakeHealth.feedName}">                
                  	<tr bgcolor="
                  	<c:choose>
            			<c:when test="${lakeStatus.taskStatus == 'STOPPED'}">
            				<c:out value="#ff4500"/>    
            			</c:when>         			            			                  	
            			<c:when test="${i % 2 == 0}">
            				<c:out value="#ffffff"/>    
            			</c:when>            			
            			<c:otherwise>
                    		<c:out value="#ececec"/>
            			</c:otherwise>
            		</c:choose>	        
            		">                            
                    <td class="process" width="360" align="left" valign="top"><c:out value="${lakeStatus.kafkaTopicNm}" /></td>
                    <td class="process" width="500" align="left" valign="top">
                    	<table>
                    		<tr>
                    		<td width="180" align="left">Last Offset(s)</td>
                    		<td width="320" align="left">
                    		<c:out value="${lakeStatus.lastConsumedOffset}" />
                    		</td>
                    		</tr>                    	
                    		<tr>
                    		<td width="180" align="left">Consumed Offsets</td>
                    		<td width="320" align="left">
                    		<c:out value="${lakeStatus.consumedOffsets}" />
                    		</td>
                    		</tr>
                    	</table>                    
					</td>                    
                    <td class="process" width="180" align="left" valign="top"><c:out value="${lakeStatus.consumedSrcDtm}" /></td>
                    <td class="process" width="180" align="left" valign="top"><c:out value="${lakeStatus.postedDtm}" /></td>
                    <td class="process" width="120" align="left" valign="top"><c:out value="${lakeStatus.taskStatus}" /></td>                    	                                                                                     
                </tr>
                </c:if>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>
        </tbody>
    	</table>       
    	</c:forEach>
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
	loadIFrame("task_status","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?panelId=5&theme=light","width:500px;height:300px;border:0px;");
	loadIFrame("task_latency","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?panelId=4&theme=light","width:900px;height:300px;border:0px;");
</script>	  
</body>
</html>