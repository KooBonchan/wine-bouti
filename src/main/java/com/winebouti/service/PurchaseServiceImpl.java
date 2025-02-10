package com.winebouti.service;

import java.util.List;
import java.util.UUID;

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
	
	public PurchaseVO getPurchase(String uuid) {
	  return getPurchase(UUID.fromString(uuid));
	}
	public PurchaseVO getPurchase(UUID uuid) {
		return purchaseMapper.findById(uuid);
	}
	
	@Transactional
	public void storePurchaseInfo(PurchaseVO purchaseVO) throws ArithmeticException {
		purchaseMapper.insertMetadata(purchaseVO);
		purchaseMapper.insertProductList(purchaseVO);
	}
	

}
