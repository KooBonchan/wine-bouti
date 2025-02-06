package com.winebouti.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.winebouti.vo.AuthVO;
import com.winebouti.vo.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	private MemberVO memberVO;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	public CustomUser(MemberVO memberVO) {
		super(memberVO.getEmail(), memberVO.getPassword(),
			memberVO.getAuths().stream()
			.map(AuthVO::getAuth)
			.map(SimpleGrantedAuthority::new)
			.collect(Collectors.toList())
		);
		this.memberVO = memberVO;
	}
}
