<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
#container {
	width: 1600px;
	height: 1800px;
	margin: auto;
	text-align: center;
	border: 0px;
}

#header {
	width: 1600px;
	padding: 5px;
	margin: auto;
	border: 0px;
	padding: 5px;
}

#main {
	width: 1050px;
	height: 1100px;
	padding: 5px;
	margin-left: 190px;
	float: left;
	border: 0px;
}

#footer {
	width: 1200px;
	clear: both;
	padding: 5px;
	border: 0px;
	background-color: white;
	margin: auto;
}
</style>
<title>Tiles Layout</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
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