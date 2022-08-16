<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<body>
	<main class="form-signin">
		<div class="card align-middle"
			style="width: 100%; height: auto; border-radius: 20px;">
			<div class="card-title" style="margin-top: 30px;">
				<div id="find_info" class="new_win mbskin">
					<h2 id="win_title">회원정보 찾기</h2>
					<br>

					<form method="post" action="/idSearch">

						<h4>아이디찾기</h4>
						회원가입 시 등록하신 이메일 주소를 입력해 주세요.<br>
						<p>
						<p>
							<label>E-mail주소 : </label> <input type="text" id="email1"
								placeholder="E-mail" style="font-family: 돋움" />
							<button class="btn btn-outline-primary" type="button"
								id="btnIdSearch">조회</button>
							<br> <font color="red"><span id="email1_olmessage">
							</span></font>
					</form>
					<br>
					<h4>임시비빌번호 발급</h4>
					회원가입 시 등록하신 아이디와 이메일 주소를 입력해 주세요.
					<p>
					<div>
						<form method="post" action="/pwSearch">
							아이디입력 : <input type="text" id="id" placeholder="ID"
								style="font-family: 돋움" />
							<p>
								<font color="red"><span id="id_olmessage"> </span></font> <br>

								이메일입력 : <input type="text" id="email2" placeholder="E-mail"
									style="font-family: 돋움" />
							<p>
								<font color="red"><span id="email2_olmessage"> </span></font>
							<P>
								<button class="btn btn-outline-primary" type="button"
									id="btnPwSearch">조회</button>
							<p>

								<input type="text" text-align="center" id="answer"
									style="width: 20%; font-family: 돋움" placeholder="임시비밀번호 발급용 답안" />
								<button class="btn btn-outline-primary" type="button"
									id="btnsubmit">제출</button>
							<p>
								<font color="blue"><span id="answer_olmessage"> </span></font>
							<p>
								<span id="question_olmessage"> </span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>


<script>
	$("#btnIdSearch")
			.click(
					function() {

						var email = $("#email1").val()

						if (email == "") {

							$("#email1_olmessage").text("이메일을 입력해주세요");

						} else {

							var params = {
								email : email
							}

							$
									.ajax({
										type : "get",
										async : false,
										url : "http://localhost:8080/auth/emailCheck",
										data : params,
										success : function(data) {

											if (data == "null") {

												$("#email1_olmessage")
														.text(
																"해당 이메일로 가입된 유저가 존재하지 않습니다.");

											} else {

												$("#email1_olmessage").text(
														"해당 이메일로 조회된 아이디 : "
																+ data);
												document
														.getElementById('email2').value = email;

											}

										}

									})
						}

					});

	$("#btnPwSearch").click(
			function() {

				var email = $("#email2").val()
				var id = $("#id").val()

				if (id == "") {

					$("#id_olmessage").text("아이디를 입력해주세요");

				}

				if (email == "") {

					$("#email2_olmessage").text("이메일을 입력해주세요");

				} else {

					var params = {

						id : id,
						email : email
					}

					$.ajax({
						type : "get",
						async : false,
						url : "http://localhost:8080/auth/pwCheck",
						data : params,
						success : function(data) {

							if (data == "id") {

								$("#id_olmessage").text("아이디를 다시 입력해주세요.");
								$("#email2_olmessage").text("");

							} else if (data == "email") {

								$("#email2_olmessage").text("이메일을 다시 입력해주세요");
								$("#id_olmessage").text("");

							} else if (data == "both") {

								$("#id_olmessage").text("아이디를 다시 입력해주세요.");
								$("#email2_olmessage").text("이메일을 다시 입력해주세요");

							} else {
								$("#email2_olmessage").text("");
								$("#id_olmessage").text("");
								$("#question_olmessage").text(
										"''회원가입시 입력한 질의응답을 입력바랍니다.''");

							}

						}

					})
				}

			});

	$("#btnsubmit").click(function() {

		var id = $("#id").val()
		var email = $("#email2").val()
		var answer = $("#answer").val()

		if (id == "") {

			$("#id_olmessage").text("아이디를 입력해주세요");

		}

		if (email == "") {

			$("#email2_olmessage").text("이메일을 입력해주세요");

		}

		if (answer == "") {

			$("#answer_olmessage").text("입력한 값을 확인해주세요");

		} else {

			var params = {
				id : id,
				answer : answer
			}

			$.ajax({
				type : "get",
				async : false,
				url : "http://localhost:8080/auth/isPass",
				data : params,
				success : function(data) {
					if (data == "idNull") {

						$("#id_olmessage").text("아이디를 다시 입력해주세요.");

					} else if (data == "null") {

						$("#answer_olmessage").text("오답");

					} else {

						$("#answer_olmessage").text("임시비밀번호 : " + data);
					}
				}
			})
		}

	});
</script>
</html>