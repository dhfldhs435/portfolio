package com.ebookmarket.admin.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Refund {

	private Integer p_num; // 구매 일련번호
	private String m_id; // 일반회원 아이디
	private String e_title; // 창작물 제목
	private String s_id; // 판매자회원 아이디
	private String s_nickname; // 판매자회원 이름
	private Date p_refund_app_date; // 환불 신청 날짜
	private String p_status; // 구매 상태
	private Integer e_num; // 창작물 일련번호

	private String e_category;	// 창작물 카테고리
	private String e_post_introduce;	// 창작물 소개
	private Integer e_price;	// 창작물 가격
	private Date e_reg_date;	// 창작물 등록일자
	private String p_reason_refund; // 환불 신청 사유
	private String p_reason_refusal; // 환불 거절 사유

}
