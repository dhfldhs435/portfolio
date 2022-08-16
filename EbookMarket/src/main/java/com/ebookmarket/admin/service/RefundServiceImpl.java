package com.ebookmarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.admin.domain.Refund;
import com.ebookmarket.admin.mapper.RefundMapper;
import com.ebookmarket.common.domain.SearchCriteria;

@Service
public class RefundServiceImpl implements RefundService {

	@Autowired
	private RefundMapper mapper;

	// 환불 요청 목록 페이지
	@Override
	public List<Refund> requestList(SearchCriteria scri) throws Exception {
		return mapper.requestlist(scri);
	}
	
	// 환불 요청 정보
	@Override
	public Refund refundInfo(Integer p_num) throws Exception {
		return mapper.refundinfo(p_num);
	}

	// 환불 처리 승인
	@Override
	public void approval(Refund refund) throws Exception {
		mapper.approval(refund);
	}
	
	// 환불 처리 거절
	@Override
	public void refuse(Refund refund) throws Exception {
		mapper.refuse(refund);
	}

	// 창작물 환불횟수 증가
	@Override
	public void addCnt(Integer e_num) throws Exception {
		mapper.addcnt(e_num);
	}

	

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listCount(scri);
	}

}
