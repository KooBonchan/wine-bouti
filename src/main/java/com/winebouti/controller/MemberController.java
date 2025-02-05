package com.winebouti.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @GetMapping("save")
    public String saveForm() {
        return "member/save.tiles";
    }

    @PostMapping("save")
    public String save(@ModelAttribute MemberVO memberVO, RedirectAttributes redirectAttributes) {
        int saveResult = memberService.save(memberVO);
        if (saveResult > 0) {
            return "redirect:/member/login.tiles";
        } else {
            redirectAttributes.addFlashAttribute("error", "회원 저장에 실패했습니다. 다시 시도해 주세요.");
            return "redirect:/member/save.tiles";
        }
    }


    @GetMapping("login")
    public String loginForm() {
        return "member/login.tiles";
    }

    @PostMapping("login")
    public String login(@ModelAttribute MemberVO memberVO, HttpSession session) { // @ModelAttribute로 MemberVO 객체를 바인딩
        boolean loginResult = memberService.login(memberVO);
        if (loginResult) {
            session.setAttribute("loginEmail", memberVO.getEmail()); // memberVO의 getEmail() 사용
            return "redirect:/";
        } else {
            return "redirect:/member/login";
        }
    }

    // logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginEmail");
        return "redirect:/member/login.tiles";
    }

    @GetMapping("/")
    public String findAll(Model model) {
        List<MemberVO> memberVOList = memberService.findAll(); // List<MemberVO>로 변경
        model.addAttribute("memberList", memberVOList);
        return "member/list.tiles";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("memberId") Long memberId) {
        memberService.delete(memberId);
        return "redirect:/member/login.tiles";
    }

    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model) {
        String loginEmail = (String) session.getAttribute("loginEmail");
        MemberVO memberVO = memberService.findByMemberEmail(loginEmail); // 변수명 memberVO로 통일
        model.addAttribute("member", memberVO);
        return "member/update.tiles";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberVO memberVO) { // @ModelAttribute로 MemberVO 객체를 바인딩
        boolean result = memberService.update(memberVO);
        if (result) {
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
}
