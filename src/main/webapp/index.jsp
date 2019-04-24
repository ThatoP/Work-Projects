<!-- This code is property of Willow Woods (Pty) Ltd -->
<!-- @developer: Thato Puoetsile -->
<!-- @qualification: Software Development and Engineering Management -->

<%@ page import="com.demo.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
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
			div.background form {
				padding: 25px;
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
		<br><br>
		<h2> Records Management Unit - Mail Processing </h2>
		<div class="background">
			<form action="./controller" method="POST">
				Username: <br>
				<input type="text" name="uname"><br><br>
				Password: <br>
				<input type="password" name="pwd"> <br><br><br>
				<button type="submit" class="button"><b>Log In</b></button>
			</form>
		</div>
	</body>
</html>
