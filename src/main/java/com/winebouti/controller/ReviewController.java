package com.winebouti.controller;


// 아직 구현 xxxxxx
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winebouti.service.ReviewService;
import com.winebouti.vo.ReviewVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	
	//리스트 화면
	@GetMapping
	public String listReviews(Model model) {
		List<ReviewVO> reviews = reviewService.getAllReviews();
		model.addAttribute("reviews", reviews);
		return "product/review.tiles"; //review.jsp로 이동
	}

}
