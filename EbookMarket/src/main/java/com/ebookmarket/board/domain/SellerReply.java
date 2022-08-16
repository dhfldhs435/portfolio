package com.ebookmarket.board.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SellerReply {

	private int sr_num; // 답변 번호
	private int sb_num; // 게시글 번호
	private String sr_title; // 답변 제목
	private String sr_content; // 답변 내용
	private String sr_reg_date; // 등록날짜
	private String sr_pw; // 답변 비밀번호
}
