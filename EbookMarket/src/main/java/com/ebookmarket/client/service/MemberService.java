package com.ebookmarket.client.service;

import com.ebookmarket.client.domain.Member;
import com.ebookmarket.common.domain.SearchCriteria;

public interface MemberService {

	// 등록 처리
	public void join(Member member) throws Exception;

	public void modify(Member member) throws Exception;

	// 아이디 중복확인
	public int overlappedID(String id) throws Exception;

	public int overlappedEmail(String email) throws Exception;

	public Member readByUserId(String id) throws Exception;

	public Member readByUserEmail(String email) throws Exception;

	public Member readByUserIE(String id, String email) throws Exception;

	public void replacePw(String id, String newEncodedPw) throws Exception;

	public Member readByUserNum(int m_num) throws Exception;

	public int listCount(SearchCriteria scri) throws Exception;

}
