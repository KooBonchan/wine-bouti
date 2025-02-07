package com.winebouti.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.winebouti.service.ReviewService;
import com.winebouti.util.FileUtils;
import com.winebouti.vo.ReviewVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("review")
@RequiredArgsConstructor
public class ReviewController {

	private final ReviewService reviewService;
	private final File uploadFolder = new File(FileUtils.BASE_PATH, "review");

	// 특정 productId의 리뷰 목록 조회 (AJAX 비동기 요청 지원)
	@GetMapping("/{productId}")
	public ResponseEntity<List<ReviewVO>> getReviewsByProduct(@PathVariable("productId") long productId) {
		List<ReviewVO> reviews = reviewService.getReviewsByProductId(productId);
		return new ResponseEntity<>(reviews, HttpStatus.OK);
	}

	// 리뷰 작성
    @PreAuthorize("isAuthenticated()")
	@GetMapping("/write")
	public String writeReviewPage(
			@RequestParam(value = "productId", required = false, defaultValue = "0") Integer productId, Model model) {
		model.addAttribute("productId", productId);
		return "product/review.tiles";
	}

	@PostMapping("/write")
	public String submitReview(@RequestParam("productId") Long productId, @RequestParam("memberId") Long memberId,
			@RequestParam("content") String content, @RequestParam("star") int star,
			@RequestParam(value = "file", required = false) MultipartFile file, RedirectAttributes redirectAttributes

	) {
		log.info("📌 [리뷰 작성 요청] productId: " + productId + ", memberId: " + memberId);
		log.info("📌 [리뷰 내용] " + content + " (별점: " + star + ")");

		// 리뷰 객체 생성 및 데이터 설정
		ReviewVO review = new ReviewVO();
		review.setProductId(productId);
		review.setMemberId(memberId);
		review.setContent(content);
		review.setStar(star);

		// 업로드된 파일이 있으면 저장
		if (file != null && !file.isEmpty()) {

			if (!uploadFolder.exists()) {
				uploadFolder.mkdirs(); // 폴더가 없으면 생성
			}

			try {
				String originalFilename = file.getOriginalFilename();
				String uniqueFilename = UUID.randomUUID().toString() + "_" + originalFilename;
				File destFile = new File(uploadFolder, uniqueFilename);
				file.transferTo(destFile);
				review.setImagePath(uniqueFilename); // 저장된 파일명을 DB에 저장
			} catch (IOException e) {
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("error", "파일 업로드 중 오류 발생!");
				return "redirect:/review/write";
			}
		}
		// 리뷰 저장
		reviewService.insertReview(review);
		redirectAttributes.addFlashAttribute("message", "리뷰가 성공적으로 등록되었습니다!");

		return "redirect:/product/details/" + productId;
	}

	// 리뷰 수정
	@GetMapping("/edit/{reviewId}")
	public String editReviewForm(@PathVariable long reviewId, Model model) {
		ReviewVO review = reviewService.getReviewById(reviewId);
		if (review == null) {
			return "redirect:/product/details.tiles"; // 리뷰가 없을 경우 상세 페이지로 이동
		}
		model.addAttribute("review", review);
		return "review/edit.tiles";
	}

	// 삭제

	@DeleteMapping(value = "/{reviewId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteReview(@PathVariable("reviewId") Long reviewId) {

		return reviewService.deleteReview(reviewId) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

}
