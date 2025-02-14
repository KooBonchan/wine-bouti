package com.winebouti.vo;

import java.util.HashMap;
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
  private Map<Long, Integer> itemQuantity = new HashMap<>();
  private Map<Long, ProductVO> itemDetail = new HashMap<>();
  private int sumProduct;
  private int deliveryFee;
  private int totalPrice;
  
  public PurchaseVO order(MemberVO memberVO) {
    List<PurchaseProductVO> products = itemQuantity.entrySet()
        .stream()
        .map(e->new PurchaseProductVO(
            e.getKey(),
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
  
  public void calculatePrice() {
    int sum = 0;
    for(ProductVO productVO : this.itemDetail.values()) {
      sum += productVO.getOriginalPrice() * itemQuantity.get(productVO.getProductId());
    }
    this.sumProduct = sum;
    this.deliveryFee = calculateDeliveryFee(sum);
    this.totalPrice = this.sumProduct + this.deliveryFee;
  }
  
  private String createOrderName() {
    String baseName = "";
    for(var productVO : this.itemDetail.values()) {
      baseName = productVO.getKoreanName();
      continue;
    }
    int cartCount = this.itemDetail.size() ; 
    if(cartCount<= 1) return baseName;
    return baseName + " 외 " + (cartCount - 1) + "개";
  }
  
  public void resetCalculated() {
    this.sumProduct = 0;
    this.deliveryFee = 0;
    this.totalPrice = 0;
  }
  
  
  private int calculateDeliveryFee(int sum){
    /*** business logic ***/
    /*정책에 맞게 수동으로 변경*/
    if(sum == 0) return 0;
    return sum < 50000 ? 3000 : 0;
  }
}
