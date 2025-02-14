package com.winebouti.vo;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/*
 * Since cart will have no DB access, used term DTO instead of VO. 
 */
@Data
public class CartDTO {
  @Setter
	private long memberId;
  @Setter
  private Map<ProductVO, Integer> cartItems;
  
  private int sumProduct;
  private int deliveryFee;
  private int totalPrice;
  
  public void calculateOrderPrice() {
    int sum = cartItems.entrySet().stream()
        .map(e-> e.getKey().getOriginalPrice() * e.getValue())
        .reduce((a,b) -> a + b)
        .orElse(-1);
    
    if(sum < 0) throw new ArithmeticException("Error occurred while calculating the total amount");
    this.sumProduct = sum;
    
    this.deliveryFee = calculateDeliveryFee(sum);
    this.totalPrice = sum + this.deliveryFee; 
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
  
  private int calculateDeliveryFee(int sum){
    /*** business logic ***/
    /*정책에 맞게 수동으로 변경*/
    if(sum == 0) return 0;
    return sum < 50000 ? 3000 : 0;
  }
}
