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
	<script src="js/clmenu.js" type="text/javascript"></script>
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />
	<link rel="stylesheet" type="text/css" href="css/monitor.css">	
	<script type="text/javascript">	
		function checkAll(bx) {
	  		var cbs = document.getElementsByTagName('input');	  		
	  		for(var i=0; i < cbs.length; i++) {
	    		if(cbs[i].type == 'checkbox' && cbs[i].className == bx.className) {
	    		cbs[i].checked = bx.checked;
	   			}
	 		}
		}	
		function getTableList(frm)
		{
			var radios= document.getElementsByName("type");
			for (var i = 0, length = radios.length; i < length; i++) {
	    		if (radios[i].checked) {
			        var selectedtype = radios[i].value;
				 break;
	    			}
			}
			if(selectedtype=="2")
			{
				var x="The following object(s) will be added: \n";
				var y;
				for (i = 0; i < frm.AddList.length; i++)
				if (frm.AddList[i].checked)
				{
					x = x + frm.AddList[i].value + "\n";       
					y = y + frm.AddList[i].value;
				}
				if(!y)
				{
					alert("Please select an item to add");
					return false;
				}
				var r = confirm(x);
				if (r == true) {document.forms[0].submit();}
			}
			if(selectedtype=="0" || selectedtype=="1")
			{
				var x="The following object(s) will be updated: \n";
				var y;
				for (i = 0; i < frm.TableList.length; i++)
				if (frm.TableList[i].checked)
				{
					x = x + frm.TableList[i].value + "\n";       
					y = y + frm.TableList[i].value;
				}
				if(!y)
				{
					alert("Please select an item to update.");
					return false;
				}
				var r = confirm(x);
				if (r == true) {document.forms[0].submit();}
			}
		}		
	</script>
	<title>VIG Data Platform - Lake Engine</title>
</head>
<body bgcolor="D8D5D9">
<div class="container">
<form method="POST" action="StatusController?action=lakeEngine">
	<table border="0" bgcolor='white' height="60" cellpadding="0" cellspacing="0" width="1600">
	<tr>
	<td align="left"><img src="img/logo.jpg" alt=""/></td>
	<td align="left"><div class="pageheader">Lake Publish Engine</div></td>
	</tr>
	<tr>
	<td colspan="2" width="1600" align="center" VALIGN="top">
	  <img src="img/border.png" width="1600" height="30">
	</td>
	</tr>	
	</table>
	<hr size="3" width="1600" align="left">			
	<table border="0" cellpadding="20" cellspacing="1" width="1600" bgcolor="bfafb2">
	<tr>		
	<td align="left" class="header">
	</td>			
	<td bgcolor="f0fff0">	
		<input type="radio" name="type" value="2">Add Consumer
		<input type="radio" name="type" value="1" checked>Enable Consumer
		<input type="radio" name="type" value="0">Disable Consumer	
		<input type = "button" name = "Update" value = "Update" onclick = "getTableList(this.form)">	
	</td>
	</tr>
	<tr>		
	<td align="left" class="statusheader">New Consumers</td>			
	<td bgcolor="f0fff0" align="left">
		<c:forEach items="${lakeNewConsumerList}" var="newConsumerList">
	    			<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2" width= "700">					
		    		<tr class="RowToClick" bgcolor="f0fff0">
					<td colspan="2" align="left"><a class="process" id="<c:out value="${newConsumerList.taskNm}"/>"><c:out value="${newConsumerList.taskNm}" /></a></td>
					</tr>	    				    				        		
	            		<tr bgcolor="#808080" class="Child">        
	            			<th width="20" align="left"><input type="checkbox" class='<c:out value="${newConsumerList.taskNm}" />' name = "checkall" onclick="checkAll(this)"></th>           	                		
	                		<th width="400" align="left" >Topic Name</th>
	            		</tr>	        			        						        
        	<c:set var="i" value="0" />
            <c:forEach items="${lakeNewConsumer}" var="lakeNewConsumer">
                <c:if test="${lakeNewConsumer.taskNm == newConsumerList.taskNm}">      	        
	            <tr class="Child" bgcolor="                    
	                  	<c:choose>	            			                  	
	            			<c:when test="${i % 2 == 0}">
	            				<c:out value="#ffffff"/>
	            			</c:when>            			
	            			<c:otherwise>                    
	                    		<c:out value="#ececec"/>
	            			</c:otherwise>
	            		</c:choose>
	            		">
	            		<td align="left" width="20"><input type="checkbox" class='<c:out value="${lakeNewConsumer.taskNm}"/>' name="TableList" value='<c:out value="${lakeNewConsumer.topicNm}"/>'></td>                                 	                    
	                    <td class="process" width="400" align="left" valign="top"><c:out value="${lakeNewConsumer.topicNm}" /></td>
	                	</tr>               
	            </c:if>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>    	        
	    	</table>       
	    	<br>
	    	<br>
    	</c:forEach>	
	</td>
	</tr>
	<tr>	
	<td bgcolor="f0fff0" width="400px" class="statusheader">Consumer Details</td>	
	<td bgcolor="f0fff0" align="left">		
		<c:forEach items="${lakeConsumerList}" var="consumerList">
	    			<table border="0" cellpadding="6" cellspacing="1" bgcolor="bfafb2" width= "700">					
		    		<tr class="RowToClick" bgcolor="f0fff0">
					<td colspan="5" align="left">														
					<a class="process" id="<c:out value="${consumerList.azureStorage}"/>"><c:out value="${consumerList.azureStorage}" /></a>
					</td>
					</tr>	    				    				        		
	            		<tr bgcolor="#808080" class="Child">        
	            			<th width="20" align="left"><input type="checkbox" class='<c:out value="${consumerList.azureStorage}" />' name = "checkall" onclick="checkAll(this)"></th>           
							<th width="30" align="left" >Id</th>	                		
	                		<th width="400" align="left" >Topic Name</th>
	                		<th width="80" align="left" >Enabled Status</th>
	            		</tr>	        			        						        
        	<c:set var="i" value="0" />
            <c:forEach items="${lakeConsumer}" var="lakeConsumer">
                <c:if test="${lakeConsumer.azureStorage == consumerList.azureStorage}">      	        
	            <tr class="Child" bgcolor="                    
	                  	<c:choose>	            			                  	
	            			<c:when test="${i % 2 == 0}">
	            				<c:out value="#ffffff"/>
	            			</c:when>            			
	            			<c:otherwise>                    
	                    		<c:out value="#ececec"/>
	            			</c:otherwise>
	            		</c:choose>
	            		">
	            		<td align="left" width="20"><input type="checkbox" class='<c:out value="${consumerList.azureStorage}"/>' name="TableList" value='<c:out value="${lakeConsumer.consumerId}"/>'></td>                                 
	                    <td class="process" width="30" align="left" valign="top"><c:out value="${lakeConsumer.consumerId}" /></td>	                    
	                    <td class="process" width="400" align="left" valign="top"><c:out value="${lakeConsumer.topicNm}" /></td>
	                    <td class="process" width="80" align="left" valign="top"><c:out value="${lakeConsumer.enabledInd}" /></td>
	                	</tr>               
	            </c:if>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>    	        
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
	</form>          
</div>
<script type="text/javascript">
	$(".menu").load("menu_navigation.html"); 
</script>	  
</body>
</html>