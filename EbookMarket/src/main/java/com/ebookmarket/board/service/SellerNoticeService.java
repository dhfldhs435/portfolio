package com.ebookmarket.board.service;

import java.util.List;

import com.ebookmarket.board.domain.SellerNotice;
import com.ebookmarket.common.domain.SearchCriteria;

public interface SellerNoticeService {
	public List<SellerNotice> sellerNoticeList(SearchCriteria scri)throws Exception;

	public SellerNotice sellerNoticeRead(int sn_num)throws Exception;

	public String getPicture(Integer sn_num)throws Exception;

	public int listCount(SearchCriteria scri)throws Exception;
}
