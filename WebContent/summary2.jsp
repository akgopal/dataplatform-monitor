<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	
	<script src="js/jquery-1.5.1.min.js"></script>	
    <style media="screen">
    #holder {
        height: 820px;
        width: 1060px;
        border:1px solid #000000;
        background-color: #fff
    }
    </style>	
	
	<script src="js/raphael.min.js" type="text/javascript" charset="utf-8"></script>	
 	<script type="text/javascript" charset="utf-8">
            window.onload = function () {
                var board = Raphael("holder"),                
                
                solid = {fill: "none", stroke: "#666", "stroke-dasharray": "#fff"};
                dashed = {fill: "none", stroke: "#666", "stroke-dasharray": "-"};   
                
                datapipe_green = {'stroke': '#668cff','stroke-width': 8};                
                dataflow_green = {'stroke-dasharray': "#fff",'stroke': '#fff','stroke-width': 3, 'fill': '#fff'};
                
                status_green = {fill: "#4dff88", stroke: "#666", "stroke-dasharray": "#fff", opacity: 1};
                status_yellow = {fill: "none", stroke: "#666", "stroke-dasharray": "#fff"};
                status_red = {fill: "none", stroke: "#666", "stroke-dasharray": "#fff"};
                
                (function () {                	                	                	                	
                	<c:set var="i" value="175" />
                	<c:forEach items="${tasks}" var="task">                           	
                	   	board.rect(20, "${i}", 240, 40, 10).attr(status_green);
                	   	board.text(140, "${i + 20}","${task.serverName}");         
                	   	var path = "M 260, " + "${i + 20}" + "L 420," + "${i + 20}";                     	   	
                	   	var pipe = board.path(path).attr(datapipe_green);                                           	   	                	   		
                	   	<c:set var="i" value="${i + 50}" />
                	</c:forEach>
                	
                	<c:set var="i" value="175" />
                	board.setStart();
                	<c:forEach items="${tasks}" var="task">                           	            	   	
            	   		var flow = board.circle(260,"${i + 20}",3);
            	   	   	<c:set var="i" value="${i + 50}" />
                    </c:forEach>
                    var pipeflow = board.setFinish();    	            	   		
                    pipeflow.attr(dataflow_green);      
					pipeflow.animate({
                        	"100%": {cx: 415, easing: ""}
                        }, 2500);                                    
                    setInterval(updateLoop, 2500);
                    
                	board.rect(400, 160, 580, 510, 20).attr(dashed);
                	board.rect(420, 175, 120, 480, 20).attr(solid);                	
                	board.rect(720, 175, 240, 120, 10).attr(solid);
                	
                })();
                
                function updateLoop() {                	               
                	pipeflow.animate({
                    	"100%": {cx: 415, easing: ""}
                    }, 2500);                
                };
                //setInterval(updateLoop, 2500);                  
                              
            };
    </script>		
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />
	<link rel="stylesheet" type="text/css" href="css/monitor.css">
	<title>VIG Data Platform - Summary</title>
</head>

<body bgcolor="D8D5D9">
<div class="container">
	<table border="0" bgcolor='white' height="60" cellpadding="0" cellspacing="0" width="1600">
	<tr>
	<td align="left"><img src="img/logo.jpg" alt=""/></td>
	<td align="left">
	<div class="pageheader">Platform Health</div>
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
	<td bgcolor="f0fff0" align="center">
		<div id="holder"></div>
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