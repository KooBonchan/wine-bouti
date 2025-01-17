package com.winebouti.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ReplyVO {
	private int productId;
    private int memberId;
    private int purchaseId;
    private String content;
    private int star;
    private boolean isOpen;
    private String password;
    private String response;
}
