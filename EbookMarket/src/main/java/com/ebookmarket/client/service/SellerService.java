package com.ebookmarket.client.service;

import java.util.List;

import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.domain.Seller;
import com.ebookmarket.common.domain.SearchCriteria;

public interface SellerService {

	// 등록 처리
	public void register(Seller seller) throws Exception;

	public void modify(Seller seller) throws Exception;

	// 판매자 목록 페이지
	public List<Seller> list() throws Exception;

	public int overlappedID(String id) throws Exception;

	public int overlappedNickname(String nickname) throws Exception;

	public int overlappedEmail(String email) throws Exception;

	public Seller readByUserId(String id) throws Exception;

	public Seller readByUserNum(int s_num) throws Exception;

	public Seller readByUserEmail(String email) throws Exception;

	public Seller readByUserIE(String id, String email) throws Exception;

	public void replacePw(String id, String newEncodedPw) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;

}
