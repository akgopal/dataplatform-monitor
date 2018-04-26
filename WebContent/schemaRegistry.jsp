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
	<title>VIG Data Platform - Schema Registry</title>
</head>

<body bgcolor="D8D5D9">
<div class="container">
	<table border="0" bgcolor='white' height="60" cellpadding="0" cellspacing="0" width="1600">
	<tr>
	<td align="left"><img src="img/logo.jpg" alt=""/></td>
	<td align="left">
	<div class="pageheader">Schema Registry</div>
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
	<tr bgcolor="f0fff0">	
	<td width="400" class="statusheader">Schema List</td>
	<td bgcolor="f0fff0" align="left">
		<div class="form_round">	
    	<table border="0" cellpadding="15" cellspacing="1" width="780" bgcolor="bfafb2">    	
        <tbody>
            <c:forEach items="${schemaRegistryList}" var="srList">
                <tr bgcolor="#ffffff">                                                            
                    <td><a class="process" href="#<c:out value="${srList.taskNm}" />"><c:out value="${srList.taskNm}" /></a></td>                    
                </tr>
            </c:forEach>
        </tbody>
    	</table>
    	</div>
    </td>
    </tr> 		
	<tr>		
	<td bgcolor="f0fff0" width="400px" class="statusheader">Schema Details</td>	
	<td bgcolor="f0fff0" align="left">		
		<c:forEach items="${schemaRegistryList}" var="schemaRegistryList">			
		<a class="process" id="<c:out value="${schemaRegistryList.taskNm}"/>"><c:out value="${schemaRegistryList.taskNm}" /></a>		
    	<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2" width= "800">
        <thead>
            <tr bgcolor="#808080">                                
                <th width="300">Schema Name</th>
                <th width="300">Table Name</th>                                                                                           
            </tr>
        </thead>
        <tbody>
        <c:set var="i" value="0" />
            <c:forEach items="${schemaRegistry}" var="schemaRegistry">
                <c:if test="${schemaRegistryList.taskNm == schemaRegistry.taskNm}">                
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
                    <td class="process" width="360" align="left" valign="top"><c:out value="${schemaRegistry.schemaNm}" /></td>
                    <td class="process" width="180" align="left" valign="top"><a class="profileLink" href ="#" target="popup" onClick="javascript:window.open('StatusController?action=schemaMetadata&hash=<c:out value="${schemaRegistry.hash}"/>','Metadata','width=1200,height=600,scrollbars=yes'); return false;"><c:out value="${schemaRegistry.tableNm}"/></a></td>
                	</tr>
                </c:if>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>
        </tbody>
    	</table>       
    	<br>
    	<br>
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
</script>	  
</body>
</html>