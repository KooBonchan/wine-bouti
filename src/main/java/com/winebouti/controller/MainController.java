package com.winebouti.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.winebouti.service.ProductService;
import com.winebouti.vo.ProductVO;

@Controller
public class MainController {

    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public String mainPage(Model model) {
    	model.addAttribute("products", productService.findProductsByCategory("Wine"));
        return "main.tiles";  // main.html 또는 main.jsp 등
    }
    
}
