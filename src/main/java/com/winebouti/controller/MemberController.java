package com.winebouti.controller;

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
  public @ResponseBody String emailCheck(@RequestParam("memberEmail") String memberEmail) {
    System.out.println("memberEmail = " + memberEmail);
    String checkResult = memberService.emailCheck(memberEmail);
    return checkResult;
  }

  @PreAuthorize("isAuthenticated()")
  @GetMapping("/mypage")
  public String mypage() {
    return "member/mypage.tiles";
  }
}
