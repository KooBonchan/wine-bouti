package com.winebouti.vo;

import lombok.Getter;
import lombok.Setter;

// 리뷰 
@Getter
@Setter
public class ReviewVO {

	private long review_id;
	private long product_id;
	private String user_name;
	private String content;
	private int rating;
	private String created_at;

}
