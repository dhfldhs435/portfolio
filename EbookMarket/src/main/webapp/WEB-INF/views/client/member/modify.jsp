<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 70%;
	background-color: #fff;
	border-collapse: collapse;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
	border-radius: 5px;
	overflow: hidden;
	justify-content: center;
	align-items: center;
	background-color: #fff;
	bottom: 5px;
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
	<h1 style="position: static; right: 50%;">계정 관리</h1>

	<form:form modelAttribute="member" action="modify"
		enctype="multipart/form-data">
		<br>
		<form:input path="m_num" type="hidden" />
		<table class="member" align="center">
			<tr>
				<td>기존 비밀번호</td>
				<td><input type="password" id="pw" class="pw" /><span
					id="pw_olmessage"> </span></td>
			</tr>

			<tr>
				<td>변경할 비밀번호</td>
				<td><input type="password" id="pw1" class="pw1" /><span
					id="alert-lengthDanger"
					style="display: none; color: #d92742; font-weight: bold;">8자이상
						입력해주세요.</span></td>
			</tr>

			<tr>
				<td>비밀번호 확인</td>
				<td><form:input path="m_pw" type="password" id="pw2"
						class="pw2" /> <span id="alert-success" style="display: none;">비밀번호가
						일치합니다.</span> <span id="alert-danger"
					style="display: none; color: #d92742; font-weight: bold;">비밀번호가
						일치하지 않습니다.</span></td>
				<td><font color="red"><form:errors path="m_pw" /></font></td>
			</tr>

			<tr>
				<td>이메일</td>
				<td><form:input path="m_mail" type="email" />
					<div>
						<span id="email_olmessage"> </span>
					</div>
					<div>
						<input class="myButton" type="button" id="overlappedEmail"
							value="중복검사">
					</div></td>
				<td><font color="red"><form:errors path="m_mail" /></font></td>
			</tr>

			<tr>
				<td>질문</td>
				<td><form:input path="m_answer" /></td>
				<td><font color="red"><form:errors path="m_answer" /></font></td>

			</tr>
			<tr>
				<td colspan="2"><button class="myButton" type="button"
						id="btnModify">수정</button></td>
			</tr>
		</table>
	</form:form>






</body>
<script>
	$("#overlappedEmail").click(function() {
		const email = $("#m_mail").val();

		$.ajax({
			type : "get",
			async : false,
			url : "http://localhost:8080/seller/emailCheck",
			data : {
				email : email
			},
			success : function(data) {

				if (data == 2) {

					$("#email_olmessage").text("이메일을 입력해주세요.");

				} else if (data == 1) {

					$("#email_olmessage").text("이미 사용중인 이메일 입니다.");
					document.getElementById('m_mail').value = '';

				} else {

					$("#email_olmessage").text("사용 가능한 이메일 입니다.");
				}

			}

		})

	});

	//기존비밀번호 확인
	$('.pw').focusout(function() {
		var pw = $("#pw").val();
		var m_num = $("#m_num").val();

		$.ajax({
			type : "get",
			async : false,
			url : "http://localhost:8080/seller/pwCheck",
			data : {
				pw : pw,
				s_num : s_num
			},
			success : function(data) {

				if (data == 2) {

					$("#pw_olmessage").text("기존 비밀번호를 입력해주세요.");

				} else if (data == 0) {

					$("#pw_olmessage").text("비밀번호가 일치하지 않습니다.");
					document.getElementById('pw').value = '';

				} else {

					$("#pw_olmessage").text("비밀번호가 확인되었습니다.");
				}

			}

		})

	});

	//비밀번호 8자 미만으로 입력시 공백처리
	$('.pw1').focusout(function() {
		var pwd1 = $("#pw1").val();

		if (pwd1.length < 8) {
			$("#alert-lengthDanger").css('display', 'inline-block');
			document.getElementById('pw1').value = '';

		} else {

			$("#alert-lengthDanger").css('display', 'none');
		}

	});

	//비밀번호 일치 확인
	$('.pw2').focusout(function() {
		var pwd1 = $("#pw1").val();
		var pwd2 = $("#pw2").val();

		if (pwd1 != '' && pwd2 == '') {
			null;
		} else if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#alert-success").css('display', 'inline-block');
				$("#alert-danger").css('display', 'none');
			} else {
				$("#alert-success").css('display', 'none');
				$("#alert-danger").css('display', 'inline-block');
				document.getElementById('pw2').value = '';
			}
		}
	});

	$(document).ready(function() {

		var formObj = $("#member");

		$("#btnModify").on("click", function() {

			formObj.submit();
		});

	});
</script>

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
</html>