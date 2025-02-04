package com.winebouti.service;

import java.util.List;
import java.util.Optional;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.winebouti.mapper.MemberMapper;
import com.winebouti.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;

    @Override
    public int save(MemberVO memberVO) {
        try {
            log.info("Saving member: {}", memberVO); // 로그 추가
            return memberMapper.save(memberVO);
        } catch (DataIntegrityViolationException e) {
            log.error("Data integrity violation error saving member: {}", memberVO, e);
            throw new RuntimeException("회원 정보가 잘못되었습니다. 필수 정보가 누락되었거나 잘못된 값이 입력되었습니다.");
        } catch (Exception e) {
            log.error("Error saving member: {}", memberVO, e);
            throw new RuntimeException("회원 저장에 실패했습니다."); // 예외 처리
        }
    }


    // 로그인 처리
    @Override
    public boolean login(MemberVO memberVO) {
        try {
            log.info("Attempting login for member with email: {}", memberVO.getEmail());  // email 사용
            MemberVO loginMember = memberMapper.login(memberVO);
            return loginMember != null;
        } catch (Exception e) {
            log.error("Login failed for member: {}", memberVO.getEmail(), e);
            return false; // 로그인 실패 시 false 반환
        }
    }

    // 전체 회원 조회
    @Override
    public List<MemberVO> findAll() {
        try {
            log.info("Fetching all members");
            return memberMapper.findAll();  // 반환 타입을 List<MemberVO>로 수정
        } catch (Exception e) {
            log.error("Error fetching all members", e);
            throw new RuntimeException("회원 목록을 가져오는 데 실패했습니다.");
        }
    }

    // 회원 ID로 찾기
    @Override
    public MemberVO findById(Long memberId) {  // 'id' -> 'memberId'로 수정
        try {
            log.info("Fetching member by ID: {}", memberId);
            return memberMapper.findById(memberId);  // 'id' -> 'memberId'로 수정
        } catch (Exception e) {
            log.error("Error fetching member by ID: {}", memberId, e);
            throw new RuntimeException("회원 ID로 조회하는 데 실패했습니다.");
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
    public boolean update(MemberVO memberVO) {
        try {
            log.info("Updating member: {}", memberVO);
            int result = memberMapper.update(memberVO);
            return result > 0;  // 성공 여부는 update 쿼리의 영향을 받은 행 수로 판단
        } catch (Exception e) {
            log.error("Error updating member: {}", memberVO, e);
            return false; // 실패 시 false 반환
        }
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
