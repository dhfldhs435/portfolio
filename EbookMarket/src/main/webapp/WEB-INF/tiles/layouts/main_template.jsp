<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#container {
	width: 100%;
	height: 100%;
	text-align: center;
}

#header {
	padding: 5px;
	margin-bottom: 5px;
	margin-left: 10%;
	margin-right: 10%;
	border: 1px solid #ebedf0;
}

#side {
	width: 200px;
	height: auto;
	margin-left: 10%;
	float: left;
	background-color: #f5f7fa;
	border: 0px solid #bdbcbc;
	font-size: 10px;
}

#main {
	width: 62%;
	margin-left: 20px;
	float: left;
	border: 0px solid #bcbcbc;
}

#main a {
	color: black;
	/*padding: 10px 10px;*/
	text-decoration: none;
	display: block;
}

#footer {
	clear: both;
	border: 0px solid #bcbcbc;
	background-color: #f5f7fa;
	margin-left: 10%;
	margin-right: 10%;
}

#footer a {
	color: black;
	text-decoration: none;
	button
}
</style>
<title>Tiles Layout Main</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="side">
			<tiles:insertAttribute name="side" />
		</div>
		<div id="main">
			<tiles:insertAttribute name="main" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

</body>
</html>