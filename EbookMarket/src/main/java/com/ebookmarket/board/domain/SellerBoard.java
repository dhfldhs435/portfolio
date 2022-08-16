package com.ebookmarket.board.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SellerBoard {

	private int sb_num; // 게시물일련번호
	private int s_num; // 회원 일련번호
	private String sb_id; // 회원 아이디
	private String sb_writer; // 작성자
	private int recnt; // 게시글 댓글의 수 추가

	// @NotBlank(message = "제목은 필수 입력 값입니다.")
	// @Pattern(regexp = "^[a-zA-Z가-힣]{2,5}$")
	private String sb_title; // 제목

	// @NotBlank(message = "게시물내용은 필수 입력 값입니다.")
	private String sb_content; // 내용

	private String sb_processing; // 처리상태

	private Date sb_reg_Date; // 등록일자

	private MultipartFile sb_attachmentFile; // 첨부파일
	private String sb_attachmentFileUrl; // 첨부파일
	private String sb_attachmentFilr_type; // 첨부파일유형

}
