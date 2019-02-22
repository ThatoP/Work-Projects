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
	<h2>MAIL PROCESSING FORM</h2>
	<p><a href="index.jsp"><img src="images/user.png" title="Log Out"></a>You are logged in as <%= session.getAttribute("user") %></p>
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
			<input type="text" name="ref" required><br><br>
			<label><b>Date on Letter:</b></label> 
			<input type="text" id="dt" name="letterDate" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"><br><br>
			<label><b>Originating Department:</b></label> 
			<input type="text" name="origin"><br><br>
			<label><b>Subject:</b></label>
			<input type="text" name="sub"><br><br>
			<label><b>Date Received:</b></label> 
			<input type="text" id="dt1" name="dateRec" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"><br><br>
			<label><b>Action Officer:</b></label> 
			<input type="text" name="officer" list="officers" autocomplete="off"><br><br>
			<datalist id="officers"><select>
				<option value="Director">
				<option value="Deputy Director">
				<option value="AD - HR/Administration">
				<option value="AD - Placement">
				<option value="AD - M&E">
				<option value="AD - Disbursement">
				<option value="AD - Costing">
				<option value="AD - Recovery">
				<option value="AD - Contracts">
				<option value="CEO - Placement">
				<option value="CEO - M&E">
				<option value="CEO - Finance">
				<option value="Head of IT">
				<option value="Head of Publicity">
				<option value="Chief Records Officer"></select>
			</datalist>
			<label><b>File/Folio Number: </b></label> 
			<input type="text" name="fileFolio"><br><br>
			<label><b>Date Marked:</b></label> 
			<input type="text" id="mkd" name="markDate" onchange="days()" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"><br><br>
			<label><b>Days taken to mark:</b></label> 
			<input type="text" name="mDays" id="mDays" readonly><br><br>
			<label><b>Action Date:</b></label> 
			<input type="text" id="actn" name="actDate" onchange="aDays()" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"><br><br>
			<label><b>Days Taken to Act:</b></label> 
			<input type="text" name="actDays" id="actDays" readonly><br>
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
			let a = new Date(document.querySelector("#dt1").value);
			let b = new Date(document.querySelector("#mkd").value);
			
			if((b.getTime() - a.getTime()) < 0){
				let diff = "Invalid date @ Date Marked";
				document.getElementById("mDays").value = diff;
			}
			else{
				let sec = Math.abs(b.getTime() - a.getTime());
				let diff = Math.ceil(sec / (1000 * 3600 * 24));
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
				let result = Math.ceil(secs / (1000 * 3600 * 24));
				document.getElementById("actDays").value = result;
			}
		}
	</script>
</html>	