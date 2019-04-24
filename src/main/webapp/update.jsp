<!-- This code is property of Willow Woods (Pty) Ltd -->
<!-- @developer: Thato Puoetsile -->
<!-- @qualification: Software Development and Engineering Management -->

<%@ page import="com.demo.*" %>
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
<body>
	<h2>MAIL PROCESSING FORM</h2>
	<p><a href="index.jsp"><img src="images/user.png" title="Log Out"></a>You are logged in as <%= session.getAttribute("user")%></p>
	<div id="formlet">
		<form action="./DBEdit" method="POST">
			<div id="navbar">
				<button type="submit" name="action" class="bttn" value="update" title="Update Record">
					<img alt="Update Record" src="images/update.png">
				</button>
				<div id="space"></div>
				<button type="submit" name="action" class="bttn" value="delete" title="Delete Record">
					<img alt="Delete Record" src="images/delete.png">
				</button>
				<div id="space"></div>
				<button type="submit" name="action" class="bttn" value="home" title="Mail Processing Form">
						<img alt="Mail Processing Form" src="images/home.png">
				</button>
				<div id="space"></div>
				<button type="submit" name="action" class="bttn" value="db" title="View Database">
					<img alt="View DB" src="images/database.png">
				</button>
				</div><br><br>
				
				<label><b>System Id.:</b></label>
				<input type="text" name="ref" value="<%= DBLink2.sqldata[0] %>" readonly><br><br>
				<label><b>Date on Letter:</b></label>
				<input type="text" id="dt" name="letterDate" value="<%= DBLink2.sqldata[1] %> " pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"readonly><br><br>
				<label><b>Originating Department:</b></label>
				<input type="text" name="origin" value="<%= DBLink2.sqldata[2] %>" readonly><br><br>
				<label><b>Subject:</b></label>
				<input type="text" name="sub" value="<%= DBLink2.sqldata[3] %>" readonly><br><br>
				<label><b>Date Received:</b></label>
				<input type="text" id="dt1" name="dateRec" value="<%= DBLink2.sqldata[4] %>" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" readonly><br><br>
				<label><b>Action Officer:</b></label>
				<input type="text" name="officer" value="<%= DBLink2.sqldata[5] %>" list="officers" autocomplete="off"><br><br>
				<datalist id="officers"><select>
				<option value="Director"><option value="Deputy Director"><option value="AD - HR/Administration"><option value="AD - Placement">
				<option value="AD - M&E"><option value="AD - Disbursement"><option value="AD - Costing"><option value="AD - Recovery">
				<option value="AD - Contracts"><option value="CEO - Placement"><option value="CEO - M&E"><option value="CEO - Finance">
				<option value="Head of IT"><option value="Head of Publicity"><option value="Chief Records Officer">
				<option value="PSPO1 (P)"><option value="PSPO2 (P)"><option value="PSPO3 (P)"><option value="PSPO4 (P)">
				<option value="PSPO5 (P)"><option value="PSPO6 (P)"><option value="SSPO1 (P)"><option value="SSPO2 (P)">
				<option value="SSPO3 (P)"><option value="SPO1 (P)"><option value="SSPO2 (P)"><option value="SSPO3 (P)">
				<option value="CPO (M&E)"><option value="PSPO1 (M&E)"><option value="PSPO3 (M&E)"><option value="PSPO4 (M&E)"><option value="PSPO5 (M&E)">
				<option value="PSPO6 (M&E)"><option value="PSPO8 (M&E)"><option value="PSPO10 (M&E)"><option value="PSPO11 (M&E)">
				<option value="PSPO13 (M&E)"><option value="PSPO14 (M&E)"><option value="CAO2 (M&E)"><option value="PAO (M&E)">
				<option value="Intern1 (M&E)"><option value="Intern2 (M&E)">
				</select>
			</datalist>
				<label><b>Reference Number:</b></label>
				<input type="text" name="file" value="<%= DBLink2.sqldata[6] %>"><br><br>
				<label><b>Folio Number:</b></label>
				<input type="text" name="folio" value="<%= DBLink2.sqldata[7] %>"><br><br>
				<label><b>Date Marked:</b></label>
				<input type="text" id="mkd" name="markDate" onchange="days()" value="<%= DBLink2.sqldata[8] %>" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" readonly><br><br>
				<label><b>Days taken to mark:</b></label>
				<input type="text" name="mDays" id="mDays" readonly value="<%= DBLink2.sqldata[9] %>" ><br><br>
				<label><b>Action Date:</b></label>
				<input type="text" id="actn" name="actDate" onchange="aDays()" value="<%= DBLink2.sqldata[10] %>" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" readonly><br><br>
				<label><b>Days Taken to Act:</b></label>
				<input type="text" name="actDays" id="actDays" readonly value="<%= DBLink2.sqldata[11] %>">
		</form>
	</div>
</body>
<script>
		$(function(){
        	$("#mkd").datepicker({ dateFormat: 'yy-mm-dd', 
        		maxDate: new Date(),
        		//defaultDate: new Date(1000, 01, 01)
        	});
        });
		$(function(){
        	$("#actn").datepicker({ dateFormat: 'yy-mm-dd', 
        		maxDate: new Date(),
        		//minDate: new Date($()),
        		//defaultDate: new Date(1000, 01, 01)
        	});
        });
		
		var days = function() {
			let a = new Date(document.querySelector("#dt1").value);
			let b = new Date(document.querySelector("#mkd").value);
			
			if((b.getTime() - a.getTime()) < 0){
				let diff = "Invalid date @ Date Marked";
				document.getElementById("mDays").value = diff;
			}
			else{
				let sec = Math.abs(b.getTime() - a.getTime());
				let diff = Math.ceil(sec / (1000 * 3600 * 24)) + 1;
				document.getElementById("mDays").value = diff;
			}
		}
		
		var  aDays = function(){
			let one = new Date(document.querySelector("#mkd").value);
			let two = new Date(document.querySelector("#actn").value);
			
			if((two.getTime() - one.getTime()) < 0){
				let result = "Invalid date @ Action Date";
				document.getElementById("actDays").value = result;
			}
			else{
				let secs = Math.abs(two.getTime() - one.getTime());
				let result = Math.ceil(secs / (1000 * 3600 * 24)) + 1;
				document.getElementById("actDays").value = result;
			}
		}
</script>
</html>