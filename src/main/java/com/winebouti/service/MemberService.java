package com.winebouti.service;

import java.util.List;
import com.winebouti.vo.MemberVO;

public interface MemberService {

    // 회원 저장
    public void save(MemberVO memberVO);

    // 로그인 처리
    public boolean login(MemberVO memberVO);

    // 전체 회원 조회
    public List<MemberVO> findAll();  // 반환 타입을 List<MemberVO>로 수정

    // 회원 ID로 찾기
    public MemberVO findById(Long id);

    // 회원 삭제
    public void delete(Long id);

    // 이메일로 회원 조회
    public MemberVO findByMemberEmail(String email);

    // 회원 정보 업데이트
    public boolean update(MemberVO memberVO);

    // 이메일 중복 체크
    public String emailCheck(String email);
}
