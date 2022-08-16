package com.ebookmarket.client.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.domain.Seller;
import com.ebookmarket.client.domain.SellerAuth;
import com.ebookmarket.client.mapper.SellerMapper;
import com.ebookmarket.common.domain.SearchCriteria;

@Service
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SellerMapper mapper;

	// 등록 처리
	@Override
	public void register(Seller seller) throws Exception {
		mapper.create(seller);
		// 권한 생성
		SellerAuth sellerAuth = new SellerAuth();
		sellerAuth.setAuth("ROLE_SELLER");

		mapper.createAuth(sellerAuth);
	}

	@Override
	public int overlappedID(String id) throws Exception {
		int result = mapper.overlappedID(id);
		return result;

	}

	@Override
	public int overlappedNickname(String nickname) throws Exception {
		int result = mapper.overlappedNickname(nickname);
		return result;
	}

	@Override
	public int overlappedEmail(String email) throws Exception {
		int result = mapper.overlappedEmail(email);
		return result;
	}

	@Override
	public Seller readByUserId(String id) throws Exception {
		Seller loginSeller = mapper.readByUserId(id);
		return loginSeller;
	}

	@Override
	public Seller readByUserEmail(String email) throws Exception {
		Seller loginSeller = mapper.readByUserEmail(email);
		return loginSeller;
	}

	@Override
	public List<Seller> list() throws Exception {
		return mapper.list();
	}

	@Override
	public void replacePw(String id, String newEncodedPw) throws Exception {
		mapper.replacePw(id, newEncodedPw);

	}

	@Override
	public void modify(Seller seller) throws Exception {
		mapper.update(seller);

	}

	@Override
	public Seller readByUserNum(int s_num) throws Exception {
		Seller loginSeller = mapper.readByUserNum(s_num);
		return loginSeller;
	}

	@Override
	public Seller readByUserIE(String id, String email) throws Exception {
		Seller loginMember = mapper.readByUserIE(id, email);
		return loginMember;
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return mapper.listCount(scri);
	}

}
