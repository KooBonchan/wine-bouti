package com.winebouti.vo;

import java.sql.Date;
import java.sql.Timestamp;

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
	private long memberId;
	private int star;
	private boolean isOpen;
	private String response;
	private Timestamp writeDate;
	private Date updateDate;
//	private long purchaseId;
	
	
	private String imagePath; //이미지경로
	private String thumbnailPath; //썸네일 경로
	private String title;
	

}
