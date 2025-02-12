package com.winebouti.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.winebouti.service.ProductService;
import com.winebouti.vo.ProductVO;

@Controller
public class MainController {

    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public String mainPage(
    	@RequestParam(name = "category", required = false) String category,
    	Model model
    ) {
    	List<ProductVO> products;
    	if (category == null || category.equals("all")) {
            products = productService.findProductsByCategory("Wine");
        } else {
            products = productService.getWines(category);
        }
    	model.addAttribute("products", products);
    	model.addAttribute("category", category);
        return "main.tiles";  // main.html 또는 main.jsp 등
    }
}
