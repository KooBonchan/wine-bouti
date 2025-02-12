package com.winebouti.vo;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import lombok.Getter;
import lombok.Setter;

/*
 * Since cart will have no DB access, used term DTO instead of VO. 
 */
@Getter
public class CartDTO {
  @Setter
	private long memberId;
  @Setter
  private Map<ProductVO, Integer> cartItems;
  
  private int totalPrice;
  public void setTotalPrice() {
    int total = cartItems.entrySet().stream()
        .map(e-> e.getKey().getOriginalPrice() * e.getValue())
        .reduce((a,b) -> a + b)
        .orElse(-1);
    
    if(total < 0) throw new ArithmeticException("Error occurred while calculating the total amount");
    /*** business logic ***/
    if(this.totalPrice < 50000) this.totalPrice += 3000;
    /**********************/
    this.totalPrice = total; 
  }
  

  public PurchaseVO order(MemberVO memberVO) {
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
        .orderName(createOrderName())
        .totalPrice(totalPrice)
        .build();
    return purchaseVO;
  }
  
  
  private String createOrderName() {
    String baseName = "";
    for(ProductVO product : cartItems.keySet()) {
      baseName = product.getKoreanName();
      break;
    }
    if(cartItems.size() <= 1) return baseName;
    return baseName + " 외 " + (cartItems.size() - 1) + "개";
  }
}
