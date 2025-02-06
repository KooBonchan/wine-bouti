package com.winebouti.mapper;

import java.util.List;
import java.util.UUID;

import com.winebouti.vo.PurchaseVO;

public interface PurchaseMapper {
	List<PurchaseVO> findAll();
	PurchaseVO findById(UUID id);
	List<PurchaseVO> findByMemberId(long memberId);
	
	int insertMetadata(PurchaseVO purchaseVO);
	int insertProductList(PurchaseVO purchaseVO);
}
