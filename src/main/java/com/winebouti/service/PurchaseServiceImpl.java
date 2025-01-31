package com.winebouti.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.cj.exceptions.NumberOutOfRange;
import com.winebouti.mapper.ProductMapper;
import com.winebouti.mapper.PurchaseMapper;
import com.winebouti.vo.MemberVO;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.PurchaseVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PurchaseServiceImpl {
	private final PurchaseMapper purchaseMapper;
	private final ProductMapper productMapper;
	
	// 관리자용 
	public List<PurchaseVO> getPurchaseList(){
		return purchaseMapper.findAll();
	}
	
	public List<PurchaseVO> getPurchaseListByMember(long memberId){
		return purchaseMapper.findByMemberId(memberId);
	}
	public List<PurchaseVO> getPurchaseListByMember(MemberVO memberVO){
		return purchaseMapper.findByMemberId(memberVO.getMemberId());
	}
	public PurchaseVO getPurchase(long id) {
		return purchaseMapper.findById(id);
	}
	
	@Transactional
	public void storePurchaseInfo(PurchaseVO purchaseVO) {		
		purchaseMapper.insertMetadata(purchaseVO);
		purchaseMapper.insertProductList(purchaseVO);
	}
	
	public int calculateTotalAmount(PurchaseVO purchaseVO) {
		int total = 0;
		for(var purchaseProduct : purchaseVO.getProducts()) {
			ProductVO productVO = productMapper.getProductById((int)purchaseProduct.getProductId());
			int price = productVO.getOriginalPrice();
			int tempTotal = total + price * purchaseProduct.getQuantity();
			if(total > tempTotal) {
				throw new NumberOutOfRange("total amount exceeded int range");
			}
			total = tempTotal;
		}
		return total;
	}

}
