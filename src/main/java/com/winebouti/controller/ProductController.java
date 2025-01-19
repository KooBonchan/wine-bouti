package com.winebouti.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winebouti.service.ProductService;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;

    /* 양정민 */
    // 기본 리뷰 작성 페이지
    @GetMapping("/details")
    public String productDetailsDefault() {
        return "product/details.tiles";
    }

    // 상품 상세 페이지
    @GetMapping({"/details/{product_id}", "{product_id}"})
    public String productDetails(@PathVariable("product_id") int product_id, Model model) {
        ProductVO product = productService.getProductById(product_id);
        List<ReviewVO> reviews = productService.getReviewsByProductId(product_id);

        model.addAttribute("product", product);
        model.addAttribute("reviews", reviews);

        return "product/details.tiles";  // Tiles 연결
    }
    
    
    
    /* 이창현 */
    @GetMapping("/red-wine") // 레드 와인 목록 페이지 매핑
    public String redWineList(Model model) {
        List<ProductVO> redWines = productService.getRedWines(); // 서비스 메서드 호출
        model.addAttribute("products", redWines); // Model에 상품 목록 추가
        return "product/wine.tiles"; // 뷰 이름 반환
    }
    
}
