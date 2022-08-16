<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
body {
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	color: #000000;
	font-size: 15px;
	line-height: 1.6em;
	background-image: linear-gradient(120deg, #FFFFFF 0%, #FFFFFF 100%);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}
/* Table */
.member {
	width: 100%;
	background-color: #fff;
	border-collapse: collapse;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
	border-radius: 5px;
	overflow: hidden;
}

.member caption {
	font-size: 20px;
	margin-bottom: 30px;
}

.member tr {
	border-bottom: 1px solid #eee;
}

.member tr:last-child {
	border: none;
}

.member th, .member td {
	padding: 12px;
	text-align: center;
}

.member tr th {
	background-color: #E0E0E0;
	color: #000000;
}

.member tr th:first-child {
	border-radius: 5px 0 0 0;
}

.member tr th:last-child {
	border-radius: 0 5px 0 0;
}

.pagination {
	height: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
	justify-content: center;
	justify-content: center;
}

ul {
	list-style: none;
	float: left;
	display: block;
	text-align: center;
	list-style: none;
}

ul li {
	float: left;
	display: flex;
	padding: 0.3em 0;
	list-style: none;
	border-bottom: 1px solid rgba(0, 0, 0, 0.08);
}

ul li a {
	float: left;
	padding: auto;
	margin-right: auto;
	width: 50px;
	height: 30px;
	color: #000;
	font: bold 16px tahoma;
}

ul li a:hover, ul li a:focus {
	padding: 0 1rem;
	font-size: 1.2rem;
	color: #333;
	background: transparent;
	border: 0;
	outline: 0;
	cursor: pointer;
}

ul li a:hover, ul li a:focus {
	position: relative;
	padding: 1rem 0;
	display: inline-flex;
	justify-content: center;
}

.search {
	position: relative;
	right: -40%;
	bottom: 5px;
}

.actionbutton {
	position: relative;
	left: 48%;
}

input {
	border: none;
}

textarea {
	border: none;
}
</style>
<br>
<br>
<h2>
	<spring:message code="notice.header.member.read" />
</h2>
<br>
<br>
<form:form modelAttribute="notice">
	<form:hidden path="mn_num" />

	<!-- 현재 페이지 번호와 페이징 크기 그리고 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달한다. -->
	<input type="hidden" name="page" value="${pgrq.page}">
	<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
	<input type="hidden" name="searchType" value="${pgrq.searchType}">
	<input type="hidden" name="keyword" value="${pgrq.keyword}">

	<table border="1" align="center" class="member">
		<tr>
			<td><spring:message code="notice.writer" /></td>
			<td align="left" width="270">${notice.mn_writer }</td>
			<td><spring:message code="notice.regdate" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
					value="${notice.mn_reg_date }" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.title" /></td>
			<td colspan="3"><form:input path="mn_title" size="80"
					readonly="true" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.content" /></td>
			<td colspan="3" align="left"><form:textarea path="mn_content"
					cols="100" rows="20" readonly="true" /></td>
		</tr>
		<tr>
			<td><spring:message code="notice.attachmentfile" /></td>
			<c:choose>
				<c:when test="${empty notice.mn_attachment_name }">
					<td colspan="3"><spring:message code="common.attachmentEmpty" /></td>
				</c:when>
				<c:otherwise>
					<td colspan="3"><a
						href="/admin/notice/memberdownload\?mn_num=${notice.mn_num }"><form:input
								path="mn_attachment_name" size="80" readonly="true" /></a></td>
				</c:otherwise>
			</c:choose>
		</tr>
	</table>
</form:form>
<br>
<br>
<div>
	<button type="submit" id="btnModify">
		<spring:message code="action.modify" />
	</button>
	<button type="submit" id="btnRemove">
		<spring:message code="action.remove" />
	</button>
	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>
<br>
<br>
<script>
	$(document).ready(function() {
		var formObj = $("#notice");

		// 현재 페이지 번호와 페이징 크기
		var pageObj = $("#page");
		var sizePerPageObj = $("#sizePerPage");
		var pageVal = pageObj.val();
		var sizePerPageVal = sizePerPageObj.val();

		$("#btnModify").on("click", function() {
			var mn_num = $("#mn_num");
			var mn_numVal = mn_num.val();
			self.location = "/admin/notice/memberModify?mn_num=" + mn_numVal;
		});
		$("#btnRemove").on("click", function() {
			formObj.attr("action", "/admin/notice/memberRemove");
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/admin/notice/memberList";
		});
	});
</script>