package com.ebookmarket.client.domain;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Ebook {

	private int e_num; // 게시물 일련번호
	private int s_num; // 판매자 일련번호

	@NotBlank(message = "제목은 필수 입력 값입니다.")
	private String e_title; // 게시물 제목

	@NotBlank(message = "게시물소개는 필수 입력 값입니다.")
	private String e_post_introduce; // 게시물 소개

	@NotBlank(message = "저자명은 필수 입력 값입니다.")
	private String e_writer; // 게시물 저자

	@NotBlank(message = "저자소개는 필수 입력 값입니다.")
	private String e_profile; // 게시물 저자소개

	@NotBlank(message = "연령제한은 필수 입력 값입니다.")
	private String e_age_limit; // 게시물 연령제한

	private String e_category; // 게시물 카테고리

	@NotBlank(message = "목차는 필수 입력 값입니다.")
	private String e_table_content; // 게시물 목차

	private MultipartFile e_coverimage; // 게시물 표지이미지
	private String e_coverimage_url; // 게시물 표지이미지 url

	private MultipartFile e_attachment; // 게시물 첨부파일
	private String e_attachment_url; // 게시물 첨부파일 url
	private String e_attachment_type; // 게시물 첨부파일유형

	private MultipartFile e_thumbnail; // 게시물 미리보기이미지
	private String e_thumbnail_url; // 게시물 미리보기이미지 url

	private int e_rating; // 게시물 평점
	private int e_rating_cnt; // 게시물 평점 부여횟수

	private Date e_reg_date; // 게시물 등록일시

	private String e_status; // 게시물 등록 상태

	private int e_price; // 게시물 가격
	private int e_refund_cnt; // 게시물 환불 횟수
	private int e_view_cnt; // 게시물 조회 횟수
	private int e_sell_cnt; // 게시물 판매 횟수
	private int e_download_cnt; // 게시물 다운로드 횟수

	private String e_reg_approval; // 게시물 등록 승인
	private String e_del_approval; // 게시물 삭제 승인

}
