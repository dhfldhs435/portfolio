package com.ebookmarket.client.service;

import java.util.List;

import com.ebookmarket.client.domain.Ebook;
import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.domain.Purchase;
import com.ebookmarket.common.domain.SearchCriteria;

public interface PurchaseService {

	// 상품 구매 처리
	public void register(Member member, Ebook ebook) throws Exception;

	// 구매 상품 목록보기
	public List<Purchase> memberDownloadList(SearchCriteria scri) throws Exception;

	// 구매 상품 상세보기
	public Purchase read(Integer p_num) throws Exception;

	// 평점 처리
	public void modify(Ebook ebook) throws Exception;

	public void refundApply(Purchase purchase) throws Exception;

	public List<Purchase> refundList(SearchCriteria scri) throws Exception;

	public void refundProcess(Purchase purchase) throws Exception;

	public void refundApproval(Purchase purchase) throws Exception;

	public List<Purchase> memberRefundList(SearchCriteria scri) throws Exception;

	public List<Purchase> sellerSalesList(SearchCriteria scri) throws Exception;

	public void refund_cnt(int e_num) throws Exception;

	public void download_cnt(int e_num) throws Exception;

	public void downloadComplate(int p_num) throws Exception;

	public void ratingComplate(Purchase purchase) throws Exception;

	public int listCount(SearchCriteria scri)throws Exception;
}
