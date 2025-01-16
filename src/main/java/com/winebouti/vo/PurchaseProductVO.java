package com.winebouti.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class PurchaseProductVO {
	private long purchaseId;
	private long productId;
	private long quantity;
}
