package com.winebouti.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.winebouti.mapper.ProductMapper;
import com.winebouti.mapper.PurchaseMapper;
import com.winebouti.vo.MemberVO;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.PurchaseVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PurchaseServiceImpl implements PurchaseService {
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
	public void storePurchaseInfo(PurchaseVO purchaseVO) throws ArithmeticException {
		if(purchaseVO.getTotalAmount() <= 0) {
			purchaseVO.setTotalAmount(calculateTotalAmount(purchaseVO));
		}
		purchaseMapper.insertMetadata(purchaseVO);
		purchaseMapper.insertProductList(purchaseVO);
	}
	
	public int calculateTotalAmount(PurchaseVO purchaseVO) throws ArithmeticException{
		int total = 0;
		for(var purchaseProduct : purchaseVO.getProducts()) {
			// TODO: int -> long
			ProductVO productVO = productMapper.getProductById((int)purchaseProduct.getProductId());
			int price = productVO.getOriginalPrice();
			int tempTotal = total + price * purchaseProduct.getQuantity();
			if(total > tempTotal) {
				throw new ArithmeticException("Overflow occurred or unexpected negative value for quantity or price.");
			}
			total = tempTotal;
		}
		return total;
	}

}
