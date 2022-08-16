package com.ebookmarket.client.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.mapper.MemberMapper;
import com.ebookmarket.client.security.domain.CustomUser;
import com.ebookmarket.client.domain.Seller;
import com.ebookmarket.client.mapper.SellerMapper;

import lombok.extern.java.Log;

@Log
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private SellerMapper sellerMapper;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {

		log.info("Load User By m_id: " + id);

		Member member = memberMapper.readByUserId(id);
		Seller seller = sellerMapper.readByUserId(id);

		log.info("queried by member mapper: " + member);
		log.info("queried by seller mapper: " + seller);

		if (member == null) {
			return seller == null ? null : new CustomUser(seller);
		}

		return member == null ? null : new CustomUser(member);

	}

}
