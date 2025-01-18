package com.winebouti.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winebouti.service.ProductService;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    // 기본 리뷰 작성 페이지
    @GetMapping("/details")
    public String productDetailsDefault() {
        return "product/details.tiles";
    }

    // 상품 상세 페이지
    @GetMapping("/details/{product_id}")
    public String productDetails(@PathVariable("product_id") int product_id, Model model) {
        ProductVO product = productService.getProductById(product_id);
        List<ReviewVO> reviews = productService.getReviewsByProductId(product_id);

        model.addAttribute("product", product);
        model.addAttribute("reviews", reviews);

        return "product/details.tiles";  // Tiles 연결
    }
    
    
}


