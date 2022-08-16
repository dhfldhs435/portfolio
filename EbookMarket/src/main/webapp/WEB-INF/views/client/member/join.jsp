<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 회원가입</title>
<style type="text/css">
.join {
	text-align: left;
	border-collapse: collapse;
	border-spacing: 0px;
	width: 100%;
	height: 100%;
}

.join td {
	border: 1px solid #fff;
	border-radius: 7px;
	background-color: #fff;
	vertical-align: middle;
	outline: none;
	text-indent: 10px;
	font-size: 12px;
	height: 30px;
	outline: none;
}

.join th {
	border: 1px solid #fff;
	border-radius: 7px;
	background-color: #fff;
	vertical-align: middle;
	text-align: right;
	outline: none;
	text-indent: 10px;
	font-size: 15px;
	height: 30px;
}

button {
	margin: 5px;
}

.w-btn {
	position: relative;
	border: none;
	display: inline-block;
	padding: 10px 10px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-outline {
	position: relative;
	padding: 15px 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-indigo {
	background-color: #fff;
	color: #1e6b7b;
}

.w-btn-indigo-outline {
	border: 3px solid aliceblue;
	color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
	color: #1e6b7b;
	background: aliceblue;
}

.w-btn:hover {
	letter-spacing: 2px;
	transform: scale(1.1);
	cursor: pointer;
}

.w-btn-outline:hover {
	letter-spacing: 2px;
	transform: scale(1.1);
	cursor: pointer;
}

.w-btn:active {
	transform: scale(1.1);
}

.w-btn-outline:active {
	transform: scale(1.1);
}

input {
	width: 150px;
	height: 30px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

#rn2 {
	width: 20px;
}

#btnAgree {
	width: 20px;
	height: 15px;
}
</style>

</head>
<body>
	<p align="left">회원가입</p>


	<form:form modelAttribute="member" method="post">
		<table class="join" align="center">
			<!-- 이름 입력 -->
			<tr>
				<th><spring:message code="member.name" /></th>
				<td><form:input path="m_name" placeholder="Name" /> <font
					color="red"><form:errors path="m_name" /></font></td>
			</tr>
			<!-- 아이디 입력 -->
			<tr>
				<th>아이디</th>
				<td><form:input path="m_id" placeholder="Id" />
					<button type="button" id="overlappedID" class="w-btn w-btn-indigo">중복검사</button>
					<span id="olmessage"></span><font color="red"><form:errors
							path="m_id" /></font></td>
			</tr>
			<!-- 비밀번호 입력 -->
			<tr>
				<th><spring:message code="member.pw" /></th>
				<td><input type="password" id="m_pw1" placeholder="Password" /></td>
			</tr>
			<!-- 비밀번호 재확인 -->
			<tr>
				<th><spring:message code="member.pwcheck" /></th>
				<td><form:input type="password" path="m_pw" id="m_pw2"
						placeholder="PasswordCheck" /> <font color="red"><form:errors
							path="m_pw" /></font></td>
			</tr>
			<!-- 이메일 입력 -->
			<tr>
				<th><spring:message code="member.mail" /></th>
				<td><form:input path="m_mail" placeholder="Email" />
					<button type="button" id="overlappedEmail"
						class="w-btn w-btn-indigo">중복검사</button> <span
					id="email_olmessage"> </span> <font color="red"><form:errors
							path="m_mail" /></font></td>
			</tr>
			<!-- 주민등록번호 6자리 입력 -->
			<tr>
				<th><spring:message code="member.residentnum" /></th>
				<td><input type="text" maxlength="6" id="rn1">&nbsp;-&nbsp;<input
					type="password" maxlength="1" id="rn2"> <font size="1px">●●●●●●</font>
					<form:input path="m_resident_num" type="hidden" /> <font
					color="red"><form:errors path="m_resident_num" /></font></td>
			</tr>

			<tr>
				<th>질문</th>
				<td><form:input path="m_answer" /> <font color="red"><form:errors
							path="m_answer" /></font></td>

			</tr>
			<!-- 컨텐츠 이용약관 동의 -->
			<tr>

				<td colspan="2"><jsp:include page="contentAgree.jsp"></jsp:include>
					<input type="radio" id="btnAgree"> <spring:message
						code="action.agree" /></td>
			</tr>
			<!-- 개인정보 이용약관 동의 -->
			<tr>
				<td colspan="2"><jsp:include page="privatyAgree.jsp"></jsp:include>
					<input type="radio" id="btnAgree"> <spring:message
						code="action.agree" /></td>
			</tr>
			<!-- 환불 정책 보기 -->
			<tr>
				<td colspan="2"><jsp:include page="refundAgree.jsp"></jsp:include>
					<input type="radio" id="btnAgree">동의</td>
			</tr>

		</table>

	</form:form>

	<br>
	<h2>${error}</h2>
	<br>
	<div>
		<!-- 회원가입 버튼 -->
		<button type="button" id="btnJoin" class="w-btn w-btn-indigo">
			<spring:message code="action.join" />
		</button>
		<!-- 돌아가기 버튼 -->
		<button type="button" id="btnReset" class="w-btn w-btn-indigo">
			<spring:message code="action.reset" />
		</button>
	</div>

	<script>
		$(document).ready(function() {

			var formObj = $("#member");

			//회원가입
			$("#btnJoin").on("click", function() {
				var rn1 = $("#rn1").val();
				var rn2 = $("#rn2").val();
				document.getElementById('m_resident_num').value = rn1 + rn2;
				formObj.submit();

				//비밀번호 재확인
				if ($("#m_pw1").val() != $("#m_pw2").val()) {
					alert("비밀번호가 일치하지않습니다");
					$("#m_pw2").focus();
					$("#m_pw2").val("");
					return false;

				} else {
					return true;
				}

			});

			//아이디 중복확인
			$("#overlappedID").on("click", function() {
				$("#btnJoin").attr("type", "button");
				const id = $("#m_id").val();

				if (id == "") {
					$("#olmessage").text("ID를 입력해주세요.");
				} else {

					$.ajax({
						type : "get",
						async : false,
						url : "http://localhost:8080/member/idCheck",
						data : {
							id : id
						},
						success : function(data) {
							if (data == 1) {
								$("#olmessage").text("이미 사용중인 ID 입니다.");
							} else {
								$("#olmessage").text("사용 가능한 ID 입니다.");
								$("#btnJoin").attr("type", "submit");
							}
						}

					});

				}

			});

			$("#overlappedEmail").click(function() {
				const email = $("#m_mail").val();

				$.ajax({
					type : "get",
					async : false,
					url : "http://localhost:8080/member/emailCheck",
					data : {
						email : email
					},
					success : function(data) {

						if (data == 2) {

							$("#email_olmessage").text("이메일을 입력해주세요.");

						} else if (data == 1) {

							$("#email_olmessage").text("이미 사용중인 이메일 입니다.");
							document.getElementById('s_email').value = '';

						} else {

							$("#email_olmessage").text("사용 가능한 이메일 입니다.");
						}

					}

				})

			});

			//돌아가기
			$("#btnReset").on("click", function() {
				location.href = "/";
			});

		});
	</script>

</body>
</html>