package com.winebouti.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class MemberVO {
	
	  private String username;
	    private String password;
	    private String email;
	    private String address;
	    private String zipcode;
	    private String profileImageName;
	    private String realProfileImageName;

}
