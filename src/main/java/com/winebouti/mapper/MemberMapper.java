package com.winebouti.mapper;

import java.util.List;
import com.winebouti.vo.MemberVO;

public interface MemberMapper {

    int save(MemberVO memberVO);

    MemberVO login(MemberVO memberVO);

    List<MemberVO> findAll();

    MemberVO findById(Long id);

    void delete(Long id);

    MemberVO findByMemberEmail(String loginEmail);

    int update(MemberVO memberVO);
}
