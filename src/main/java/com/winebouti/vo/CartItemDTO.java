package com.winebouti.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@RequiredArgsConstructor
@AllArgsConstructor
public class CartItemDTO {
	private final ProductVO product;
	@Setter
	int quantity = 1;
}
