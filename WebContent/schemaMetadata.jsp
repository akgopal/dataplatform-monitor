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
	<title>VIG Data Platform - Schema Metadata</title>
</head>
<body bgcolor="D8D5D9">
<div class="container">
	<hr size="3" width="1600" align="left">
	<table border="0" cellpadding="20" cellspacing="2" width="1600" bgcolor="ffc0cb">	
	<tr>		
	<td bgcolor="f0fff0" align="left">							
    	<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2" width= "1540"  title="Details of lake consumer Metrics">
        <thead>
            <tr bgcolor="#808080">                                
                <th width="80" align="left">Schema ID</th>
                <th width="80" align="left">Revision No</th>
                <th width="80" align="left">Publish Time</th>                                                                                           
                <th width="500" align="left">Metadata</th>     
            </tr>
        </thead>
        <tbody>
        <c:set var="i" value="0" />
            <c:forEach items="${schemaMetadata}" var="schemaMetadata">        
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
            		<td class="process" width="80" align="left" valign="top"><c:out value="${schemaMetadata.schemaId}" /></td>	                                    
                    <td class="process" width="80" align="left" valign="top"><c:out value="${schemaMetadata.tableVersion}" /></td>
                    <td class="process" width="80" align="left" valign="top"><c:out value="${schemaMetadata.publishDtm}" /></td>
                    <td class="process" width="500" align="left" valign="top">
                    	<table>
                    		<tr>
                    		<td width="480" align="left">
                    		<c:out value="${schemaMetadata.dataSchema}" />
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
	<hr size="3" width="1600" align="left">       
</div> 
</body>
</html>