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
public class MemberBoard {

	private int mb_num; // 게시물일련번호
	private int m_num; // 회원 일련번호
	private String mb_id; // 회원 아이디
	private int recnt; // 게시글 댓글의 수 추가

	// @NotBlank(message = "제목은 필수 입력 값입니다.")
	// @Pattern(regexp = "^[a-zA-Z가-힣]{2,5}$")
	private String mb_title; // 제목

	private String mb_writer; // 작성자

	// @NotBlank(message = "게시물내용은 필수 입력 값입니다.")
	private String mb_content; // 내용

	private String mb_processing; // 처리상태

	private Date mb_reg_Date; // 등록일자

	private MultipartFile mb_attachmentFile; // 첨부파일
	private String mb_attachmentFileUrl; // 첨부파일
	private String mb_attachmentFilr_type; // 첨부파일유형

}
