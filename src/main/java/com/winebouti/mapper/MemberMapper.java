package com.winebouti.mapper;

import java.util.List;

import com.winebouti.vo.MemberVO;

public interface MemberMapper {
    // 회원 저장
    int save(MemberVO memberVO);

    // 로그인 처리
    MemberVO login(MemberVO memberVO);

    // 전체 회원 조회
    List<MemberVO> findAll();

    // 회원 ID로 찾기
    MemberVO findById(Long memberId);

    // 회원 삭제
    void delete(Long memberId);

    // 이메일로 회원 조회
    MemberVO findByMemberEmail(String loginEmail);

    // 회원 정보 업데이트
    int update(MemberVO memberVO);
}
