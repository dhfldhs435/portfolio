package com.ebookmarket.admin.mapper;

import java.util.List;

import com.ebookmarket.admin.domain.Refund;
import com.ebookmarket.common.domain.SearchCriteria;

public interface RefundMapper {

	// 환불 요청 목록 페이지
	public List<Refund> requestlist(SearchCriteria scri) throws Exception;

	// 환불 요청 정보
	public Refund refundinfo(Integer p_num) throws Exception;

	// 환불 처리 승인
	public void approval(Refund refund) throws Exception;
	
	// 환불 처리 거절
	public void refuse(Refund refund) throws Exception;

	// 창작물 환불횟수 증가
	public void addcnt(Integer e_num) throws Exception;

	public int listCount(SearchCriteria scri)throws Exception;

}
