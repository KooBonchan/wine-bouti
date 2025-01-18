package com.winebouti.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class PurchaseVO {
	private long purchaseId;
	private long memberId;
	private String address;
	private long totalAmount;
	private List<PurchaseProductVO> products;

}
