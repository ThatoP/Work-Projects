<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MailPro</title>
	<link rel="icon" href="images/favicon.ico">
	<style type="text/css">
		body{
			background-image:url("images/paper.png");
			background-repeat:tile;
			background-color: lightgray;
			font-family: helvetica, sans-serif,arial;
			padding: 16px;
		}
		h2{
			text-align: center;
			color: red;
	</style>
</head>
<body onload = "note2()">
	<h2>Operation successful</h2>
	<script type="text/javascript">
		var note2 = function(){
			window.alert("The operation was successful!!");
			open("mailProForm.jsp");
			this.window.close();
		}
	</script>
</body>
</html>