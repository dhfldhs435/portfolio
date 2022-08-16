package com.ebookmarket.admin.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Notice {

	private Integer sn_num; // 판매자회원 공지사항 일련번호
	private String sn_title; // 제목
	private String sn_content; // 내용
	private String sn_writer; // 작성자
	private Date sn_reg_date; // 등록일시
	private String sn_attachment_url; // 첨부파일경로
	private String sn_attachment_name; // 첨부파일원본명
	private MultipartFile sn_attachment; // 첨부파일

	private Integer mn_num; // 일반회원 공지사항 일련번호
	private String mn_title; // 제목
	private String mn_content; // 내용
	private String mn_writer; // 작성자
	private Date mn_reg_date; // 등록일시
	private String mn_attachment_url; // 첨부파일경로
	private String mn_attachment_name; // 첨부파일원본명
	private MultipartFile mn_attachment; // 첨부파일

}
