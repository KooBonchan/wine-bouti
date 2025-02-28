package com.winebouti.vo;

import java.util.List;
import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class PurchaseVO {
  private UUID purchaseId;
	private long memberId;
	private String address;
	private String orderName;
	private List<PurchaseProductVO> products;
	
	private long totalPrice;
  
	@Builder
	public PurchaseVO(long memberId, String address, 
      List<PurchaseProductVO> products, String orderName, int totalPrice) {
    this.purchaseId = UUID.randomUUID();
    this.memberId = memberId;
    this.address = address;
    for(var product : products) {
      product.setPurchaseId(purchaseId);
    }
    this.products = products;
    this.orderName = orderName;
    this.totalPrice = totalPrice;
  }
}
