package com.winebouti.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.winebouti.service.ProductService;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("api/reply")
@RequiredArgsConstructor
public class ApiReplyController {
	private final ProductService productService;
	
	/* 양정민 */
	@GetMapping("{product_id}")
	public String productDetails(@PathVariable("product_id") int product_id, Model model) {
        ProductVO product = productService.getProductById(product_id);
        List<ReviewVO> reviews = productService.getReviewsByProductId(product_id);

        model.addAttribute("product", product);
        model.addAttribute("reviews", reviews);

        return "product/details.tiles";  // Tiles 연결
    }
}
