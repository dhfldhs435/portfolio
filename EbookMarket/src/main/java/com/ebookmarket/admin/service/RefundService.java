package com.ebookmarket.admin.service;

import java.util.List;

import com.ebookmarket.admin.domain.Refund;
import com.ebookmarket.common.domain.SearchCriteria;

public interface RefundService {
	// 환불 요청 목록 페이지
	public List<Refund> requestList(SearchCriteria scri) throws Exception;
	
	// 환불 요청 정보
	public Refund refundInfo(Integer p_num) throws Exception;
	
	// 환불 승인 처리
	public void approval(Refund refund) throws Exception;
	
	// 환불 거절 처리
	public void refuse(Refund refund) throws Exception;
	
	// 창작물 환불횟수 증가
	public void addCnt(Integer e_num) throws Exception;

	public int listCount(SearchCriteria scri)throws Exception;
}
