package com.winebouti.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ReplyVO {
	private long productId;
    private long memberId;
    private long purchaseId;
    private String content;
    private int star;
    private boolean isOpen;
    private String password;
    private String response;
}
