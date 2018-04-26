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
	<title>VIG Data Platform - Kafka Consumers</title>
</head>

<body bgcolor="D8D5D9">
<div class="container">
	<table border="0" bgcolor='white' height="60" cellpadding="0" cellspacing="0" width="1600">
	<tr>
	<td align="left"><img src="img/logo.jpg" alt=""/></td>
	<td align="left">
	<div class="pageheader">Kafka Consumers</div>
	</td>
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
	<div id="consumer_status"></div>	
    </td>
    </tr>
    </table> 	
	<table border="0" cellpadding="20" cellspacing="1" width="1600" bgcolor="bfafb2">
	<tr>	
	<td bgcolor="f0fff0" class="statusheader" align="center">Consumer Lag By Topic Partition</td>
	</tr>
	<tr>
	<td bgcolor="f0fff0" align="left">
    	<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2">
        <thead>
            <tr bgcolor="#808080">                                
				<th width="300" align="left">Consumer Group</th>
                <th width="300" align="left">Topic Name</th>
                <th width="40" align="left">Partition</th>
                <th width="60" align="left">Status</th>
                <th width="120" align="left">Start Offset</th>                              
                <th width="120" align="left">Start Lag</th>
				<th width="120" align="left">End Offset</th>                              
                <th width="120" align="left">End Lag</th>
                <th width="180" align="left">Posted Date</th>                   
            </tr>
        </thead>
        <tbody>
        	<c:set var="i" value="0" />
            <c:forEach items="${consumerList}" var="consumerList">
            <tr bgcolor="
                  	<c:choose>	                 	
            			<c:when test="${consumerList.partitionStatus == 'REWIND'}">
            				<c:out value="#e59400"/>    
            			</c:when>                    	
            			<c:when test="${consumerList.startLag > 0}">
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
                    <td class="process" width="300" align="left"><c:out value="${consumerList.consumerGroup}" /></td>
                    <td class="process" width="300" align="left"><c:out value="${consumerList.topic}" /></td>    
                    <td class="process" width="40" align="left"><c:out value="${consumerList.partition}" /></td>
                    <td class="process" width="60" align="left"><c:out value="${consumerList.partitionStatus}" /></td>
                    <td class="process" width="120" align="left"><c:out value="${consumerList.startOffset}" /></td>
                    <td class="process" width="120" align="left"><c:out value="${consumerList.startLag}" /></td>
                    <td class="process" width="120" align="left"><c:out value="${consumerList.endOffset}" /></td>
                    <td class="process" width="120" align="left"><c:out value="${consumerList.endLag}" /></td>
                    <td class="process" width="180" align="left"><c:out value="${consumerList.postedDt}" /></td>                                                            
                </tr>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>                        
			<tr>		
				<td colspan = "9" bgcolor="f0fff0" align="center">
					<table border="0" cellpadding="5" cellspacing="5" align="center"> 	
					<tr>			
					<c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<td><c:out value="${i}" /></td>
							</c:when>
							<c:otherwise>
								<td><a class="process" href="StatusController?action=kafkaConsumer&page1=<c:out value="${i}"/>"><c:out value="${i}"/></a></td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</tr>
					</table>
				</td>
			</tr>
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
	loadIFrame("consumer_status","http://10.46.48.31:3000/dashboard-solo/db/kafka-cluster-operations?var-topic=All&var-broker=All&panelId=59","width:1200px;height:250px;border:0px;");
	</script>	
</body>
</html>