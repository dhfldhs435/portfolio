<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>

<html lang="ko">
<head>

<meta charset="UTF-8">


<title>댓글</title>

<style type="text/css">
#replyContainer {
	width: 96%;
	margin-top: 10px;
	/* overflow: scroll; */
}

#replyContainer>#comment_write {
	padding: 10px 0px;
	border-top: 1px solid #000066;
	border-bottom: 1px solid #000066;
}

#replyContainer>#comment_write #comment {
	margin-bottom: 8px;
}

#replyContainer>#comment_write label {
	display: inline-block;
	width: 100px;
	/* font-size: 14px; */
	font-weight: bold;
	margin-bottom: 10px;
}

#replyContainer>#comment_write input[type='text'], #replyContainer>#comment_write input[type='password'],
	#replyContainer>#comment_write textarea {
	border: 1px solid #ccc;
	width: 120px;
	vertical-align: middle;
	padding: 3px 10px;
	/* font-size: 12px; */
	line-height: 120%;
}

#replyContainer>#comment_write textarea {
	width: 85%;
	height: 60px;
	vertical-align: middle;
}

.comment_item {
	/* font-size: 13px; */
	color: #333;
	padding: 10px 15px;
	border-bottom: 1px dotted #000066;
	line-height: 150%;
}

.comment_item .writer {
	color: #555;
	line-height: 150%;
	margin-bottom: 5px;
}

.comment_item .writer input {
	vertical-align: middle;
}

.comment_item .writer .name {
	color: #222;
	font-weight: bold;
	/* 	font-size: 14px; */
}

.update_form, .delete_btn, .update_btn, .reset_btn {
	margin-left: 10px;
}

#content {
	width: 65%;
	height: 50px;
	vertical-align: middle;
}

.pwdChkArea {
	position: relative;
	top: -18px;
	left: 220px;
}

.msg_default {
	color: #000099;
	font-weight: bold;
}

.msg_error {
	color: red;
}

