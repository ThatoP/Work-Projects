<!-- This code is property of Willow Woods (Pty) Ltd -->
<!-- @developer: Thato Puoetsile -->
<!-- @qualification: Software Development and Engineering Management -->

<%@ page import="com.demo.*" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MailPro</title>
	<link rel="icon" href="images/favicon.ico">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	%>
	<style>
		.bttn{
			background-color: white;
			border-color: black 1px; 
			width:100px; 
			height:50px;
			cursor: pointer;
		}
		.bttn:hover{
			background-color: lightgray;
		}
		#space{
			width: 50px;
			height: auto;
			display: inline-block;
		}
		body{
			font-family:helvetica, sans-serif, arial;
			font-size: 13px;
			padding: 16px;
			background-image: url("images/paper.png");
			background-repeat: tile;
			background-color: lightgray;
		}
		label {
			float: left;
			width: 150px;
			margin-right: 10px;
			text-align: right;
		}
		input {
			width: 350px;
			margin-left: 50px;
			text-align: left;
			padding: 3px;
		}
		h2{
			text-align:center;
		}
		p{
			font-size:12px;
			text-align: right;
			margin-right: 30px;
		}
		#navbar{
			width: 600px;
		}
		#navbar img{
			width: 26px;
			height: 26px
		}
		ul{
			list-style-type:none;
			overflow: hidden;
			background-color: lightblue;
		}
		li{
			float: left;
		}
		li a{
			display: block;
			color: black;
			text: bold;
			text-align: center;
			padding: 16px;
			text-decoration: none;
		}
		#tablet {
			padding: 10px;
			height: 200px;
			overflow: auto;
		}
		#tableTop{
			width: 98%;
			height: 200px;
			padding: 10px;
			overflow-y: auto;
			background: white;
		}
		th,td{
			border: 1px solid black;
			padding: 3px;
			font-size: 13px;
			height: 30px;
			width: 200px;
		}
		table{
			border-spacing: 1px;
		}
		#formlet{
			padding: 10px;
			margin-left: auto;
			margin-right: auto;
			width: 700px;
			height: 600px;
			max-width: 720px;
		}
		#formlet form{
			width: 600px;
			height: 380px;
		}
	</style>
</head>
<body onload = "scrollable()">
	<%
		//response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		//response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		//response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		//response.setHeader("Pragma","no-cache");
		
		//response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	%>
	
	<h2>SEARCH RESULTS</h2>
	<p><a href="logout.jsp"><img src="images/user.png" title="Log Out" ></a>You are logged in as <%= session.getAttribute("user")%></p>
	<% 
		DBConnection.createConnection(); 
		//Prepare the statement
		DBConnection.stmt = DBConnection.con.prepareStatement("SELECT * FROM rmunit.inmail WHERE RefNum=?");
		//Set parameters
		DBConnection.stmt.setString(1, DBLink.filename);
		//Executing the SQL query
		DBConnection.res = DBConnection.stmt.executeQuery();
	%>
        <div id="tableTop">
        	<table id="tablet">
        	<tr>
        		<th>System Id.</th>
        		<th>Date on Letter</th>
        		<th>Originating Department</th>
        		<th>Subject</th>
        		<th>Date Received</th>
        		<th>Action Officer</th>
        		<th>Reference Number</th>
        		<th>Folio</th>
        		<th>Date Marked</th>
        		<th>Days Taken To Mark</th>
        		<th>Action Date</th>
        		<th>Days Taken To Act</th>
        	</tr>
        	<%
        		DBConnection.res.beforeFirst();
        		while(DBConnection.res.next()){ %>
        			<tr>
        				<td><%= DBConnection.res.getString("id")%></td>
        				<td><%= DBConnection.res.getString("DateOnLetter")%></td>
        				<td><%= DBConnection.res.getString("OriginDept")%></td>
        				<td><%= DBConnection.res.getString("Subject")%></td>
        				<td><%= DBConnection.res.getString("DateRec")%></td>
        				<td><%= DBConnection.res.getString("ActionOfficer")%></td>
        				<td><%= DBConnection.res.getString("RefNum")%></td>
        				<td><%= DBConnection.res.getString("Folio")%></td>
        				<td><%= DBConnection.res.getString("DateMarked")%></td>
        				<td><%= DBConnection.res.getString("Days")%></td>
        				<td><%= DBConnection.res.getString("ActDate")%></td>
        				<td><%= DBConnection.res.getString("DaysToAct")%></td>
        			</tr>
        		<%}%>
        </table>
	</div><br><br>
	<div id="formlet">
		<form action="./DBLink2" method="POST" autocomplete = "off">
			<div id="navbar">
			<button type="submit" name="action" class="bttn" value="save" title="Save Record" disabled>
				<img alt="Save Record" src="images/save.png">
			</button>
			<div id="space"></div>
			<button type="submit" name="action" class="bttn" value="search" title="Search">
				<img alt="Find Record" src="images/search.png">
			</button>
			<div id="space"></div>
			<button type="submit" name="action" class="bttn" value="home" title="Mail Processing Form">
				<img alt="Mail Processing Form" src="images/home.png">
			</button>
			<div id="space"></div>
			<button type="submit" name="action" class="bttn" value="db" title="View Database">
				<img alt="View Database" src="images/database.png">
			</button>
			</div><br><br>
			<label><b>System Id.: </b></label>
			<input type="text" name="ref"><br><br>
			<label><b>Reference Number: </b></label>
			<input type="text" name="file" value="<%= DBLink.filename %>" readonly>
		</form>
	</div>
</body>
<script>
		var scrollable = function() {
            // Constant retrieved from server-side via JSP
            let maxRows = 5;
            let table = document.getElementById('tablet');
            let wrapper = table.parentNode;
            let rowsInTable = table.rows.length;
            let height = 0;
            if (rowsInTable > maxRows) {
                for (var i = 0; i < maxRows; i++) {
                    height += table.rows[i].clientHeight;
                }
                wrapper.style.height = height + "px";
            }
        }
</script>
</html>