package com.winebouti.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.winebouti.service.ProductService;
import com.winebouti.service.ReviewService;
import com.winebouti.util.Criteria;
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
    
    @GetMapping("/details/{productId}")  //  URL에 {productId} 포함
    public String getProductDetail(@PathVariable("productId") long productId, Model model) {

        ProductVO product = productService.getProductById(productId);
        List<ReviewVO> reviews = reviewService.getReviewsByProductId(productId);

        model.addAttribute("product", product);
        model.addAttribute("reviews", reviews);
        model.addAttribute("productId", productId);

        return "product/details.tiles";
    }
    
    /* 이창현 */
    @GetMapping("/red-wine") // 레드 와인 목록 페이지 매핑
    public String redWineList(Model model) {
        List<ProductVO> redWines = productService.getRedWines(); // 서비스 메서드 호출
        model.addAttribute("products", redWines); // Model에 상품 목록 추가
        return "product/redwine.tiles"; // 뷰 이름 반환
    }
    @GetMapping("/white-wine")
    public String whiteWineList(Model model) {
        List<ProductVO> whiteWine = productService.getRedWines(); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", whiteWine); // 모델에 "products" 속성으로 추가
        return "product/white-wine.tiles"; // 해당 JSP 페이지를 반환
    }
    @GetMapping("/sparkle-wine")
    public String sparkleWineList(Model model) {
        List<ProductVO> sparkleWine = productService.getRedWines(); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", sparkleWine); // 모델에 "products" 속성으로 추가
        return "product/sparkle-wine.tiles"; // 해당 JSP 페이지를 반환
    }
    
    @GetMapping("/gift-wine")
    public String giftWineList(Model model) {
        List<ProductVO> giftWine = productService.getRedWines(); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", giftWine); // 모델에 "products" 속성으로 추가
        return "product/gift-wine.tiles"; // 해당 JSP 페이지를 반환
    }
    
    @GetMapping("/pairing-wine")
    public String pairingWineList(Model model) {
        List<ProductVO> pairingWine = productService.getRedWines(); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", pairingWine); // 모델에 "products" 속성으로 추가
        return "product/pairingwine.tiles"; // 해당 JSP 페이지를 반환
    }
}
