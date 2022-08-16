package com.ebookmarket.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import com.ebookmarket.board.domain.SellerReply;

import com.ebookmarket.board.service.SellerReplyService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/sellerReplies")
public class SellerReplyController {

	@Autowired
	private SellerReplyService srService;

	@Value("${upload.path}")
	private String uploadPath;

	@RequestMapping(value = "/all/{sb_num}.do", method = RequestMethod.GET)
	@PreAuthorize("hasAnyRole('ROLE_SELLER', 'ROLE_SUPERADMIN')")
	public ResponseEntity<List<SellerReply>> list(@PathVariable("sb_num") Integer sb_num) {
		ResponseEntity<List<SellerReply>> entity = null;
		try {
			entity = new ResponseEntity<List<SellerReply>>(srService.replyList(sb_num), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<SellerReply>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/***********************************************
	 * 댓글 글쓰기 구현하기
	 * 
	 * @return String 참고 : @RequestBody
	 ***********************************************/
	@RequestMapping(value = "/replyInsert")
	@PreAuthorize("hasAnyRole('ROLE_SELLER', 'ROLE_SUPERADMIN')")
	public ResponseEntity<String> replyInsert(@RequestBody SellerReply sellerReply) {
		log.info("replyInsert 호출 성공");
		ResponseEntity<String> entity = null;
		int result = 0;
		try {
			result = srService.replyInsert(sellerReply);
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
	@PreAuthorize("hasAnyRole('ROLE_SELLER', 'ROLE_SUPERADMIN')")
	public ResponseEntity<Integer> pwdConfirm(@ModelAttribute SellerReply sellerReply) {
		log.info("pwdConfirm 호출 성공");
		ResponseEntity<Integer> entity = null;
		int result = 0;
		try {
			result = srService.pwdConfirm(sellerReply);
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
	@RequestMapping(value = "/{sr_num}.do", method = { RequestMethod.PUT, RequestMethod.PATCH })
	@PreAuthorize("hasAnyRole('ROLE_SELLER', 'ROLE_SUPERADMIN')")
	public ResponseEntity<String> replyUpdate(@PathVariable("sr_num") Integer sr_num,
			@RequestBody SellerReply sellerReply) {
		log.info("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;
		try {
			sellerReply.setSr_num(sr_num);
			srService.replyUpdate(sellerReply);
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
	@RequestMapping(value = "/{sr_num}.do", method = RequestMethod.DELETE)
	@PreAuthorize("hasAnyRole('ROLE_SELLER', 'ROLE_SUPERADMIN')")
	public ResponseEntity<String> replyDelete(@PathVariable("sr_num") Integer sr_num) {
		log.info("replyDelete 호출 성공");
		ResponseEntity<String> entity = null;
		try {
			srService.replyDelete(sr_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
