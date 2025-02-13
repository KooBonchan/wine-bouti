package com.winebouti.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.winebouti.service.ProductService;
import com.winebouti.service.ReviewService;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
@Log4j
public class ProductController {
    private final ProductService productService;
    private final ReviewService reviewService;

    /* 양정민 */
    // 상품 상세페이지
    
    @GetMapping("/details/{productId}")  //  URL에 {productId} 포함
    public String getProductDetail(@PathVariable("productId") long productId, Model model) {

        ProductVO product = productService.getProductById(productId);
        List<ReviewVO> reviews = reviewService.getReviewsByProductId(productId);

        log.info(product);
        model.addAttribute("product", product);
        model.addAttribute("reviews", reviews);
        model.addAttribute("productId", productId);

        return "product/details.tiles";
    }
    		
    /* 이창현 */
    @GetMapping("/red-wine")
    public String getRedWines(Model model) {
        // ProductService에서 getRedWines 메서드를 호출하여 레드 와인 목록을 가져옴
        model.addAttribute("products",productService.getWines("red"));
        return "product/list.tiles"; // 해당 JSP 페이지를 반환    
    }
    @GetMapping("/white-wine")
    public String whiteWineList(Model model) {
        List<ProductVO> whiteWine = productService.getWines("white"); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", whiteWine); // 모델에 "products" 속성으로 추가
        return "product/list.tiles"; // 해당 JSP 페이지를 반환
    }
    @GetMapping("/sparkle-wine")
    public String sparkleWineList(Model model) {
        List<ProductVO> sparkleWine = productService.getWines("sparkle"); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", sparkleWine); // 모델에 "products" 속성으로 추가
        return "product/list.tiles"; // 해당 JSP 페이지를 반환
    }
    @GetMapping("/pairing-wine")
    public String pairingWineList(Model model) {
        List<ProductVO> pairingWine = productService.findProductsByCategory("pairing"); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", pairingWine); // 모델에 "products" 속성으로 추가
        return "product/list.tiles"; // 해당 JSP 페이지를 반환
    }
    @GetMapping("/gift-set")
    public String giftsetList(Model model) {
        List<ProductVO> giftSet = productService.findProductsByCategory("gift_set"); // 서비스에서 화이트 와인 목록을 가져옵니다.
        model.addAttribute("products", giftSet); // 모델에 "products" 속성으로 추가
        return "product/list.tiles"; // 해당 JSP 페이지를 반환
    }
 // 기존 Controller에 AJAX 요청을 처리할 메서드 추가
    @GetMapping("ajax/category")
    @ResponseBody
    public List<ProductVO> getProductsByCategory(@RequestParam String category) {
        List<ProductVO> products = productService.getWines(category); // 카테고리에 맞는 상품을 가져오는 서비스 메서드 호출
        return products; // JSON 형식으로 반환됨
    }


}

    


