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
	<title>VIG Data Platform - Kafka Topics</title>
</head>

<body bgcolor="D8D5D9">
<div class="container">
	<table border="0" bgcolor='white' height="60" cellpadding="0" cellspacing="0" width="1600">
	<tr>
	<td align="left"><img src="img/logo.jpg" alt=""/></td>
	<td align="left">
	<div class="pageheader">Kafka Topics</div>
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
	<table border="0" cellpadding="20" cellspacing="1" width="1600" bgcolor="bfafb2">
	<tr>	
	<td bgcolor="f0fff0" class="statusheader" width="400px" >Kafka Topic Offsets</td>
	<td bgcolor="f0fff0" align="left">
    	<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2">
        <thead>
            <tr bgcolor="#808080">                                
                <th width="400">Topic Name</th>
                <th width="80">Partitions</th>
                <th width="120">Total Offset</th>                              
                <th width="120">Available Offset</th>                                                  
                <th width="180">Posted Date</th>                   
            </tr>
        </thead>
        <tbody>
        	<c:set var="i" value="0" />
            <c:forEach items="${offsetList}" var="offsetList">
            <tr bgcolor="
                  	<c:choose>	                 	
            			<c:when test="${i % 2 == 0}">
            				<c:out value="#ffffff"/>    
            			</c:when>            			
            			<c:otherwise>
                    		<c:out value="#ececec"/>
            			</c:otherwise>
            		</c:choose>	       
            		">                                  
                    <td class="process" width="400" align="left"><c:out value="${offsetList.topicNm}" /></td>    
                    <td class="process" width="80" align="left"><c:out value="${offsetList.partitionCount}" /></td>
                    <td class="process" width="120" align="left"><c:out value="${offsetList.totalOffset}" /></td>
                    <td class="process" width="120" align="left"><c:out value="${offsetList.availableOffset}" /></td>
                    <td class="process" width="180" align="left"><c:out value="${offsetList.postedDt}" /></td>                                                            
                </tr>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>                        
			<tr>		
				<td colspan = "5" bgcolor="f0fff0" align="center">
					<table border="0" cellpadding="5" cellspacing="5" align="center"> 	
					<tr>			
					<c:forEach begin="1" end="${noOfPagesKafkaOffset}" var="i">
						<c:choose>
							<c:when test="${currentPageKafkaOffset eq i}">
								<td><c:out value="${i}" /></td>
							</c:when>
							<c:otherwise>
								<td><a class="process" href="StatusController?action=kafkaStatus&page1=<c:out value="${i}"/>"><c:out value="${i}"/></a></td>
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
	<tr>	
	<td bgcolor="f0fff0" class="statusheader" width="400px" >Kafka Topic Offsets By Partition</td>
	<td bgcolor="f0fff0" align="left">
    	<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2">
        <thead>
            <tr bgcolor="#808080">                                
                <th width="400">Topic Name</th>
                <th width="80">Partition#</th>
                <th width="120">Begin Offset</th>                              
                <th width="120">End Offset</th>                                                  
                <th width="180">Posted Date</th>                   
            </tr>
        </thead>
        <tbody>
        	<c:set var="i" value="0" />
            <c:forEach items="${partoffsetList}" var="partoffsetList">
            <tr bgcolor="
                  	<c:choose>	                 	
            			<c:when test="${i % 2 == 0}">
            				<c:out value="#ffffff"/>    
            			</c:when>            			
            			<c:otherwise>
                    		<c:out value="#ececec"/>
            			</c:otherwise>
            		</c:choose>	       
            		">                                  
                    <td class="process" width="400" align="left"><c:out value="${partoffsetList.topicNm}" /></td>    
                    <td class="process" width="80" align="left"><c:out value="${partoffsetList.partitionNb}" /></td>
                    <td class="process" width="120" align="left"><c:out value="${partoffsetList.beginOffset}" /></td>
                    <td class="process" width="120" align="left"><c:out value="${partoffsetList.endOffset}" /></td>
                    <td class="process" width="180" align="left"><c:out value="${partoffsetList.postedDt}" /></td>                                                            
                </tr>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>                                  
    	<tr>		
			<td colspan = "5" bgcolor="f0fff0" align="center">
			<table border="0" cellpadding="5" cellspacing="5"> 
			<tr>
				<c:forEach begin="1" end="${noOfPagesKafkaPartOffset}" var="i">
					<c:choose>
						<c:when test="${currentPageKafkaPartOffset eq i}">
							<td><c:out value="${i}" /></td>
						</c:when>
						<c:otherwise>
							<td><a class="process" href="StatusController?action=kafkaStatus&page2=<c:out value="${i}"/>"><c:out value="${i}"/></a></td>
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
<!--	
	loadIFrame("prd_req_tm","http://10.46.48.31:3000/dashboard-solo/db/kafka-cluster-operations?var-topic=All&var-broker=All&panelId=32","width:250px;height:200px;border:0px;");
	loadIFrame("csr_fet_tm","http://10.46.48.31:3000/dashboard-solo/db/kafka-cluster-operations?var-topic=All&var-broker=All&panelId=30","width:250px;height:200px;border:0px;");
	loadIFrame("fol_fet_tm","http://10.46.48.31:3000/dashboard-solo/db/kafka-cluster-operations?var-topic=All&var-broker=All&panelId=31","width:250px;height:200px;border:0px;");
	loadIFrame("prd_req_rt","http://10.46.48.31:3000/dashboard-solo/db/kafka-cluster-operations?var-topic=All&var-broker=All&panelId=21","width:250px;height:200px;border:0px;");
	loadIFrame("csr_fet_rt","http://10.46.48.31:3000/dashboard-solo/db/kafka-cluster-operations?var-topic=All&var-broker=All&panelId=22","width:250px;height:200px;border:0px;");
	loadIFrame("fol_fet_rt","http://10.46.48.31:3000/dashboard-solo/db/kafka-cluster-operations?var-topic=All&var-broker=All&panelId=43","width:250px;height:200px;border:0px;");
	loadIFrame("ac_counter","http://10.46.48.31:3000/dashboard-solo/db/kafka-cluster-operations?var-topic=All&var-broker=All&panelId=40","width:250px;height:150px;border:0px;");
	loadIFrame("ur_counter","http://10.46.48.31:3000/dashboard-solo/db/kafka-cluster-operations?var-topic=All&var-broker=All&panelId=41","width:250px;height:150px;border:0px;");
	loadIFrame("op_counter","http://10.46.48.31:3000/dashboard-solo/db/kafka-cluster-operations?var-topic=All&var-broker=All&panelId=42","width:250px;height:150px;border:0px;");
	-->	
	</script>	
</body>
</html>