package com.winebouti.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.winebouti.service.ReviewService;
import com.winebouti.vo.ReviewVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	private ReviewVO reviewvo;
	private String uploadFolder = "C:/upload/review/";

	// 리스트 화면
	@GetMapping
	public String listReviews(Model model) {
		List<ReviewVO> reviews = reviewService.getAllReviews();
		model.addAttribute("reviews", reviews);
		return "product/review.tiles"; // review.jsp로 이동
	}

	@PostMapping("/register")
	public String register(@ModelAttribute ReviewVO vo,
			@RequestParam(value = "files", required = false) List<MultipartFile> files, RedirectAttributes rttr) {

		// 리뷰저장
		reviewService.register(vo);
		// 파일 저장 처리
		if (files != null && !files.isEmpty()) {
			File uploadDir = new File(uploadFolder);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			for (MultipartFile file : files) {
				String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
				try {
					file.transferTo(new File(uploadFolder + fileName));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		rttr.addFlashAttribute("result", vo.getProductId());
		return "redirect:/product/details?product_id=" + vo.getProductId();
	}
}
