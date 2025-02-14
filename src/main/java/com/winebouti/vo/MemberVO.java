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
    private String email;
    private String address;
    private String zipcode;
    private String phoneNumber;
    private String profileImageName;
    private String realProfileImageName;

    // 생년월일을 단순히 String으로 사용
    private String birthDate; // 데이터베이스와 매핑되지 않음

    List<AuthVO> auths;
}
