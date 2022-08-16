package com.ebookmarket.client.mapper;

import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.domain.MemberAuth;
import com.ebookmarket.client.domain.Seller;
import com.ebookmarket.common.domain.SearchCriteria;

public interface MemberMapper {

	// 등록 처리
	public void create(Member member) throws Exception;

	// 아이디 중복확인
	public int overlappedID(String id) throws Exception;

	public int overlappedEmail(String email) throws Exception;

	// 권한 생성
	public void createAuth(MemberAuth memberAuth) throws Exception;

	// 로그인 처리를 위한 아이디 조회
	public Member readByM_id(String m_id);

	public Member readByUserId(String id);

	public Member readByUserEmail(String email);

	public Member readByUserIE(String id, String email);

	public void replacePw(String id, String newEncodedPw);

	public Member readByUserNum(int m_num) throws Exception;

	// 정보 수정
	public void update(Member member) throws Exception;

	public int listCount(SearchCriteria scri) throws Exception;

}
