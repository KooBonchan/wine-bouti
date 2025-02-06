package com.winebouti.vo;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class PurchaseProductVO {
	private UUID purchaseId;
	private long productId;
	private int quantity;
  public PurchaseProductVO(long productId, int quantity) {
    this.productId = productId;
    this.quantity = quantity;
  }
}
