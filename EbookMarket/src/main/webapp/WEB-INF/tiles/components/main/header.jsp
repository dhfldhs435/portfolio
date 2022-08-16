<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
request.setCharacterEncoding("utf-8");
%>
<style>
.ebooksearch {
	width: 500px;
	height: 60px;
	padding: 10px;
	background: #f5f5f5;
	width: 500px;
	margin-left: 10%;
}

.ebooksearch .inputText {
	clear: both;
	width: 400px;
	height: 40px;
}

.ebooksearch input {
	width: 170px;
	height: 10px;
	padding: 10px;
	line-height: 10px;
	float: left;
	border: 0;
	background: white;
	border-radius: 3px 0 0 3px
}

.ebooksearch input:focus {
	outline: 0;
	background: #fff;
	box-shadow: 0 0 2px rgba(0, 0, 0, .8) inset
}

.searchBtn2 {
	overflow: visible;
	position: relative;
	float: right;
	border: 0;
	padding: 0;
	cursor: pointer;
	height: 40px;
	width: 70px;
	font: bold 20px/35px '돋움';
	line-height: 30px;
	color: black;
	background: #e0e0e0;
	border-radius: 0 3px 3px 0;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, .3);
}

.img {
	text-align: left;
}
</style>

<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath }" />
<table style="width: 100%">
	<tr>
		<td class="img"><a href="/" class="img"><img
				src="${contextPath }/resources/img/ebookLogo.jpg" width="150x150"></a></td>



		<td><div class="ebooksearch">
				<select name="searchType" id="header" style="display: none;">
					<option value="tcw"
						<c:out value="${scri.searchType eq 't' eq 'w' eq 'tc' ? 'selected' : ''}"/>>-----</option>
					<option value="t"
						<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>
					</option>
					<option value="w"
						<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>
					</option>
					<option value="tc"
						<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>
						+</option>
				</select> <input type="text" name="keyword" id="keyword2" class="inputText"
					value="${scri.keyword2 }" />

				<button class="searchBtn2" id="searchBtn2" type="button">검색</button>
			</div></td>
	</tr>
</table>


<script>
	$(function() {
		$('#searchBtn2').click(
				function() {
					self.location = "/ebook/ebookList"
							+ '${pageMaker.makeQuery(1)}' + "&searchType="
							+ $("#header option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keyword2').val());
				});
	});
</script>