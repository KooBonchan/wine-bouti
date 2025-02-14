package com.winebouti.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.winebouti.security.CustomUser;
import com.winebouti.service.MemberService;
import com.winebouti.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
@Log4j
public class MemberController {
  private final MemberService memberService;

  @GetMapping("save")
  public String saveForm() {
    return "member/save.tiles";
  }

  @PostMapping("save")
  public String save(@ModelAttribute MemberVO memberVO, RedirectAttributes redirectAttributes) {
      try {
          memberService.save(memberVO);
          // 회원가입 후 로그인 페이지로 리다이렉트
          return "redirect:/member/login?success=true"; // 로그인 페이지로 리다이렉트
      } catch (Exception e) {
          log.error(e.getMessage());
          log.error("회원 저장에 실패했습니다."); // 예외 처리
          redirectAttributes.addFlashAttribute("error", "회원 저장에 실패했습니다. 다시 시도해 주세요.");
          return "redirect:/member/save.tiles";
      }
  }
  
  @PostMapping("/login")
  public String login(@RequestParam("email") String email, @RequestParam("password") String password, RedirectAttributes redirectAttributes) {
      try {
          // 사용자 인증을 위한 로그인 처리
          MemberVO member = memberService.login(email, password); // 로그인 처리 로직
          if (member != null) {
              // 로그인 성공 시 SecurityContext에 인증된 사용자 세팅
              CustomUser customUser = new CustomUser(member); // CustomUser 객체로 래핑
              Authentication authentication = new UsernamePasswordAuthenticationToken(customUser, password, customUser.getAuthorities());
              SecurityContextHolder.getContext().setAuthentication(authentication);

              return "redirect:/"; // 로그인 후 리다이렉트
          } else {
              // 로그인 실패 시 메시지 추가
              redirectAttributes.addFlashAttribute("error", "이메일 또는 비밀번호가 잘못되었습니다.");
              return "redirect:/member/login";
          }
      } catch (Exception e) {
          log.error("로그인 실패", e);
          redirectAttributes.addFlashAttribute("error", "로그인 처리 중 문제가 발생했습니다.");
          return "redirect:/member/login";
      }
  }
  
  @GetMapping("login")
  public String loginForm() {
    return "member/login.tiles";
  }

  @GetMapping("/delete")
  public String delete(@RequestParam("memberId") Long memberId) {
    memberService.delete(memberId);
    return "redirect:/member/login.tiles";
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping("/update")
  public String updateForm(Model model) {
    return "member/update.tiles";
  }

  @PreAuthorize("isAuthenticated()")
  @PostMapping("/update")
  public String update(@ModelAttribute MemberVO memberVO, RedirectAttributes attributes) {
    boolean result = memberService.update(memberVO);
    if (result) {
      SecurityContext context = SecurityContextHolder.getContext();
      Authentication authentication = context.getAuthentication();
      MemberVO updatedMemberVO = memberService.findByMemberEmail(memberVO.getEmail());
      CustomUser updatedUser = new CustomUser(updatedMemberVO);
      context.setAuthentication(new UsernamePasswordAuthenticationToken(updatedUser, authentication.getCredentials(),
          authentication.getAuthorities()));

      attributes.addFlashAttribute("message", "회원정보가 수정되었습니다.");
      return "redirect:/"; // memberVO의 getMemberId() 사용
    } else {
      return "redirect:/member/update";
    }
  }

  
  @PostMapping("/email-check")
  public @ResponseBody String emailCheck(
		  @RequestBody String rawMemberEmail
   ) throws UnsupportedEncodingException {
		
	  String[] parts = rawMemberEmail.split("=");
	  String encodedEmail = parts.length > 1 ? parts[1] : "";
      String decodedEmail = URLDecoder.decode(encodedEmail, StandardCharsets.UTF_8.name());
      String checkResult = memberService.emailCheck(decodedEmail);
      return checkResult;
	  
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping("/mypage")
  public String mypage() {
    return "member/mypage.tiles";
  }
}
