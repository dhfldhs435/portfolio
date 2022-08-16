package com.ebookmarket.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ebookmarket.board.domain.SellerReply;
import com.ebookmarket.board.mapper.SellerReplyMapper;

@Service
@Transactional
public class SellerReplyServiceImpl implements SellerReplyService {

	@Autowired
	private SellerReplyMapper srMapper;

	// 글목록 구현
	@Override
	public List<SellerReply> replyList(Integer sb_num) throws Exception {
		List<SellerReply> myList = null;
		myList = srMapper.replyList(sb_num);
		return myList;
	}

	// 글입력 구현
	@Override
	public int replyInsert(SellerReply sellerReply) throws Exception {
		int result = 0;
		try {
			result = srMapper.replyInsert(sellerReply);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int pwdConfirm(SellerReply sellerReply) throws Exception {
		int result = 0;
		result = srMapper.pwdConfirm(sellerReply);
		return result;
	}

	// 글수정 구현
	@Override
	public int replyUpdate(SellerReply sellerReply) throws Exception {
		int result = 0;
		try {
			result = srMapper.replyUpdate(sellerReply);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 글삭제 구현
	@Override
	public int replyDelete(int sr_num) throws Exception {
		int result = 0;
		try {
			result = srMapper.replyDelete(sr_num);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
