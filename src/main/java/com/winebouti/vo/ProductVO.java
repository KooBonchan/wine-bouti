package com.winebouti.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ProductVO {

    private long productId;
	private String category;
    private String koreanName;
    private String productImageName;
    private String realProductImageName;
    private String detailImageName;
    private String realDetailImageName;
    private int originalPrice;
    private boolean once;

}

