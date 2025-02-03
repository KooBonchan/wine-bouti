package com.winebouti.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winebouti.service.ProductService;
import com.winebouti.service.ReviewService;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;
import com.winebouti.vo.WineVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;
    private final ReviewService reviewService;

    /* 양정민 */
    // 상품 상세페이지
    @GetMapping("/details")
    public String productDetailsDefault(Model model) {
    	
    	//review list
    	List<ReviewVO> reviews = reviewService.getAllReviews();
    	model.addAttribute("reviews",reviews);
    	
        return "product/details.tiles";
    }

    // 상품 상세 페이지
    @GetMapping({"/details/{product_id}", "{product_id}"})
    public String productDetails(@PathVariable("product_id") long product_id, Model model) {
        // 상품 상세 정보 가져오기
        ProductVO product = productService.getProductById(product_id);

        // 상품 리뷰 리스트 가져오기
        List<ReviewVO> reviews = productService.getReviewsByProductId(product_id);

        // 추천 와인 리스트 가져오기 (레드 와인 예시)
        List<WineVO> recommendedWines = productService.findRedWines();

        // Model에 데이터 추가
        model.addAttribute("product", product);           // 상품 정보
        model.addAttribute("reviews", reviews);           // 리뷰 리스트
        model.addAttribute("recommendedWines", recommendedWines); // 추천 와인 리스트

        return "product/details.tiles";  // 상품 상세 페이지 Tiles 연결
    }
    
    
    
    /* 이창현 */
    @GetMapping("/red-wine") // 레드 와인 목록 페이지 매핑
    public String redWineList(Model model) {
        List<WineVO> redWines = productService.getRedWines(); // 서비스 메서드 호출
        model.addAttribute("products", redWines); // Model에 상품 목록 추가
        return "product/redwine.tiles"; // 뷰 이름 반환
    }
    @GetMapping("/white-wine")
    public String whiteWineList(Model model) {
        List<WineVO> whiteWine = productService.getwhiteWine(); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", whiteWine); // 모델에 "products" 속성으로 추가
        return "product/white-wine.tiles"; // 해당 JSP 페이지를 반환
    }
    @GetMapping("/sparkle-wine")
    public String sparkleWineList(Model model) {
        List<WineVO> sparkleWine = productService.getSparkleWine(); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", sparkleWine); // 모델에 "products" 속성으로 추가
        return "product/sparkle-wine.tiles"; // 해당 JSP 페이지를 반환
    }
    
    @GetMapping("/gift-wine")
    public String giftWineList(Model model) {
        List<WineVO> giftWine = productService.getGiftWine(); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", giftWine); // 모델에 "products" 속성으로 추가
        return "product/gift-wine.tiles"; // 해당 JSP 페이지를 반환
    }
    
    @GetMapping("/pairing-wine")
    public String pairingWineList(Model model) {
        List<WineVO> pairingWine = productService.getpairingWine(); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", pairingWine); // 모델에 "products" 속성으로 추가
        return "product/pairingwine.tiles"; // 해당 JSP 페이지를 반환
    }
}
