package com.winebouti.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

/*
 * Since cart will have no DB access, used term DTO instead of VO. 
 */
@Getter @Setter
public class CartDTO {
	private long memberId;
    private List<CartItemDTO> cartItems;
    private double totalPrice;
    private int totalQuantity;
}
