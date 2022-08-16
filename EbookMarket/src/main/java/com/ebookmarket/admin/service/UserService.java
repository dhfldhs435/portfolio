package com.ebookmarket.admin.service;

import java.util.List;

import com.ebookmarket.admin.domain.User;
import com.ebookmarket.common.domain.SearchCriteria;

public interface UserService {
	// 판매자회원 목록 페이지
	public List<User> sellerList(SearchCriteria scri) throws Exception;

	// 탈퇴한 일반회원 목록 페이지
	public List<User> sellerResignList(SearchCriteria scri) throws Exception;

	// 일반회원 목록 페이지
	public List<User> memberList(SearchCriteria scri) throws Exception;

	// 탈퇴한 일반회원 목록 페이지
	public List<User> memberResignList(SearchCriteria scri) throws Exception;

	// 판매자회원 등급 설정
	public void setGrade(User user) throws Exception;

	public int listCount(SearchCriteria scri)throws Exception;

	public int mlistCount(SearchCriteria scri)throws Exception;

	public int srlistCount(SearchCriteria scri)throws Exception;

	public int mrlistCount(SearchCriteria scri)throws Exception;
}
