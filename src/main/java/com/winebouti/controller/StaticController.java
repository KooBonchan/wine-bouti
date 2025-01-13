package com.winebouti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/* 다른 JSP 없는 순수 웹 퍼블리싱 페이지 전용 컨트롤러입니다.
 * HTML 파일에서 확장자만 JSP로 바꿔 /static/ 폴더에 저장하시면 됩니다.
 * 저장 시 <!DOCTYPE html> 위에 다음 한 줄을 추가하십시오:
 * <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 */
@Controller
public class StaticController {
	private final String BASE_PATH = "/static/";
	
	@GetMapping("greet")
	public String greet() { return BASE_PATH + "greet"; }
}
