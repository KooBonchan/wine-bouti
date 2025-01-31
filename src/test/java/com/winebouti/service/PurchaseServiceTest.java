package com.winebouti.service;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.winebouti.vo.PurchaseProductVO;
import com.winebouti.vo.PurchaseVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@Log4j
public class PurchaseServiceTest {
	@Autowired
	private PurchaseServiceImpl purchaseService;
	
	private PurchaseVO generateTestPurchase() {
		PurchaseVO purchaseVO = new PurchaseVO();
		purchaseVO.setMemberId(1);
		purchaseVO.setAddress("Test Address KR");
		purchaseVO.setTotalAmount(233232331);
		
		List<PurchaseProductVO> products = new ArrayList<>();
		for(int i = 1; i <= 5; i++) {
			PurchaseProductVO ppvo = new PurchaseProductVO();
			ppvo.setProductId(i);
			ppvo.setQuantity(i * 7);
			products.add(ppvo);
		}
		purchaseVO.setProducts(products);
		return purchaseVO;
	}
	
	@Test
	@Transactional
	public void purchaseTest() {
		PurchaseVO testPurchaseVO = generateTestPurchase();
		int totalAmount;
		try {
			totalAmount = purchaseService.calculateTotalAmount(testPurchaseVO);
		} catch (Exception e) {
			fail("No test productss 1 to 5 exists. Retry this test after ensure that you have product ");
			return;
		}
		assertTrue(totalAmount > 0);
		purchaseService.storePurchaseInfo(testPurchaseVO);
	}
}
