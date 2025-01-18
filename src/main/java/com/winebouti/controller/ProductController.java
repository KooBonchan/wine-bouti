package com.winebouti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProductController {
	
	
	@GetMapping("")
	public String home() { return "main.tiles"; }
	
	@GetMapping("product/{productIdx}")
	public String productDetails(
		@PathVariable("productIdx") long productIdx
	) {
		return "product/details.tiles";
	}
}
