package com.winebouti.mapper;

import com.winebouti.vo.MemberVO;

public interface MemberMapper {

    int save(MemberVO memberVO);
    MemberVO findByMemberEmail(String loginEmail);
    int grantAuth(MemberVO memberVO);
    int grantAdmin(MemberVO memberVO);

    void delete(Long memberId);
    int update(MemberVO memberVO);
}