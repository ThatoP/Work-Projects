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
  	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	%>
	<style>
		.bttn{
			background-color:white; 
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
		#box {
			border: 2px solid black;
			height: 50px;
			width: 100px;
			background-color: white;
			display: inline-block;
			
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
	<%
		//response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		//response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		//response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		//response.setHeader("Pragma","no-cache");
		
		//response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	%>
	<h2>MAIL PROCESSING FORM</h2>
	<p><a href="logout.jsp"><img src="images/user.png" title="Log Out"></a>You are logged in as <%= session.getAttribute("user") %></p>
	<div id="formlet">
		<form action="./DBLink" method="POST" autocomplete = "off">
			<div id="navbar">
			<button type="submit" name="action" class="bttn" value="save" title="Save Record">
				<img alt="Save Record" src="images/save.png">
			</button>
			<div id="space"></div>
			<button type="submit" name="action" class="bttn" value="search" title="Search">
				<img alt="Find Record" src="images/search.png">
			</button>
			<div id="space"></div>
			<button type="reset" value="Reset" class="bttn" title="Clear Form">
				<img alt="Clear Text" src="images/clear.png">
			</button>
			<div id="space"></div>
			<button type="submit" value="db" name="action" class = "bttn" title="View Database">
				<img alt="View DB" src="images/database.png" >
			</button>
			</div><br><br>
			<label><b>Reference Number:</b></label>
			<input type="text" name="file" ><br><br>
			<label><b>Date on Letter:</b></label> 
			<input type="text" id="dt" name="letterDate" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" readonly><br><br>
			<label><b>Originating Department:</b></label> 
			<input type="text" name="origin"><br><br>
			<label><b>Subject:</b></label>
			<input type="text" name="sub"><br><br>
			<label><b>Date Received:</b></label> 
			<input type="text" id="dt1" name="dateRec" onchange="days()" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" readonly><br><br>
			<label><b>Action Officer:</b></label> 
			<input type="text" name="officer" list="officers" autocomplete="off"><br><br>
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
			<label><b>Folio Number: </b></label> 
			<input type="text" name="folio"><br><br>
			<label><b>Date Marked:</b></label> 
			<input type="text" id="mkd" name="markDate" onchange="days(); aDays()" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" readonly><br><br>
			<label><b>Days taken to mark:</b></label> 
			<input type="text" name="mDays" id="mDays" pattern="[0-9]" readonly><br><br>
			<label><b>Action Date:</b></label> 
			<input type="text" id="actn" name="actDate" onchange="aDays()" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" readonly><br><br>
			<label><b>Days Taken to Act:</b></label> 
			<input type="text" name="actDays" id="actDays" pattern="[0-9]" readonly><br>
		</form>
	</div>
</body>
<script>
		$(function(){
        	$("#dt").datepicker({ 
        		dateFormat: 'yy-mm-dd',
        		maxDate: new Date() 
        		});
        });
		$(function(){
        	$("#dt1").datepicker({ 
        		dateFormat: 'yy-mm-dd', 
        		maxDate: new Date(),
        		minDate: new Date(document.querySelector("#dt").value)
        	});
        });
		$(function(){
        	$("#mkd").datepicker({ dateFormat: 'yy-mm-dd',
        		maxDate: new Date(), 
        		//defaultDate: new Date(1000, 01, 01)
        	});
        });
		$(function(){
        	$("#actn").datepicker({ dateFormat: 'yy-mm-dd',
        		maxDate: new Date(), 
        		//defaultDate: new Date(1000, 01, 01)
        	});
        });
		
		//autocalculating the number of days fields
		var days = function() {
			var a = new Date(document.querySelector("#dt1").value);
			var b = new Date(document.querySelector("#mkd").value);
			
			if (a.getTime() >= 0){
				if((b.getTime() - a.getTime()) < 0){
					document.getElementById("mDays").value = "Invalid input";
				}
				else if((b.getTime() - a.getTime()) >= 0){
					let sec = b.getTime() - a.getTime();
					let diff = Math.ceil(sec / (1000 * 3600 * 24)) + 1;
					document.getElementById("mDays").value = diff;
				}
				else {
					document.getElementById("mDays").value = "0";
					document.getElementById("actDays").value = "0";
					
				}
			}
			else {
				document.getElementById("mDays").value = "NaN";
			}
		}
		
		var  aDays = function(){
			let one = new Date(document.querySelector("#mkd").value);
			let two = new Date(document.querySelector("#actn").value);
			
			if (one.getTime() >= 0){
				if((two.getTime() - one.getTime()) < 0){
					document.getElementById("actDays").value = "Invalid input";
				}
				else if((two.getTime() - one.getTime()) >= 0){
					let secs = two.getTime() - one.getTime();
					let result = Math.ceil(secs / (1000 * 3600 * 24)) + 1;
					document.getElementById("actDays").value = result;
				}
				else{
					document.getElementById("actDays").value = "0";
				}
			}
			else {
				document.getElementById("actDays").value = "NaN";
			}
		}
	</script>
</html>	