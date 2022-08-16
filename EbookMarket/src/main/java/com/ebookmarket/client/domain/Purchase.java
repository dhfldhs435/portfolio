package com.ebookmarket.client.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Purchase {

	private int p_num; // 구매 일련번호
	private boolean p_download; // 구매 상품 다운로드 여부
	private Date p_reg_date; // 구매 날짜
	private String p_status; // 구매 상태
	private String p_type; // 결제 종류
	private int p_total; // 결제 총액
	private String p_reason_refund; // 환불 사유
	private String p_reason_refusal; // 판매자 환불거절 사유
	private Date p_refund_app_date; // 환불신청 날짜
	private int p_rating; // 게시물 평점

	// 추가해야함 select해서 조인해올 컬럼들
	private int e_rating; // 게시물 평점
	private String e_title; // 게시물 제목
	private String e_attachment_url;// 게시물 첨부파일

	private int e_price; // 게시물 가격
	private int e_num; // 게시물 일련번호
	private int m_num; // 일반회원 일련번호
	private int s_num; // 판매자회원 일련번호

	private String elapsedDays; // 구매후 경과일

}
