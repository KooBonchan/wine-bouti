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

	private long reviewId;
	private long productId;
	private String userName;
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
	private Long purchaseId;
	

}
