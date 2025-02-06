package com.winebouti.mapper;

import java.util.List;

import com.winebouti.vo.MemberVO;

public interface MemberMapper {

    int save(MemberVO memberVO);
    MemberVO findByMemberEmail(String loginEmail);
    int grantAuth(MemberVO memberVO);


    void delete(Long memberId);
    int update(MemberVO memberVO);
}
