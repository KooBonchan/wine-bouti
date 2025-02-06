package com.winebouti.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	private long memberId;
	private String username;
	private String password;
	private String phone;
	private String email;
	private String address;
	private String zipcode;
	private String profileImageName;
	private String realProfileImageName;

	
	List<AuthVO> auths;
}
