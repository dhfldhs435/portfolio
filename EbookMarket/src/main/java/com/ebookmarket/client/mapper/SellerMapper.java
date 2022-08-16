package com.ebookmarket.client.mapper;

import java.util.List;

import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.domain.Seller;
import com.ebookmarket.client.domain.SellerAuth;
import com.ebookmarket.common.domain.SearchCriteria;

public interface SellerMapper {

	// 등록 처리
	public void create(Seller seller) throws Exception;

	// 권한 생성
	public void createAuth(SellerAuth sellerAuth) throws Exception;

	public void update(Seller seller) throws Exception;

	// 판매자 목록 페이지
	public List<Seller> list() throws Exception;

	public int overlappedID(String id) throws Exception;

	public int overlappedNickname(String nickname) throws Exception;

	public int overlappedEmail(String email) throws Exception;

	public Seller readByUserNum(int s_num) throws Exception;

	public Seller readByUserId(String id);

	public Seller readByUserEmail(String email);

	public Seller readByUserIE(String id, String email);

	public void replacePw(String id, String newEncodedPw);
	
	public int listCount(SearchCriteria scri) throws Exception;

}
