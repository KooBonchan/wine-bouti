package com.winebouti.service;

import java.util.List;
import java.util.UUID;

import com.winebouti.vo.MemberVO;
import com.winebouti.vo.PurchaseVO;

public interface PurchaseService {
	/*관리자용*/
	List<PurchaseVO> getPurchaseList();
	
	/*회원용*/
	List<PurchaseVO> getPurchaseListByMember(long memberId);
	List<PurchaseVO> getPurchaseListByMember(MemberVO memberVO);
	PurchaseVO getPurchase(String uuid);
	PurchaseVO getPurchase(UUID uuid);
	
	void storePurchaseInfo(PurchaseVO purchaseVO);
}
