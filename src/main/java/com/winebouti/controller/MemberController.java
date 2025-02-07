package com.winebouti.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        	return "redirect:/member/login.tiles";
        }
        catch(Exception e) {
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

//    @PostMapping("login")
//    public String login(
//        @ModelAttribute MemberVO memberVO,
//        HttpSession session) { // @ModelAttribute로 MemberVO 객체를 바인딩
//        boolean loginResult = memberService.login(memberVO);
//        if (loginResult) {
//            session.setAttribute("loginEmail", memberVO.getEmail()); // memberVO의 getEmail() 사용
//            return "redirect:/";
//        } else {
//            return "redirect:/member/login";
//        }
//    }

    // logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginEmail");
        return "redirect:/member/login.tiles";
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
    public String update(@ModelAttribute MemberVO memberVO, RedirectAttributes attributes) { // @ModelAttribute로 MemberVO 객체를 바인딩
        boolean result = memberService.update(memberVO);
        if (result) {
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
    
    
    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    @GetMapping("/mypage")
    public String mypage() {return "member/mypage.tiles";}
}
