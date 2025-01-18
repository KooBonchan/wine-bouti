package com.winebouti.vo;

import lombok.Getter;
import lombok.Setter;

// 상세페이지
@Getter
@Setter
public class ProductVO {

	    private int product_id;
	    private String category;
	    private String korean_name;
	    private String product_image_name;
	    private String real_product_image_name;
	    private String detail_image_name;
	    private String real_detail_image_name;
	    private int original_price;
	    private boolean once;

	    // Getters and Setters
	}

