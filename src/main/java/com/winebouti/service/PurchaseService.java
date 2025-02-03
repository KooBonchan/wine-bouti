package com.winebouti.service;

import java.util.List;

import com.winebouti.vo.MemberVO;
import com.winebouti.vo.PurchaseVO;

public interface PurchaseService {
	/*관리자용*/
	List<PurchaseVO> getPurchaseList();
	
	/*회원용*/
	List<PurchaseVO> getPurchaseListByMember(long memberId);
	List<PurchaseVO> getPurchaseListByMember(MemberVO memberVO);
	PurchaseVO getPurchase(long id);
	
	void storePurchaseInfo(PurchaseVO purchaseVO);
}
