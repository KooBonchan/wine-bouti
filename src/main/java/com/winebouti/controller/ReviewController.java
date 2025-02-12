package com.winebouti.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
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
		 // 업로드된 이미지 경로를 포함해서 반환
	    for (ReviewVO review : reviews) {
	    	
	    	 System.out.println("📌 리뷰 ID: " + review.getReviewId() + ", Response: " + review.getResponse());
	    	 
	        if (review.getImagePath() != null && !review.getImagePath().isEmpty()) {
	            review.setImagePath("/upload/review/" + review.getImagePath()); // 클라이언트에서 접근 가능한 URL로 변경
	        }
	        if (review.getThumbnailPath() != null && !review.getThumbnailPath().isEmpty()) {
	            review.setThumbnailPath("/upload/review/thumbs/" + review.getThumbnailPath()); // 썸네일 경로 추가
	        }
	    }
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
    public String submitReview(@RequestParam("productId") Long productId,
                               @RequestParam("memberId") Long memberId,
                               @RequestParam("title") String title,
                               @RequestParam("content") String content,
                               @RequestParam("star") int star,
                               @RequestParam(value = "imagePath", required = false) String imagePath,
                               RedirectAttributes redirectAttributes) {

        // 리뷰 객체 생성 및 데이터 설정
        ReviewVO review = new ReviewVO();
        review.setProductId(productId);
        review.setTitle(title);
        review.setMemberId(memberId);
        review.setContent(content);
        review.setStar(star);
        review.setWriteDate(new Timestamp(System.currentTimeMillis()));

        // 업로드된 이미지가 있을 경우 저장
        if (imagePath != null && !imagePath.isEmpty()) {
            review.setImagePath(FileUtils.encodeRealFileName(imagePath));
            
        }

        log.info("📌 리뷰 저장 전 imagePath: " + review.getImagePath());

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
	
	  // ✅ 관리자 답글 추가 API
	 @PostMapping("/response")
	    public ResponseEntity<String> addResponse(@RequestParam("reviewId") Long reviewId,
	                                              @RequestParam("response") String response) {
	        log.info("📌 관리자 답글 추가 - 리뷰 ID: " + reviewId);

	        // ✅ 리뷰 조회
	        ReviewVO review = reviewService.getReviewById(reviewId);
	        if (review == null) {
	            return ResponseEntity.badRequest().body("해당 리뷰를 찾을 수 없습니다.");
	        }

	        // ✅ 관리자 답글 업데이트
	        review.setResponse(response); 
	        int result = reviewService.updateResponse(review);

	        // ✅ 응답 처리
	        return (result > 0) ? ResponseEntity.ok("답글이 등록되었습니다.") :
	                              ResponseEntity.status(500).body("답글 등록 실패");
	    }

}
