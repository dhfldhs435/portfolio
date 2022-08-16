package com.ebookmarket.client.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.domain.MemberAuth;

import com.ebookmarket.client.mapper.MemberMapper;
import com.ebookmarket.common.domain.SearchCriteria;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	// 등록 처리
	@Transactional
	@Override
	public void join(Member member) throws Exception {
		mapper.create(member);

		// 회원 권한 생성
		MemberAuth memberAuth = new MemberAuth();
		memberAuth.setAuth("ROLE_MEMBER");

		mapper.createAuth(memberAuth);

	}

	// 아이디 중복 확인
	@Override
	public int overlappedID(String id) throws Exception {
		int result = mapper.overlappedID(id);
		return result;
	}

	@Override
	public int overlappedEmail(String email) throws Exception {
		int result = mapper.overlappedEmail(email);
		return result;

	}

	@Override
	public Member readByUserId(String id) throws Exception {
		Member loginMember = mapper.readByUserId(id);
		return loginMember;
	}

	@Override
	public Member readByUserEmail(String email) throws Exception {
		Member loginMember = mapper.readByUserEmail(email);
		return loginMember;
	}

	@Override
	public Member readByUserIE(String id, String email) throws Exception {
		Member loginMember = mapper.readByUserIE(id, email);
		return loginMember;
	}

	@Override
	public void replacePw(String id, String newEncodedPw) throws Exception {
		mapper.replacePw(id, newEncodedPw);

	}

	@Override
	public void modify(Member member) throws Exception {
		mapper.update(member);

	}

	@Override
	public Member readByUserNum(int m_num) throws Exception {
		Member loginMember = mapper.readByUserNum(m_num);
		return loginMember;
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return mapper.listCount(scri);
	}
 

}