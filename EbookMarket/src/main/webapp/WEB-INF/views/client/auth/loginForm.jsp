<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="cotentPath" value="${pageContent.request.contextPath }" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>로그인</title>

<body>
	<main class="form-signin">
		<div class="card align-middle"
			style="width: 100%; border-radius: 20px;">
			<div class="card-title" style="margin-top: 30px;">
				<h2 class="card-title text-center" style="color: #113366;">로그인
				</h2>
				<div class="card-body">
					<form method="post" action="/login">

						<h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
						<label for="inputEmail" class="sr-only">Your ID</label> <input
							type="text" id="uid" name="username" class="form-control"
							placeholder="Your ID" /> <br> <label for="inputPassword"
							class="sr-only">Password</label> <input type="password" id="upw"
							name="password" class="form-control" placeholder="Password"
							required /> <br> <input type="checkbox" name="remember-me">
						<spring:message code="login.keep" />
						<div class="checkbox">
							<sec:csrfInput />
							<label> <a href="/auth/loginSearch">아이디 / 비밀번호 찾기</a> <BR>
								<button class="btn">
									<a href="/member/join"> 일반 회원가입</a>
								</button>
								<button class="btn">
									<a href="/seller/register"> 판매자 회원가입</a>
								</button>
							</label>
							<button class="btn btn-lg btn-primary btn-block">
								<spring:message code="login.login" />
							</button>
						</div>

					</form>
				</div>
				<sec:csrfInput />
			</div>
		</div>
	</main>

</body>



