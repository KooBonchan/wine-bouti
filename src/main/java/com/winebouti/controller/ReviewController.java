package com.winebouti.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.winebouti.vo.ReviewVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	private ReviewVO reviewvo;
	private String uploadFolder = "C:/upload/review/";

    // 리뷰 상세 조회
	@GetMapping("/detail/{reviewId}")
	public String reviewDetail(@PathVariable int reviewId, Model model) {
	    ReviewVO review = reviewService.getReviewById(reviewId);
	    
	    if (review == null) {
	        return "redirect:/review/list"; // 리뷰가 없으면 목록 페이지로 이동
	    }

	    model.addAttribute("review", review);
	    return "review/detail.tiles"; // 리뷰 상세 페이지로 이동
	}
    
    @GetMapping("/list")
    public String listReviews(Model model) {
        List<ReviewVO> reviews = reviewService.getAllReviews();
        model.addAttribute("reviews", reviews);
        return "review/list.tiles"; // 타일즈 사용 시
    }

    // 리뷰 작성
    @GetMapping("/write")
    public String writeReviewPage(@RequestParam(value = "productId", required = false, defaultValue = "0") Integer productId, 
                                  Model model) {
        model.addAttribute("productId", productId);
        return "product/review.tiles";
    }
    
    
    @PostMapping("/write")
    public String submitReview(
        @RequestParam("productId") Long productId,  
        @RequestParam("memberId") Long memberId,   
        @RequestParam("content") String content,
        @RequestParam("star") int star,
        @RequestParam(value = "imageUpload", required = false) MultipartFile imageFile,
        RedirectAttributes redirectAttributes) {

        // 올바른 값이 넘어오는지 로그 출력
        if (productId == null || memberId == null || productId == 0 || memberId == 0) {
            System.out.println("🚨 잘못된 productId 또는 memberId가 전달됨!");
            redirectAttributes.addFlashAttribute("error", "올바른 상품 ID 및 회원 정보를 입력하세요.");
            return "redirect:/product/details";
        }

        ReviewVO review = new ReviewVO();
        review.setProductId(productId);
        review.setMemberId(memberId);
        review.setContent(content);
        review.setStar(star);

        // 이미지 저장 (선택 사항)
        if (imageFile != null && !imageFile.isEmpty()) {
            String uploadDir = "C:/upload/review/";
            String originalFilename = imageFile.getOriginalFilename();
            String uniqueFilename = UUID.randomUUID().toString() + "_" + originalFilename;

            File destFile = new File(uploadDir + uniqueFilename);
            try {
                imageFile.transferTo(destFile);
                review.setImagePath(uniqueFilename); // DB에 저장할 이미지 경로
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        reviewService.insertReview(review);
        redirectAttributes.addFlashAttribute("message", "리뷰가 성공적으로 등록되었습니다!");

        return "redirect:/review/list";
    }
    // 리뷰 수정
    @GetMapping("/edit/{reviewId}")
    public String editReviewForm(@PathVariable int reviewId, Model model) {
        ReviewVO review = reviewService.getReviewById(reviewId);
        if (review == null) {
            return "redirect:/product/details.tiles"; // 리뷰가 없을 경우 상세 페이지로 이동
        }
        model.addAttribute("review", review);
        return "review/edit.tiles";
    }

    // 삭제
    @DeleteMapping("/delete/{reviewId}")
    public ResponseEntity<String> deleteReview(@PathVariable("reviewId") Long reviewId) {

        if (reviewId == null || reviewId == 0) {
            return ResponseEntity.badRequest().body("잘못된 리뷰 ID입니다.");
        }

        int result = reviewService.deleteReview(reviewId);
        if (result > 0) {
            return ResponseEntity.ok("리뷰가 삭제되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("리뷰 삭제 실패");
        }
    }
}
