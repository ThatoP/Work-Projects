<!-- This code is property of Willow Woods (Pty) Ltd -->
<!-- @developer: Thato Puoetsile -->
<!-- @qualification: Software Development and Engineering Management -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="icon" href="images/favicon.ico">
	<title>MailPro</title>
	<style>
			body {
				background-image: url("images/dtefBack.png");
				background-repeat: no-repeat;
				background-position: center;
				background-attachment: fixed;
			
			}
			h2{
				font-family: helvetica, sans-serif;
				text-align: center;
			}
			p{
				font-size:18px;
				color: red;
				text-align: centre;
				margin-right: 10px;
			}
			div.background {
				background-color: rgb(255,255,255,0.5);
				border: 1px solid black;
				padding: 50px;
				width: 200px;
				height: 200px;
				position: fixed;
				margin: auto;
				top: 0;
				bottom:0;
				right:0;
				left:0;
				display: inline-block;
			}
			#space{
				width: 15px;
				height: auto;
				display: inline-block;
			}
			div.background form {
				padding: 5px;
			}
			button.button {
				border: none;
				background-color:rgb(66,161,244);
				color: black;
				font-size: 10px;
				padding: 12px;
				cursor: pointer;
				text-align: center
			}
			button:hover {
				background-color:blue;
			}
		</style>
</head>
<body>
	<%
		//response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		//response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		//response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		//response.setHeader("Pragma","no-cache");
	%>
	<br><br>
		<h2> Records Management Unit - Mail Processing </h2>
		<div class="background">
			<form action="./logoutController" method="POST">
				<p><b>Are you sure you want to quit the application?</b></p>
				<input type="radio" name="decision" value="No"><label> No </label>
				<div id="space"></div>
				<input type="radio" name="decision" value="Yes"> <label> Yes </label> <br><br>
				<button type="submit" class="button"><b>Submit</b></button>
			</form>
		</div>
</body>
</html>