package com.winebouti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*�躸��*/

@Controller
@RequestMapping("member")
public class MemberController {
	@GetMapping("save")
	public String saveForm() {
		return "member/save.tiles";
	}
}
