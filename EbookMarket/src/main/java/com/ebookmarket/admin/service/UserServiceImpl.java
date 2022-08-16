package com.ebookmarket.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebookmarket.admin.domain.User;
import com.ebookmarket.admin.mapper.UserMapper;
import com.ebookmarket.common.domain.SearchCriteria;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	// 판매자회원 목록 페이지
	@Override
	public List<User> sellerList(SearchCriteria scri) throws Exception {
		return mapper.sellerlist(scri);
	}

	// 탈퇴한 판매자회원 목록 페이지
	@Override
	public List<User> sellerResignList(SearchCriteria scri) throws Exception {
		return mapper.sellerresignlist(scri);
	}

	// 일반회원 목록 페이지
	@Override
	public List<User> memberList(SearchCriteria scri) throws Exception {
		return mapper.memberlist(scri);
	}

	// 탈퇴한 일반회원 목록 페이지
	@Override
	public List<User> memberResignList(SearchCriteria scri) throws Exception {
		return mapper.memberresignlist(scri);
	}

	// 판매자회원 등급 설정
	@Override
	public void setGrade(User user) throws Exception {
		mapper.setGrade(user);
	}

	

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.listCount(scri);
	}

	@Override
	public int mlistCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.mlistCount(scri);
	}

	@Override
	public int srlistCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.mrlistCount(scri);
	}

	@Override
	public int mrlistCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mapper.srlistCount(scri);
	}

}
