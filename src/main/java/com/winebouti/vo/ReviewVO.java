package com.winebouti.vo;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

// 리뷰 
@Getter
@Setter
@Data
public class ReviewVO {

	private long review_id;
	private long product_id;
	private String user_name;
	private String content;
	private int rating;
	private String created_at;
	
	private String productName;
	private Long memberId;
	private int star;
	private boolean isOpen;
	private String response;
	private Date writeDate;
	private Date updateDate;
	

}