.pwdCheckBut, .pwdResetBut {
	margin-right: 8px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	/* 함수명: chkSubmit(유효성 체크 대상, 메시지 내용) 
	 * 출력영역: alert으로.
	 * 예시 : if(!chkSubmit($('#keyword'),"검색어를")) return;
	 * */
	function chkSubmit(item, msg) {
		if (item.val().replace(/\s/g, "") == "") {
			alert(msg + " 입력해 주세요.");
			item.val("");
			item.focus();
			return false;
		} else {
			return true;
		}
	}

	/* 함수명: checkForm(유효성 체크 대상, 메시지 내용) 
	 * 출력영역: placeholder 속성을 이용.
	 * 예시 : if(!chkSubmit($('#keyword'),"검색어를")) return;
	 * */
	function checkForm(item, msg) {
		var message = "";
		if (item.val().replace(/\s/g, "") == "") {
			message = msg + " 입력해 주세요.";
			item.attr("placeholder", message);
			return false;
		} else {
			return true;
		}
	}

	/* 함수명: formCheck(유효성 체크 대상, 출력 영역, 메시지 내용) 
	 * 출력영역: 매개변수 두번째 출력영역에.
	 * 예시 : if(!formCheck($('#keyword'),$('#msg'),"검색어를")) return;
	 * */
	function formCheck(main, item, msg) {
		if (main.val().replace(/\s/g, "") == "") {
			item.css("color", "#000099").html(msg + " 입력해 주세요");
			main.val("");
			return false;
		} else {
			return true;
		}
	}

	/* 함수명: chkData(유효성 체크 대상, 메시지 내용) 
	 * 예시 : if (!chkData("#keyword","검색어를")) return;
	 * */
	function chkData(item, msg) {
		if ($(item).val().replace(/\s/g, "") == "") {
			alert(msg + " 입력해 주세요.");
			$(item).val("");
			$(item).focus();
			return false;
		} else {
			return true;
		}
	}

	/* 배열: 유효성 체크 시 필요한 정규식으로 배열을 초기화.
	 * pattern = [ 아이디 , 비밀번호, 핸드폰번호]
	 * 함수명: inputVerify(배열 인덱스번호, 비교할 값, 출력영역) 
	 * */
	var pattern = [ "((?=.*[a-zA-Z])(?=.*[0-9]).{6,10})",
			"((?=.*[a-zA-Z])(?=.*[0-9@#$%]).{8,12})", "^\\d{3}-\\d{3,4}-\\d{4}" ];
	function inputVerify(index, data, printarea) {
		var data_regExp = new RegExp(pattern[index]);
		var match = data_regExp.exec($(data).val());
		if (match == null) {
			$(printarea).html("입력값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
			$(data).val("");
			return false;
		} else {
			return true;
		}
	}

	function isNumber(input) {
		if ($(input).val() != "") {
			var num_regExp = new RegExp("[0-9]$", "i"); //only number
			var match = num_regExp.exec($(input).val());
			//alert(match);
			if (match == null) {
				alert("숫자를 입력해주세요");
				$(input).val(
						$(input).val().substr(0, $(input).val().length - 1));
			}
		}
	}

	/* 함수명: chkFile(파일명) 
	 * 설명: 이미지 파일 여부를 확인하기 위해 확장자 확인 함수. */
	function chkFile(item) {
		/*
			배열내의 값을 찾아서 인덱스를 반환(요소가 없을 경우-1반환)
			jQuery.inArray(찾을 값, 검색 대상의 배열)
		 */
		var ext = item.val().split('.').pop().toLowerCase();
		if (jQuery.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
			alert('gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.');
			return false;
		} else {
			return true;
		}
	}

	/* 함수명: getDateFormat(날자 데이터) 
	 * 설명 : dataValue의 값을 년-월-일 형식(예시: 2018-01-01)으로 반환.*/
	function getDateFormat(dateValue) {
		var year = dateValue.getFullYear();

		var month = dateValue.getMonth() + 1;
		month = (month < 10) ? "0" + month : month;

		var day = dateValue.getDate();
		day = (day < 10) ? "0" + day : day;

		var result = year + "-" + month + "-" + day;
		return result;
	}
</script>
<script type="text/javascript">
	var replyNum, message = "작성시 입력한 비밀번호를 입력해 주세요.", pwdConfirm = 0, btnKind = "";

	$(function() {
		/* 기본 덧글 목록 불러오기 */

		var mb_num = $("#mb_num").val();
		listAll(mb_num);

		/* 덧글 내용 저장 이벤트 */

		$("#replyInsert").click(
				function() {
					//작성자 이름에 대한 입력여부 검사

					if (!chkData("#mr_title", "이름을"))
						return;

					else if (!chkData("#mr_pw", "비밀번호를"))
						return;

					else if (!chkData("#mr_content", "내용을"))
						return;

					else {
						var insertUrl = "/memberReplies/replyInsert";
						/* 글 저장을 위한 Post 방식의 Ajax 연동 처리 */
						$.ajax({
							url : insertUrl, //전송 url		
							beforeSend : function(xhr) {
								xhr.setRequestHeader("${_csrf.headerName}",
										"${_csrf.token}");
							},
							type : "post", //전송 시 method 방식
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "PUT"

							},
							dataType : "text",
							data : JSON.stringify({
								mb_num : mb_num,
								mr_title : $("#mr_title").val(),
								mr_pw : $("#mr_pw").val(),
								mr_content : $("#mr_content").val()
							}),
							error : function(request, status, error) {
								alert("code:" + request.status + "\n"
										+ "message:" + request.responseText
										+ "\n" + "error:" + error);

							},
							success : function(resultData) {
								if (resultData == "SUCCESS") {
									alert("댓글 등록이 완료되었습니다.");
									dataReset();
									listAll(mb_num);
								}
							}

						});
					}

				});

		/* 수정버튼 클릭시 수정폼 출력 */
		$(document)
				.on(
						"click",
						".update_form",
						function() {
							$(".reset_btn").click();
							var currLi = $(this).parents("li");
							if (pwdConfirm == 0) {
								replyNum = currLi.attr("data-num");
								btnKind = "upBtn";
								pwdView(currLi);
							} else if (pwdConfirm == 1) {
								var conText = currLi.children().eq(1).html();
								//console.log("conText: " + conText);

								currLi.find("input[type='button']").hide();
								var conArea = currLi.children().eq(1);

								conArea.html("");
								var data = "<textarea name='content' id='content'>"
										+ conText + "</textarea>";
								data += "<input type='button' class='update_btn' value='수정완료'>";
								data += "<input type='button' class='reset_btn' value='수정취소'>";
								conArea.html(data);
							}
						});

		/* 초기화 버튼 */
		$(document).on("click", ".reset_btn", function() {
			pwdConfirm = 0;
			btnKind = "";
			var conText = $(this).parents("li").find("textarea").html();
			$(this).parents("li").find("input[type='button']").show();
			var conArea = $(this).parents("li").children().eq(1);
			conArea.html(conText);
		});
		/* 글 수정를 위한 Ajax 연동 처리 */
		$(document).on(
				"click",
				".update_btn",
				function() {
					var mr_num = $(this).parents("li").attr("data-num");
					var mr_content = $("#content").val();
					if (!chkData("#content", "댓글 내용을"))
						return;
					else {
						$.ajax({
							url : '/memberReplies/' + mr_num + ".do", //전송 url
							beforeSend : function(xhr) {
								xhr.setRequestHeader("${_csrf.headerName}",
										"${_csrf.token}");
							},
							type : "put", //전송 시 method 방식
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "PUT"
							},
							data : JSON.stringify({
								mr_content : mr_content
							}),
							dataType : "text",
							success : function(result) {
								console.log("result" + result);
								if (result == "SUCCESS") {
									alert("수정 되었습니다.");
									listAll(mb_num);
									pwdConfirm = 0;
								}
							}
						});
					}
				});
		/* 글 삭제를 위한 Ajax 연동 처리 */
		$(document).on(
				"click",
				".delete_btn",
				function() {
					$(".reset_btn").click();
					var currLi = $(this).parents("li")
					replyNum = currLi.attr("data-num");

					if (pwdConfirm == 0) {
						pwdView(currLi);
						btnKind = "delBtn";
					} else if (pwdConfirm == 1) {
						if (confirm("선택하신 댓글을 삭제하시겠습니다까?")) {
							$.ajax({
								type : "delete", //전송 시 method 방식
								url : "/memberReplies/" + replyNum + ".do", //전송 url
								beforeSend : function(xhr) {
									xhr.setRequestHeader("${_csrf.headerName}",
											"${_csrf.token}");
								},
								headers : {
									"Content-Type" : "application/json",
									"X-HTTP-Method-Override" : "DELETE"
								},
								dataType : "text",
								success : function(result) {
									console.log("result: " + result);
									if (result == "SUCCESS") {
										alert("삭제 되었습니다.");
										listAll(mb_num);

									}
								}
							});
						} else {
							pwdConfirm = 0;

						}
					}
				});

		/* 비밀번호 취소 버튼 클릭 시 처리 이벤트 */
		$(document).on("click", ".pwdResetBut", function() {
			//$(this).parents("li").removeClass("glayLayer");
			//$(this).parent().parent().removeClass("overLayer");
			$(this).parent().parent().html("");
		});

		$(document).on("focus", ".passwd", function() {
			$(this).val("");
			var span = $(this).parents("form").find("span");
			span.removeClass("msg_error");
			span.addClass("msg_default");
			span.html(message);
		});

		/* 비밀번호 확인 버튼 클릭 시 처리 이벤트 */
		$(document).on(
				"click",
				".pwdCheckBut",
				function() {
					var form = $(this).parents("form");
					var pwd = form.find(".passwd");
					var r_msg = form.find(".r_msg");

					var up = $(this).parents("li").find(".update_form");
					var del = $(this).parents("li").find(".delete_btn");

					if (!formCheck(pwd, r_msg, "비밀번호를"))
						return;
					else {
						$
								.ajax({
									url : "/memberReplies/pwdConfirm.do", //전송 url
									beforeSend : function(xhr) {
										xhr.setRequestHeader(
												"${_csrf.headerName}",
												"${_csrf.token}");
									},
									type : "POST", //전송 시 method 방식
									data : "mr_num=" + replyNum + "&mr_pw="
											+ pwd.val(),
									dataType : "text",
									error : function() {
										alert('시스템 오류 입니다. 관리자에게 문의하세요');
									},
									success : function(resultData) {
										if (resultData == 0) {//일치하지 않는 경우
											r_msg.addClass("msg_error");
											r_msg.text("입력한 비민번호가 일치하지 않습니다.");
										} else if (resultData == 1) {//일치할 경우
											pwdConfirm = resultData;
											$(".pwdResetBut").click();

											if (btnKind == "upBtn") {
												up.click();
											} else if (btnKind == "delBtn") {
												del.click();
											}
											btnKind = "";
											pwdConfirm = 0;
										}
									}
								});
					}
				});
	});

	function pwdView(area) {

		$(".pwdResetBut").click();

		var pwd_div = $("<div>");

		var data = "<form name='f_pwd'>"

		data += "<label for='passwd'>비밀번호 : </label>";

		data += "<input type='password' name='passwd' class='passwd' /> ";

		data += "<input type='button' class='pwdCheckBut' value='확인' />";

		data += "<input type='button' class='pwdResetBut' value='취소' />";

		data += "<span class='r_msg msg_default'>" + message + "</span></form>";

		pwd_div.html(data);

		area.append(pwd_div);

	}

	$.ajaxSetup({
		error : function(x, e) {
			if (x.status == 0) {
				alert('You are offline!!n Please Check Your Network.');
			} else if (x.status == 404) {
				alert('Requested URL not found.');
			} else if (x.status == 500) {
				alert('Internel Server Error.');
			} else if (e == 'parsererror') {
				alert('Error.nParsing JSON Request failed.');
			} else if (e == 'timeout') {
				alert('Request Time out.');
			} else {
				alert('Unknow Error.n' + x.responseText);
			}
		}
	});

	//리스트 요청 함수
	function listAll(mb_num) {

		$("#comment_list").html("");
		var url = "/memberReplies/all/" + mb_num + ".do";
		$.getJSON(url, function(data) {
			console.log(data.length);

			$(data).each(function() {
				var mr_num = this.mr_num;
				var mr_title = this.mr_title;
				var mr_content = this.mr_content;
				var mr_reg_date = this.mr_reg_date;
				addNewItem(mr_num, mr_title, mr_content, mr_reg_date);
			});
		}).fail(function() {
			alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
		});
	}

	/* 새로운 글을 화면에 추가하기 위한 함수 */
	function addNewItem(mr_num, mr_title, mr_content, mr_reg_date) {
		//새로운 글이 추가될 li태그 객체
		var new_li = $("<li>");
		new_li.attr("data-num", mr_num);
		new_li.addClass("comment_item");

		//작성자 정보가 지정될 <p>태그
		var writer_p = $("<p>");
		writer_p.addClass("writer");

		//작성자 정보의 이름
		var name_span = $("<span>");
		name_span.addClass("name");
		name_span.html(mr_title + "님");

		//작성 일시
		var date_span = $("<span>");
		date_span.html(" / " + mr_reg_date + " ");

		//수정하기 버튼
		var up_input = $("<input>");
		up_input.attr({
			"type" : "button",
			"value" : "수정하기"
		});
		up_input.addClass("update_form");

		//삭제하기 버튼
		var del_input = $("<input>");
		del_input.attr({
			"type" : "button",
			"value" : "삭제하기"
		});
		del_input.addClass("delete_btn");

		//내용
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(mr_content);

		//조립하기
		writer_p.append(name_span).append(date_span).append(up_input).append(
				del_input)
		new_li.append(writer_p).append(content_p);
		$("#comment_list").append(new_li);
	}

	function dataReset() {
		$("#mr_title").val("");
		$("#mr_pw").val("");
		$("#mr_content").val("");
	}
</script>
</head>
<body>
	<div id="replyContainer">
		<sec:authorize access="hasRole('ROLE_SUPERADMIN')">
		<h1></h1>
		<div id="comment_write">
			<form id="comment_form">
				<div>
					<label for="mr_title">작성자</label> <input type="text"
						name="mr_title" id="mr_title" /> <label for="mr_pw">비밀번호</label>
					<input type="password" name="mr_pw" id="mr_pw" /> <input
						type="button" id="replyInsert" value="저장하기" />
				</div>
				<div>
					<label for="mr_contnet">덧글내용</label>
					<textarea name="mr_content" id="mr_content"></textarea>
				</div>
			</form>
		</div>
		</sec:authorize>
		<ul id="comment_list">
			<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
		</ul>
	</div>



</body>
</html>