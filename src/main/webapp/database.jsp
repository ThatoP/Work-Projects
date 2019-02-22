<%@ page import="com.demo.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="icon" href="images/favicon.ico">
	<title>MailPro</title>
	<style type="text/css">
		body{
			background-image: url("images/paper.png");
			background-repeat: tile;
			background-color: lightgray;
			align-content: center;
		}
		h2{
			text-align: center;
		}
		p{
			font-size:13px;
			text-align: right;
			margin-right: 30px;
		}
		table,th,td{
			border: 1px solid black;
			padding: 3px;
			font-size: 16px;
		}
		table{
			border-spacing: 1px;
		}
		#tableTop{
			width: 98%;
			height:400px;
			padding: 10px;
			background: white;
			overflow-y: auto;
		}
		img {
			width: 26px;
			height: 26px;
			align-content: center;
		}
	</style>
</head>
<body onload="scrollable()">
	<h2>Incoming Mail Database</h2>
	<p><a href="index.jsp"><img src="images/user.png" title="Log Out"></a>You are logged in as <%= session.getAttribute("user") %></p><br> 
    <%
    	DBConnection.createConnection();
   	 	DBConnection.stmt = DBConnection.con.prepareStatement("SELECT * FROM rmunit.inmail");
   	 	DBConnection.res = DBConnection.stmt.executeQuery();
        %>
        <div id="tableTop">
        	<table id="tablet">
        	<tr>
        		<th>Reference Number</th>
        		<th>Date on Letter</th>
        		<th>Originating Department</th>
        		<th>Subject</th>
        		<th>Date Received</th>
        		<th>Action Officer</th>
        		<th>File/Folio</th>
        		<th>Date Marked</th>
        		<th>Days Taken To Mark</th>
        		<th>Action Date</th>
        		<th>Days Taken To Act</th>
        	</tr>
        	<%
        		DBConnection.res.beforeFirst();
        		while(DBConnection.res.next()){ %>
        			<tr>
        				<td><%= DBConnection.res.getString("RefNumber")%></td>
        				<td><%= DBConnection.res.getString("DateOnLetter")%></td>
        				<td><%= DBConnection.res.getString("OriginDept")%></td>
        				<td><%= DBConnection.res.getString("Subject")%></td>
        				<td><%= DBConnection.res.getString("DateRec")%></td>
        				<td><%= DBConnection.res.getString("ActionOfficer")%></td>
        				<td><%= DBConnection.res.getString("fileFolio")%></td>
        				<td><%= DBConnection.res.getString("DateMarked")%></td>
        				<td><%= DBConnection.res.getString("Days")%></td>
        				<td><%= DBConnection.res.getString("ActDate")%></td>
        				<td><%= DBConnection.res.getString("DaysToAct")%></td>
        			</tr>
        		<%}
        	%>
        </table>
	</div><br><br>
	<a href="mailProForm.jsp"><img src="images/home.png" title="Mail Processing Form"></a>
</body>
<script type="text/javascript">
        var scrollable = function() {
            // Constant retrieved from server-side via JSP
            let maxRows = 15;
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