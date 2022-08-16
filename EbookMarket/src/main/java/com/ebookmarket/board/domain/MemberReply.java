package com.ebookmarket.board.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberReply {

	private int mr_num; // 답변 번호
	private int mb_num; // 게시글 번호
	private String mr_title; // 답변 제목
	private String mr_content; // 답변 내용
	private String mr_reg_date; // 등록날짜
	private String mr_pw; // 답변 비밀번호
}
