package com.ebookmarket.admin.service;

import java.util.List;

import com.ebookmarket.admin.domain.SalesStatus;
import com.ebookmarket.common.domain.PageRequest;
import com.ebookmarket.common.domain.SearchCriteria;

public interface SalesService {
	// 매출 현황 페이지
	public List<SalesStatus> salesStatus(SearchCriteria scri) throws Exception;

	// 거래 내역 페이지
	public List<SalesStatus> transactionHistory( SearchCriteria scri) throws Exception;

	// 매출 현황 전체 건수를 반환한다.
	public int salesCount(PageRequest pageRequest) throws Exception;

	// 거래 내역 전체 건수를 반환한다.
	public int transactionCount(PageRequest pageRequest) throws Exception;

	public int listCount(SearchCriteria scri)throws Exception;
}
