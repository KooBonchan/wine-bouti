package com.winebouti.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; // Model 객체 추가
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.winebouti.domain.Product; // Product 도메인 추가
import com.winebouti.service.ProductService; // ProductService 추가

@Controller
public class ProductController {

    private final ProductService productService; // ProductService 의존성 주입

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("")
    public String home() {
        return "main.tiles";
    }

    @GetMapping("product/{productIdx}")
    public String productDetails(
        @PathVariable("productIdx") long productIdx
    ) {
        return "product/details.tiles";
    }

    @GetMapping("/red-wine") // 레드 와인 목록 페이지 매핑
    public String redWineList(Model model) {
        List<Product> redWines = productService.getRedWines(); // 서비스 메서드 호출
        model.addAttribute("products", redWines); // Model에 상품 목록 추가
        return "product/redWineList.tiles"; // 뷰 이름 반환
    }
}