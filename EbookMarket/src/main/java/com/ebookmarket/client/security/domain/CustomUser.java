package com.ebookmarket.client.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.ebookmarket.client.domain.Member;
import com.ebookmarket.client.domain.Seller;

public class CustomUser extends User {

	private static final long serialVersionUID = 1L;

	private Member member;
	private Seller seller;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(Member member) {
		super(member.getM_id(), member.getM_pw(), member.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		this.member = member;
	}

	public CustomUser(Seller seller) {
		super(seller.getS_id(), seller.getS_pw(), seller.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		this.seller = seller;
	}

	public Seller getSeller() {
		return seller;
	}

	public Member getMember() {
		return member;
	}

}