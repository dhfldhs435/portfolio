<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<style>
body {
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	color: #000000;
	font-size: 15px;
	line-height: 1.6em;
	background-image: linear-gradient(120deg, #FFFFFF 0%, #FFFFFF 100%);
}
/* Table */
.member {
	position: relative;
	width: 100%;
	background-color: #fff;
	border-collapse: collapse;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
	border-radius: 5px;
	overflow: hidden;
	justify-content: center;
	align-items: center;
	background-color: #fff;
}

}
.member caption {
	font-size: 20px;
	margin-bottom: 30px;
}

.member tr {
	border-bottom: 1px solid #eee;
}

.member td {
	padding: 20px;
	text-align: center;
}

.search {
	position: relative;
	right: -40%;
	bottom: 5px;
}

.actionbutton {
	height: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
	justify-content: center;
	justify-content: center;
}

.reg {
	height: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
	justify-content: center;
	justify-content: center;
}

.myButton {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

.myButton:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>
</head>
<body>
	<h1 style="position: static; right: 50%;">계정 정보</h1>
	<br>
	<table class="member">
		<tr>
			<td>이름</td>
			<td align="left">${seller.s_name}</td>
		</tr>

		<tr>
			<td>닉네임</td>
			<td align="left">${seller.s_nickname}</td>
		</tr>

		<tr>
			<td>판매자 등급</td>
			<td align="left">${seller.s_grade}</td>
		</tr>


		<tr>
			<td>이메일</td>
			<td align="left">${seller.s_email}</td>
		</tr>

		<tr>
			<td>핸드폰번호</td>
			<td align="left">${seller.s_phone}</td>
		</tr>


		<tr>
			<td>주소</td>
			<td align="left">${seller.s_address}</td>
		</tr>

		<tr>
			<td>은행명</td>
			<td align="left">${seller.s_bank_name}</td>
		</tr>

		<tr>
			<td>계좌번호</td>
			<td align="left">${seller.s_account_num}</td>

		</tr>

		<tr>
			<td>예금주명</td>
			<td align="left">${seller.s_ah_name}</td>
		</tr>



		<tr>
			<td><br></td>
		</tr>

		<tr>
			<td>자격증 세부사항</td>
			<td align="left">${seller.s_certificate_detail}</td>
		</tr>


		<tr>
			<td>경력, 수상이력 세부사항</td>
			<td align="left">${seller.s_career_detail}</td>
		</tr>

		<tr>
			<td>질문</td>
			<td align="left">${seller.s_answer}</td>
		</tr>

		<tr>
			<td>가입일자</td>
			<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
					value="${seller.s_join_date}" /></td>
		</tr>
	</table>

	<br>
	<div>
		<button class="myButton" type="button"
			onclick="location.href='modify?s_num=${seller.s_num}'">수정</button>
	</div>
	<br>
</body>
<script>
$(function(){
	$('#searchBtn2').click(function(){
		self.location = "/ebook/ebookList"+'${pageMaker.makeQuery(1)}'+"&searchType=" + $("#header option:selected").val() + "&keyword=" + encodeURIComponent($('#keyword2').val());
	});
});
</script>
</html>