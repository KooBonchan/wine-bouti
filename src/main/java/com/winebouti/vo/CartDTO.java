package com.winebouti.vo;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.Set;
import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

/*
 * Since cart will have no DB access, used term DTO instead of VO. 
 */
@Getter @Setter
public class CartDTO {
	private long memberId;
  private Map<ProductVO, Integer> cartItems;
  private int totalPrice;
  
  public PurchaseVO order(MemberVO memberVO) {
    String orderName = "";
    
    List<PurchaseProductVO> products = cartItems.entrySet()
        .stream()
        .map(e->new PurchaseProductVO(
            e.getKey().getProductId(),
            e.getValue()))
        .collect(Collectors.toList()); 
    
    PurchaseVO purchaseVO = PurchaseVO.builder()
        .memberId(memberVO.getMemberId())
        .address(memberVO.getAddress())
        .products(products)
        .build();
    return purchaseVO;
  }
}
