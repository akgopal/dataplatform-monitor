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
	<title>VIG Data Platform - Attunity Monitor</title>
</head>

<body bgcolor="D8D5D9">
<div class="container">
	<table border="0" bgcolor='white' height="60" cellpadding="0" cellspacing="0" width="1600">
	<tr>
	<td align="left"><img src="img/logo.jpg" alt=""/></td>
	<td align="left"><div class="pageheader">Attunity Monitor</div></td>
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
	<tr bgcolor="#ffffff" >		
	<td align="center">	
	<div id="task_memory"></div>	
    </td>
	<td align="center">	
	<div id="task_metric"></div>	
    </td>    
    </tr>
    <tr bgcolor="#ffffff" >
    <td align="center">
    	<div id="system_load"></div>
    </td>
    <td align="center">
    	<div id="system_cpu"></div>
    </td>    
    </tr>
    <tr bgcolor="#ffffff" >
    <td align="center">
    	<div id="system_mem"></div>
    </td>
    <td align="center">
    	<div id="system_disk"></div>
    </td>    
    </tr>    
    </table> 
<!-- <table border="0" cellpadding="20" cellspacing="1" width="1600" bgcolor="bfafb2" >
	<tr>	
	<td bgcolor="f0fff0" class="statusheader" align="center">CloverETL Task Detail</td>
	</tr>		
	</table>
 -->
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
	loadIFrame("task_memory","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?panelId=6&theme=light","width:750px;height:300px;border:0px;");
	loadIFrame("task_metric","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?panelId=7&theme=light","width:750px;height:300px;border:0px;");
	loadIFrame("system_load","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?var-inter=%24__auto_interval&panelId=54694&theme=light","width:750px;height:300px;border:0px;");
	loadIFrame("system_cpu","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?var-inter=%24__auto_interval&panelId=28239&theme=light","width:750px;height:300px;border:0px;");
	loadIFrame("system_mem","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?var-inter=%24__auto_interval&panelId=12054&theme=light","width:750px;height:300px;border:0px;");
	loadIFrame("system_disk","http://10.46.48.31:3000/dashboard-solo/db/operational-dashboard?var-inter=%24__auto_interval&panelId=52240&theme=light","width:750px;height:300px;border:0px;");		
</script>	  
</body>
</html>