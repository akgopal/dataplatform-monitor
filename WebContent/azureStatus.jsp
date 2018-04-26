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
	<title>VIG Data Platform - Azure Storage</title>
</head>

<body bgcolor="D8D5D9">
<div class="container">
	<table border="0" bgcolor='white' height="60" cellpadding="0" cellspacing="0" width="1600">
	<tr>
	<td align="left"><img src="img/logo.jpg" alt=""/></td>
	<td align="left">
	<div class="pageheader">Azure Storage</div>
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
	<div id="az_count"></div>	
    </td>
	<td bgcolor="#ffffff" align="center">	
	<div id="az_size"></div>	
    </td>      		
    </tr>
    </table> 	
	<table border="0" cellpadding="20" cellspacing="1" width="1600" bgcolor="bfafb2">
	<tr>	
	<td bgcolor="f0fff0" class="statusheader" width="400px" >Storage Accounts</td>
	<td bgcolor="f0fff0" align="left">
    	<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2">
        <thead>
            <tr bgcolor="#808080">                                
                <th width="180" align="left">Account Name</th>
                <th width="120" align="left">Blob Count</th>
                <th width="120" align="left">Storage Size (gb)</th>                                                                                               
                <th width="120" align="left">Posted Date</th>                   
            </tr>
        </thead>
        <tbody>
        	<c:set var="i" value="0" />
            <c:forEach items="${azureStorage}" var="azureStorage">
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
                    <td class="process" width="180" align="left"><c:out value="${azureStorage.storageNm}" /></td>    
                    <td class="process" width="120" align="left"><c:out value="${azureStorage.fileCount}" /></td>
                    <td class="process" width="120" align="left"><fmt:formatNumber type = "number" maxFractionDigits = "3" value="${azureStorage.directorySize / (1024 * 1024 * 1024)}"/></td>                        
                    <td class="process" width="120" align="left"><c:out value="${azureStorage.postedDt}" /></td>                                                            
                </tr>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>                        
		</tbody>    			
		</table>            			      
    </td>
    </tr>
	<tr>	
	<td bgcolor="f0fff0" class="statusheader" width="400px" >Storage Account Details</td>
	<td bgcolor="f0fff0" align="left">
    	<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2">
        <thead align="left">
            <tr bgcolor="#808080">                                
                <th width="120">Account Name</th>
                <th width="550">Blob Path</th>
                <th width="80">Blob Count</th>
                <th width="100">Blob Size (mb)</th>                                                                                               
                <th width="80">Posted Date</th>                    
            </tr>
        </thead>
        <tbody>
        	<c:set var="i" value="0" />
            <c:forEach items="${azureProperties}" var="azureProperties">
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
                    <td class="process" width="120" align="left"><c:out value="${azureProperties.storageNm}" /></td>    
                    <td class="process" width="550" align="left"><c:out value="${azureProperties.directoryNm}" /></td>
                    <td class="process" width="80" align="left"><c:out value="${azureProperties.fileCount}" /></td>
                    <td class="process" width="100" align="left"><fmt:formatNumber type = "number" maxFractionDigits = "2" value="${azureProperties.directorySize / (1024 * 1024)}"/></td>
                    <td class="process" width="80" align="left"><c:out value="${azureProperties.postedDt}" /></td>                                                            
                </tr>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>     
			<tr>		
				<td colspan = "5" bgcolor="f0fff0" align="center">
					<table border="0" cellpadding="5" cellspacing="5" align="center"> 		
					<tr>
					<c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<td><c:out value="${i}" /></td>
							</c:when>
							<c:otherwise>
								<td><a class="process" href="StatusController?action=azureStatus&page=<c:out value="${i}"/>"><c:out value="${i}"/></a></td>
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
	loadIFrame("az_count","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?panelId=54695","width:700px;height:300px;border:0px;");
	loadIFrame("az_size","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?panelId=54696","width:700px;height:300px;border:0px;");	
	</script>	
</body>
</html>