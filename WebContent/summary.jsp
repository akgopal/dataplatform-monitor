<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	
	<script src="js/jquery-1.5.1.min.js"></script>	
    <style media="screen">
    #holder {
        height: 720px;
        width: 1060px;
        border:0px solid #000000;
        background-color: #f0fff0
    }
    </style>	
	<script>
	     var time = new Date().getTime();
	     $(document.body).bind("mousemove keypress", function(e) {
	         time = new Date().getTime();
	     });
	
	     function refresh() {
	         if(new Date().getTime() - time >= 300000) 
	             window.location.reload(true);
	         else 
	             setTimeout(refresh, 10000);
	     }
	     setTimeout(refresh, 10000);
	</script>	
	
	<script src="js/raphael.min.js" type="text/javascript" charset="utf-8"></script>	
 <script type="text/javascript" charset="utf-8">
 
    window.onload = function () {
                var board = Raphael("holder"),                
                
                //Color schemes
                
                solid = {fill: "none", stroke: "#666", "stroke-dasharray": "#fff"};
                dashed = {fill: "none", stroke: "#666", "stroke-dasharray": "-"};   

                status_green   = {fill: "90-#688e26-#03440c", stroke: "#688e26", "stroke-dasharray": "#fff", opacity:0.5};
                datapipe_green = {fill: "90-#f44708-#03440c", stroke: "#688e26", "stroke-width": 8};
                dataflow_green = {fill: "#f44708", stroke: "#fff", "stroke-width": 1 };      
                attn_green = {fill: "#688e26", stroke: "#fff", "stroke-width": 1 };
                                
                status_yellow   = {fill: "90-#faa613-#f44708", stroke: "#faa613", "stroke-dasharray": "#fff", opacity:0.5};
                datapipe_yellow = {fill: "90-#faa613-#f44708", stroke: "#faa613", "stroke-width": 8};
                dataflow_yellow = {fill: "#faa613", stroke: "#fff", "stroke-width": 1 };                   
                                
                status_red     = {fill: "90-#f44708-#a10702", stroke: "#f44708", "stroke-dasharray": "#fff", opacity:0.5};
                datapipe_red   = {fill: "90-#f44708-#a10702", stroke: "#f44708", "stroke-width": 8};
                dataflow_red   = {fill:"#f44708", stroke: "#fff", "stroke-width": 1}; 
                attn_red   = {fill:"#f44708", stroke: "#fff", "stroke-width": 1};

                azureContainer  = {fill: "90-#efebce-#efebce", stroke: "#efebce", "stroke-dasharray": "#fff", opacity:0.5};
                serverContainer = {fill: "90-#008cff-#00fff3", stroke: "#008cff", "stroke-dasharray": "#fff", opacity:0.5};
                server_green = {fill: "90-#67597a-#544e61", stroke: "#67597a", "stroke-dasharray": "#fff", opacity:0.5};
                server_red   = {fill: "90-#ce796b-#ff6b6b", stroke: "#ce796b", "stroke-dasharray": "#fff", opacity:0.5};
                
                azure   = {fill: "90-#07f-#008cff", stroke: "#07f", "stroke-dasharray": "#fff", opacity:0.5};
                                
                var animGreen = Raphael.animation({"50%": {cx: 415, easing: ""}}, 2500).repeat(Infinity);
                var animYellow = Raphael.animation({"50%": {cx: 415, easing: ""}}, 5000).repeat(Infinity);
                               
                (function () {                	                     	           	

            		hover3Func = function() {
            			this.text.hide(); this.animate({"fill-opacity": 1, 'transform':"s2.5 2.5"}, 500); this.hint.show();
            		};
            		hover13Func = function() {
            			this.text.hide(); this.animate({"fill-opacity": 1, 'transform':"s1.3 1.3"}, 500); this.hint.show();
            		};            		
            		hoverFunc = function() {
            			this.text.hide(); this.animate({"fill-opacity": 1, 'transform':"s2 2"}, 500); this.hint.show();
            		};
            		hideFunc = function() {
            			this.animate({"fill-opacity": 0.8, 'transform':"s1 1"}, 500); this.text.show(); this.hint.hide();      
            		};                  	
                	
                	//portco sources
                	<c:set var="i" value="175" />
                	<c:forEach items="${tasks}" var="task">                	                	
                	<c:set var="newline" value="\n" />
                	
            		<c:choose>
            			<c:when test="${task.taskStatus == 0}">
            				<c:set var="statustext" value="down" />            					            					
						</c:when>
            			<c:when test="${task.taskStatus == 1}">
            				<c:set var="statustext" value="up" />            					            					
						</c:when>							
					</c:choose>                	
                	
                	var path = "M 280, " + "${i + 20}" + "L 420," + "${i + 20}";	
                		var portco${i} = board.rect(60, "${i}", 220, 40, 10);
                		portco${i}.text  = board.text(170, "${i + 20}","${task.orgName}").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"});                		
                		portco${i}.hint  = board.text(170, "${i + 20}","status:${statustext}${newline}lag:${task.latency}sec").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"});
                		var ppath${i}  = board.path(path);
                	   	var srcflow${i}   = board.circle(260,"${i + 20}",5);
                	   	
                	   	<c:forEach items="${attnSStatus}" var="attn">
                	   		<c:if test="${task.serverName == attn.hostname}">
                	   			var attnserver${i}  = board.circle(260,"${i + 20}",10);
                	   			board.text(280, "${i - 50}","${attn.usageCpu}${newline}${attn.usageMem}").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"});                	   			
                        	   		<fmt:parseNumber var = "cpuvalue" type = "number" value = "${attn.usageCpu}" />                        	   			
                            	   	<fmt:parseNumber var = "memvalue" type = "number" value = "${attn.usageMem}" />
                            	   	<c:choose>	                          	   		
                        				<c:when test="${cpuvalue > 5}">
                        				attnserver${i}.attr(attn_red);            					            					
                        				</c:when>    
                        				<c:when test="${memvalue > 80}">
                        				attnserver${i}.attr(attn_red);            					            					
                    					</c:when>              				
                        				<c:otherwise>                    
                        				attnserver${i}.attr(attn_green);
                        				</c:otherwise>
                        			</c:choose>                	   			                	   			
                	   		</c:if>                	   		
                	   	</c:forEach>                	   	
                	   	portco${i}.hint.hide();                	   	                		             		
                	   	portco${i}.hover(hover13Func,hideFunc);                                     	   	
                	   	
                	   	<c:choose>             	
            				<c:when test="${task.taskStatus == 0}">
            					portco${i}.attr(status_red);
            					ppath${i}.attr(datapipe_red);
            					srcflow${i}.attr(dataflow_red);
            				</c:when>
            				<c:when test="${task.latency > 3600}">
	        					portco${i}.attr(status_yellow);
    	    					ppath${i}.attr(datapipe_yellow);
        						srcflow${i}.attr(dataflow_yellow);
        						srcflow${i}.animate(animYellow);
        					</c:when>            			            				
            				<c:otherwise>                    
            					portco${i}.attr(status_green);
            					ppath${i}.attr(datapipe_green);
            					srcflow${i}.attr(dataflow_green);
            					srcflow${i}.animate(animGreen);
            				</c:otherwise>
            			</c:choose>
                	   	<c:set var="i" value="${i + 50}" />
                	</c:forEach>
                	
                	//azure container
                	var azurecon = board.rect(400, 140, 400, 530, 20).attr(dashed);
                	azurecon.text = board.text(710, 130, "Azure Virtual Network").attr({"font-family": "Arial", "font-size": 12, "fill":"#666", "curson":"pointer"});
                	board.text(510, 160, "Sourcing Engine").attr({"font-family": "Arial", "font-size": 12, "fill":"#666", "curson":"pointer"});
                	board.rect(420, 175, 180, 480, 20).attr(serverContainer);
                	board.text(510, 310, "Clover Cluster").attr({"font-family": "Arial", "font-size": 12, "fill":"#666", "curson":"pointer"});
                	                 	                	
                	//clover server status
                	<c:set var="i" value="200" />
                	<c:set var="vPrevserverName" value="" />
                	<c:set var="cpuDetails" value="" />
                	
                	<c:forEach items="${cloverSStatus}" var="clover">                		
                		<c:if test="${clover.hostname != vPrevserverName}">                	                			         	
                			var server = board.rect(440, "${i}", 140, 40, 10);
                			server.text  = board.text(510, "${i + 20}","${fn:replace(clover.hostname,'-prod-vm','')}").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"});
                			<c:set var="cpuDetails" value="" />
                		</c:if>               		
                	   	<fmt:parseNumber var = "cpuvalue" integerOnly="true" type = "number" value = "${clover.usageCpu}" />
                    	<fmt:parseNumber var = "memvalue" integerOnly="true" type = "number" value = "${clover.usageMem}" />
                    	<fmt:parseNumber var = "status" integerOnly="true" type = "number" value = "${clover.status}" />                		
            			<c:choose>
                    		<c:when test="${status == 0}">
                    		<c:set var="statustext" value="down" />            					            					
							</c:when>
                    		<c:when test="${status == 1}">
                    		<c:set var="statustext" value="running" />            					            					
							</c:when>							
						</c:choose>
                    	<c:if test="${not empty clover.usageCpu}">
                			<c:set var="cpuDetails" value="${cpuDetails}${newline}cpu:${cpuvalue}%" />
                		</c:if>
                		<c:if test="${not empty clover.usageMem}">
            				<c:set var="cpuDetails" value="${cpuDetails}${newline}mem:${memvalue}%" />
            			</c:if>
                		<c:if test="${not empty clover.status}">
        					<c:set var="cpuDetails" value="${cpuDetails}${newline}service:${statustext}" />
        				</c:if>            			
                		server.hint  = board.text(510, "${i - 50}","${cpuDetails}").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"});
                		server.hint.hide();                	   	                		             		
                		server.hover(hoverFunc,hideFunc);                	   	                	   	                	   	           	   	
                	   	<c:choose>	                          	   		
            				<c:when test="${cpuvalue > 5}">
            					server.attr(server_red);            					            					
            				</c:when>    
            				<c:when test="${memvalue > 80}">
        						server.attr(server_red);            					            					
        					</c:when>
            				<c:when test="${status == 0}">
    							server.attr(server_red);            					            					
    						</c:when>        					
            				<c:otherwise>                    
            					server.attr(server_green);
            				</c:otherwise>
            			</c:choose>        
                		<c:if test="${clover.hostname != vPrevserverName}">                	
            				<c:set var="vPrevserverName" value="${clover.hostname}" />                	
            				<c:set var="i" value="${i + 50}" />       
            			</c:if>               			            			
                	</c:forEach>                
                	
                	var ppath  = board.path("M 420, 320 L 600, 320");
                	board.text(510, 330, "Kafka Cluster").attr({"font-family": "Arial", "font-size": 12, "fill":"#666", "curson":"pointer"});

                	//kafka server status
                	<c:set var="i" value="440" />
                	<c:set var="vPrevserverName" value="" />
                	<c:set var="cpuDetails" value="" />
                	<c:set var="newline" value="\n" />
                	<c:forEach items="${kafkaSStatus}" var="kafka">                		
                		<c:if test="${kafka.hostname != vPrevserverName}">                	                			         	
                			var server = board.rect("${i}", 360,  40, 110, 10);
                			server.text  = board.text("${i + 20}", 415, "${fn:replace(kafka.hostname,'-prod-vm','')}").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff", "curson":"pointer"}).transform('R-90');
                			<c:set var="cpuDetails" value="" />
                		</c:if>               		
                	   	<fmt:parseNumber var = "cpuvalue" integerOnly="true"  type = "number" value = "${kafka.usageCpu}" />
                    	<fmt:parseNumber var = "memvalue" integerOnly="true" type = "number" value = "${kafka.usageMem}" />                		
                		<c:if test="${not empty kafka.usageCpu}">
                			<c:set var="cpuDetails" value="${cpuDetails}${newline}cpu:${cpuvalue}%" />
                		</c:if>
                		<c:if test="${not empty kafka.usageMem}">
            				<c:set var="cpuDetails" value="${cpuDetails}${newline}mem:${memvalue}%" />
            			</c:if>            		                		                		
                		server.hint  = board.text("${i - 30}", 410, "${cpuDetails}").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"}).transform('R-90');
                		server.hint.hide();                	   	                		         		
                		server.hover(hoverFunc,hideFunc);                	   	                	   	                	   	           	   	
                	   	<c:choose>	                          	   		
            				<c:when test="${cpuvalue > 5}">
            					server.attr(server_red);            					            					
            				</c:when>    
            				<c:when test="${memvalue > 80}">
        						server.attr(server_red);            					            					
        					</c:when>              				
            				<c:otherwise>                    
            					server.attr(server_green);
            				</c:otherwise>
            			</c:choose>        
                		<c:if test="${kafka.hostname != vPrevserverName}">                	
            				<c:set var="vPrevserverName" value="${kafka.hostname}" />                	
            				<c:set var="i" value="${i + 50}" />       
            			</c:if>               			            			
                	</c:forEach>                   	
                	
                	//zookeeper server status
                	<c:set var="i" value="440" />
                	<c:set var="vPrevserverName" value="" />
                	<c:set var="cpuDetails" value="" />
                	<c:set var="newline" value="\n" />
                	<c:forEach items="${zookeeperSStatus}" var="zoo">                		
                		<c:if test="${zoo.hostname != vPrevserverName}">                	                			         	
                			var server = board.rect("${i}", 520,  40, 110, 10);
                			server.text  = board.text("${i + 20}", 575, "${fn:replace(zoo.hostname,'-prod-vm','')}").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff", "curson":"pointer"}).transform('R-90');
                			<c:set var="cpuDetails" value="" />
                		</c:if>               		
                	   	<fmt:parseNumber var = "cpuvalue" integerOnly="true"  type = "number" value = "${zoo.usageCpu}" />
                        <fmt:parseNumber var = "memvalue" integerOnly="true" type = "number" value = "${zoo.usageMem}" />                		
                		<c:if test="${not empty zoo.usageCpu}">
                			<c:set var="cpuDetails" value="${cpuDetails}${newline}cpu:${cpuvalue}%" />
                		</c:if>
                		<c:if test="${not empty zoo.usageMem}">
            				<c:set var="cpuDetails" value="${cpuDetails}${newline}mem:${memvalue}%" />
            			</c:if>            		                		                		
                		server.hint  = board.text("${i - 30}", 570, "${cpuDetails}").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"}).transform('R-90');
                		server.hint.hide();                	   	                		         		
                		server.hover(hoverFunc,hideFunc);                	   	                	   	                	   	           	   	
                	   	<fmt:parseNumber var = "cpuvalue" type = "number" value = "${zoo.usageCpu}" />
                	   	<fmt:parseNumber var = "memvalue" type = "number" value = "${zoo.usageMem}" />
                	   	<c:choose>	                          	   		
            				<c:when test="${cpuvalue > 5}">
            					server.attr(server_red);            					            					
            				</c:when>    
            				<c:when test="${memvalue > 80}">
        						server.attr(server_red);            					            					
        					</c:when>              				
            				<c:otherwise>                    
            					server.attr(server_green);
            				</c:otherwise>
            			</c:choose>        
                		<c:if test="${zoo.hostname != vPrevserverName}">                	
            				<c:set var="vPrevserverName" value="${zoo.hostname}" />                	
            				<c:set var="i" value="${i + 50}" />       
            			</c:if>               			            			
                	</c:forEach>                 	
                	
                    var animlGreen = Raphael.animation({"50%": {cx: 715, easing: ""}}, 2500).repeat(Infinity);
                    var animlYellow = Raphael.animation({"50%": {cx: 715, easing: ""}}, 5000).repeat(Infinity);                	
					
                    // Lake publishing                	
                	<c:set var="i" value="420" />
                	<c:forEach items="${lakeStatus}" var="lake">
                		var path = "M 720, " + "${i + 20}" + "L 600," + "${i + 20}";	                	                		
                	   	var ltext  = board.text(660, "${i + 10}","${lake.feedName}").attr({"font-family": "Arial", "font-size": 12, "fill":"#666"});                         	   	                     	   	
                	   	var lpath  = board.path(path);
                	   	var lakeflow   = board.circle(600,"${i + 20}",5);
                	   	<c:choose>	            			                  	
            				<c:when test="${lake.lakeStatus == 0}">            					
            					lpath.attr(datapipe_red);
            					lakeflow.attr(dataflow_red);
            				</c:when>
            				<c:when test="${lake.lakeLatency > 3600}">	        					
    	    					lpath.attr(datapipe_yellow);
    	    					lakeflow.attr(dataflow_yellow);
    	    					lakeflow.animate(animlYellow);
        					</c:when>            			            				
            				<c:otherwise>                                					
            					lpath.attr(datapipe_green);
            					lakeflow.attr(dataflow_green);
            					lakeflow.animate(animlGreen);
            				</c:otherwise>
            				</c:choose>
                	   	<c:set var="i" value="${i + 20}" />
                	</c:forEach>
					
                	//Schema Registry
                	var sr = board.rect(620, 180, 60, 60, 10);                	
                	<c:forEach items="${schemaStatus}" var="schemaStatus">                	
                		<fmt:parseNumber var = "status" integerOnly="true" type = "number" value = "${schemaStatus.status}" />
            		                	
                		<c:choose>
            				<c:when test="${status == 0}">
            					<c:set var="statustext" value="down" />
            					sr.attr(attn_red);
							</c:when>
            				<c:when test="${status == 1}">
            					<c:set var="statustext" value="up" />
            					sr.attr(attn_green);
							</c:when>							
						</c:choose>	                	
	                	
	                	sr.text = board.text(650, 210, "sr").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"});
        	        	sr.hint  = board.text(650, 210,"schema registry${newline}status:${statustext}").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"});
            	    	sr.hint.hide();                	   	                		         		
                		sr.hover(hover3Func,hideFunc);                	
                	</c:forEach>
                	
                	//MySQL
                	var ms = board.rect(620, 250, 60, 60, 10);
                	ms.text = board.text(650, 280, "mys").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"});
                	<c:forEach items="${mysqlStatus}" var="mysqlStatus">                	
                	<fmt:parseNumber var = "status" integerOnly="true" type = "number" value = "${mysqlStatus.status}" />
                	<c:if test="${mysqlStatus.hostname == '10.46.48.22'}">
	            		<c:choose>
    						<c:when test="${status == 0}">    							
    							ms.attr(attn_red);
							</c:when>
    						<c:when test="${status == 1}">    							
    							ms.attr(attn_green);
							</c:when>							
						</c:choose>	                	
        			</c:if>                  	
            		<c:choose>
					<c:when test="${status == 0}">
						<c:set var="statustext" value="down" />
						ms.attr(attn_red);
					</c:when>
					<c:when test="${status == 1}">
						<c:set var="statustext" value="running" />
						ms.attr(attn_green);
					</c:when>							
					</c:choose>	                   	   
					<c:set var="clusterDetails" value="${clusterDetails}${newline}${mysqlStatus.hostname}:${statustext}" />        	        
                	</c:forEach>                	
                	ms.hint  = board.text(650, 280,"mysql cluster${newline}${clusterDetails}").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"});
                	ms.hint.hide();                	   	                		         		
                	ms.hover(hover3Func,hideFunc);                	
                	
                	//Lake Storage
                	var lake = board.rect(720, 420, 60, 160, 10).attr(azure);
                	lake.text = board.text(750, 500, "Azure Lake").attr({"font-family": "Arial", "font-size": 12, "fill":"#fff"}).transform('R-90');
                	<c:set var="i" value="430" />
                	<c:set var="azlake" value="" />
                	<c:forEach items="${azureStorage}" var="azureStorage">                		
                		//<fmt:formatNumber var = "azfile" type = "number" maxFractionDigits = "1" value="${azureStorage.fileCount}"/>                		             		                		
                		<c:set var="azfiles" value="${azfiles + azureStorage.fileCount}" />
                		<c:set var="azSize" value="${azSize + azureStorage.directorySize}" />
                		<fmt:formatNumber var = "azsizeGb" type = "number" maxFractionDigits = "3" value="${azSize / (1024 * 1024 * 1024)}"/>
                	</c:forEach>
                	lake.hint  = board.text(750, 500,"files:${azfiles}${newline}size:${azsizeGb} gb").attr({"font-family": "Arial", "font-size": 12, "font-weight": "normal", "fill":"#fff"});
                	lake.hint.hide();                	   	                		         		
                	lake.hover(hoverFunc,hideFunc);                        	
                })();                                                               
            };
    </script>		
    
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />
	<link rel="stylesheet" type="text/css" href="css/monitor.css">
	<link rel="stylesheet" type="text/css" href="css/shapes.css">
	<title>VIG Data Platform - Summary</title>
</head>

<body bgcolor="D8D5D9">
<div class="container">
	<table border="0" bgcolor='white' height="60" cellpadding="0" cellspacing="0" width="1600">
	<tr>
	<td align="left"><img src="img/logo.jpg" alt=""/></td>
	<td align="left">
	<div class="pageheader">Platform Overview</div>
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