package com.ebookmarket.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ebookmarket.board.domain.MemberBoard;
import com.ebookmarket.board.domain.MemberReply;
import com.ebookmarket.board.service.MemberBoardService;
import com.ebookmarket.board.service.MemberReplyService;
import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.mapper.MemberMapper;
import com.ebookmarket.client.security.domain.CustomUser;
import com.ebookmarket.client.service.MemberService;
import com.ebookmarket.common.domain.Criteria;
import com.ebookmarket.common.domain.PageMaker;
import com.ebookmarket.common.domain.SearchCriteria;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/memberReplies")
public class MemberReplyController {

	@Autowired
	private MemberBoardService service;

	@Autowired
	private MemberReplyService mrService;

	@Value("${upload.path}")
	private String uploadPath;

	@RequestMapping(value = "/all/{mb_num}.do", method = RequestMethod.GET)
	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_SUPERADMIN')")
	public ResponseEntity<List<MemberReply>> list(@PathVariable("mb_num") Integer mb_num) {
		ResponseEntity<List<MemberReply>> entity = null;
		try {
			entity = new ResponseEntity<List<MemberReply>>(mrService.replyList(mb_num), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<MemberReply>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/***********************************************
	 * 댓글 글쓰기 구현하기
	 * 
	 * @return String 참고 : @RequestBody
	 ***********************************************/
	@RequestMapping(value = "/replyInsert")
	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_SUPERADMIN')")
	public ResponseEntity<String> replyInsert(@RequestBody MemberReply memberReply) {
		log.info("replyInsert 호출 성공");
		ResponseEntity<String> entity = null;
		int result = 0;
		try {
			result = mrService.replyInsert(memberReply);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/***********************************************
	 * 댓글 비밀번호 확인 구현하기
	 * 
	 * @return String 참고 : @RequestBody
	 ***********************************************/
	@RequestMapping(value = "/pwdConfirm.do")
	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_SUPERADMIN')")
	public ResponseEntity<Integer> pwdConfirm(@ModelAttribute MemberReply memberReply) {
		log.info("pwdConfirm 호출 성공");
		ResponseEntity<Integer> entity = null;
		int result = 0;
		try {
			result = mrService.pwdConfirm(memberReply);
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/***********************************************
	 * 댓글 수정 구현하기
	 * 
	 * @return 참고 : REST 방식에서 UPDATE 작업은 PUT,PATCH방식을 이용해서 처리. 전체 데이터를 수정하는 경우에는
	 *         PUT을 이용하고, 일부의 데이터를 수정하는 경우에는 PATCH를 이용.
	 ***********************************************/
	@RequestMapping(value = "/{mr_num}.do", method = { RequestMethod.PUT, RequestMethod.PATCH })
	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_SUPERADMIN')")
	public ResponseEntity<String> replyUpdate(@PathVariable("mr_num") Integer mr_num,
			@RequestBody MemberReply memberReply) {
		log.info("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;
		try {
			memberReply.setMr_num(mr_num);
			mrService.replyUpdate(memberReply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/***********************************************
	 * 댓글 삭제 구현하기
	 * 
	 * @return 참고 : REST 방식에서 DELETE 작업은 DELETE방식을 이용해서 처리.
	 ***********************************************/
	@RequestMapping(value = "/{mr_num}.do", method = RequestMethod.DELETE)
	@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_SUPERADMIN')")
	public ResponseEntity<String> replyDelete(@PathVariable("mr_num") Integer mr_num) {
		log.info("replyDelete 호출 성공");
		ResponseEntity<String> entity = null;
		try {
			mrService.replyDelete(mr_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
