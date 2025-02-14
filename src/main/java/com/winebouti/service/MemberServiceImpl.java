package com.winebouti.service;

import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.winebouti.mapper.MemberMapper;
import com.winebouti.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public void save(MemberVO memberVO) {
      memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		log.info("Saving member: {}", memberVO); // 로그 추가
	    memberMapper.save(memberVO);
	    memberMapper.grantAuth(memberVO);
    }

    
    @Override
    public MemberVO login(String email, String password) {
        try {
            // 이메일로 회원 조회
            MemberVO member = memberMapper.findByMemberEmail(email);
            if (member != null && passwordEncoder.matches(password, member.getPassword())) {
                return member; // 비밀번호가 맞으면 회원 반환
            } else {
                return null; // 이메일이나 비밀번호가 틀리면 null 반환
            }
        } catch (Exception e) {
            log.error("Error during login with email: {}", email, e);
            return null; // 로그인 실패 시 null 반환
        }
    }


    // 회원 삭제
    @Override
    public void delete(Long memberId) {  // 'id' -> 'memberId'로 수정
        try {
            log.info("Deleting member with ID: {}", memberId);
            memberMapper.delete(memberId);  // 'id' -> 'memberId'로 수정
        } catch (Exception e) {
            log.error("Error deleting member with ID: {}", memberId, e);
            throw new RuntimeException("회원 삭제에 실패했습니다.");
        }
    }

    // 이메일로 회원 조회
    @Override
    public MemberVO findByMemberEmail(String email) {
        try {
            log.info("Fetching member by email: {}", email);
            Optional<MemberVO> memberOpt = Optional.ofNullable(memberMapper.findByMemberEmail(email));
            return memberOpt.orElseThrow(() -> {
                log.warn("No member found with email: {}", email);
                return new RuntimeException("해당 이메일의 회원을 찾을 수 없습니다.");
            });
        } catch (Exception e) {
            log.error("Error fetching member by email: {}", email, e);
            throw new RuntimeException("이메일로 회원을 조회하는 데 실패했습니다.");
        }
    }

    // 회원 정보 업데이트
    @Override
    @Transactional
    public boolean update(MemberVO memberVO) {
        try {
        	String currentPassword = memberVO.getPassword();
        	MemberVO member = memberMapper.findByMemberEmail(memberVO.getEmail());
        	if(member != null && passwordEncoder.matches(currentPassword, member.getPassword())) {
                log.info("Updating member: {}", memberVO);
        		int result = memberMapper.update(memberVO);
        		return result > 0;
        	}
        } catch (Exception e) {
            log.error("Error updating member: {}", memberVO, e);
            return false; // 실패 시 false 반환
        }
        return false;
    }

    // 이메일 중복 체크
    @Override
    public String emailCheck(String email) {
        try {
            log.info("Checking email: {}", email);
            MemberVO memberVO = memberMapper.findByMemberEmail(email);
            return memberVO == null ? "ok" : "no";
        } catch (Exception e) {
            log.error("Error checking email: {}", email, e);
            throw new RuntimeException("이메일 중복 체크에 실패했습니다.");
        }
    }
}
