package com.winebouti.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ResponseEntity<Map<String, Object>> getReviewsByProduct(@PathVariable("productId") long productId) {
	    List<ReviewVO> reviews = reviewService.getReviewsByProductId(productId);
	    int reviewCount = reviews.size(); // 리뷰 개수 계산

	    // ✅ 응답 데이터를 Map으로 구성
	    Map<String, Object> responseData = new HashMap<>();
	    responseData.put("reviews", reviews);
	    responseData.put("reviewCount", reviewCount); // ✅ 리뷰 개수 포함

	    // ✅ 업로드된 이미지 경로 설정
	    for (ReviewVO review : reviews) {
	        if (review.getImagePath() != null && !review.getImagePath().isEmpty()) {
	            review.setImagePath("/upload/review/" + review.getImagePath());
	        }
	        if (review.getThumbnailPath() != null && !review.getThumbnailPath().isEmpty()) {
	            review.setThumbnailPath("/upload/review/thumbs/" + review.getThumbnailPath());
	        }
	    }

	    return ResponseEntity.ok(responseData); // ✅ 명확하게 Map 타입 지정
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
    @PreAuthorize("isAuthenticated()")
	@GetMapping("/edit/{reviewId}")
	public String editReviewForm(@PathVariable long reviewId, Model model) {
		ReviewVO review = reviewService.getReviewById(reviewId);
		if (review == null) {
			return "redirect:/product/details.tiles"; // 리뷰가 없을 경우 상세 페이지로 이동
		}
		model.addAttribute("review", review);
		return "review/review_edit.tiles";
	}

    @PostMapping("/edit/{reviewId}")
    public String editReview(
            @PathVariable long reviewId,
            @RequestParam("productId") Long productId,
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam("star") int star,
            @RequestParam(value = "imagePath", required = false) String imagePath,
            RedirectAttributes redirectAttributes,
            Authentication authentication) {

        // ✅ 현재 로그인한 사용자 가져오기
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        Long currentMemberId = userDetails.getMemberId(); // 현재 로그인한 사용자 ID

        // ✅ 기존 리뷰 가져오기
        ReviewVO existingReview = reviewService.getReviewById(reviewId);
        if (existingReview == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "리뷰가 존재하지 않습니다.");
            return "redirect:/product/details/" + productId;
        }

        // ✅ 로그인한 사용자의 memberId와 리뷰 작성자의 memberId 비교
        if (!existingReview.getMemberId().equals(currentMemberId) &&
            !authentication.getAuthorities().toString().contains("ROLE_ADMIN")) {
            redirectAttributes.addFlashAttribute("errorMessage", "수정 권한이 없습니다.");
            return "redirect:/access-denied.tiles";
        }

        // ✅ 리뷰 수정 데이터 설정
        existingReview.setTitle(title);
        existingReview.setContent(content);
        existingReview.setStar(star);
        existingReview.setWriteDate(new Timestamp(System.currentTimeMillis())); 

        // ✅ 업로드된 이미지가 있을 경우 저장
        if (imagePath != null && !imagePath.isEmpty()) {
            existingReview.setImagePath(FileUtils.encodeRealFileName(imagePath));
        }

        log.info("📌 리뷰 수정 후 imagePath: " + existingReview.getImagePath());

        // ✅ 리뷰 업데이트 실행
        reviewService.updateReview(existingReview);

        redirectAttributes.addFlashAttribute("successMessage", "리뷰가 성공적으로 수정되었습니다.");
        return "redirect:/product/details/" + productId;
    }


	// 삭제

	@DeleteMapping(value = "/{reviewId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteReview(@PathVariable("reviewId") Long reviewId) {
		
		   System.out.println("🚀 삭제 요청 수신! 리뷰 ID: " + reviewId);

		return reviewService.deleteReview(reviewId) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	//리뷰 답글 조회 (모두)
	
	  @GetMapping("/response/{reviewId}")
	    public ResponseEntity<String> getResponse(@PathVariable Long reviewId) {
	        String response = reviewService.getReviewResponse(reviewId);

	        if (response == null || response.trim().isEmpty()) {
	            return ResponseEntity.status(HttpStatus.NO_CONTENT).body("답변이 없습니다.");
	        }
	        return ResponseEntity.ok(response);
	    }
	  
	  
	// 리뷰 답글 추가/수정
	  @PostMapping("/response")
	  @ResponseBody
	  public ResponseEntity<String> updateResponse(@RequestBody ReviewVO review) {
	      log.info("📌 updateResponse() 호출됨 - reviewId: " + review.getReviewId() + ", response: " + review.getResponse());

	      int result = reviewService.updateReviewResponse(review.getReviewId(), review.getResponse());
	      return (result > 0) 
	             ? ResponseEntity.ok("답변이 등록/수정되었습니다.") 
	             : ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("답변 등록 실패");
	  }



	    // 리뷰 답글 삭제
	    @DeleteMapping("/response/{reviewId}")
	    @ResponseBody
	    public ResponseEntity<String> deleteResponse(@PathVariable Long reviewId, 
	                                                 @AuthenticationPrincipal UserDetails userDetails) {
	        if (!isAdmin(userDetails)) {
	            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("관리자만 답변을 삭제할 수 있습니다.");
	        }

	        int result = reviewService.deleteReviewResponse(reviewId);
	        return (result > 0) 
	               ? ResponseEntity.ok("답변이 삭제되었습니다.") 
	               : ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("답변 삭제 실패");
	    }
	    
	  
	 // 관리자 여부 확인 메서드 추가
	    private boolean isAdmin(UserDetails userDetails) {
	        return userDetails != null && userDetails.getAuthorities().stream()
	                .anyMatch(auth -> auth.getAuthority().equals("ROLE_ADMIN"));
	    }
	    
	    
	    @ModelAttribute
	    public void addIsAdminAttribute(Model model) {
	        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	        
	        boolean isAdmin = auth.getAuthorities().stream()
	                .anyMatch(role -> role.getAuthority().equals("ROLE_ADMIN"));

	        model.addAttribute("isAdmin", isAdmin);
	    }
	    
}
