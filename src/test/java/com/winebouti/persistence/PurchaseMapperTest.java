package com.winebouti.persistence;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.winebouti.mapper.PurchaseMapper;
import com.winebouti.vo.PurchaseProductVO;
import com.winebouti.vo.PurchaseVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@Log4j
public class PurchaseMapperTest {
	
  @Autowired
	private PurchaseMapper purchaseMapper;
	
	@Test
	public void readTest() {
		var purchases = purchaseMapper.findAll();
		if(purchases.size() == 0) {
			log.info("No Item inside DB");
			return;
		}
		
		PurchaseVO purchase = purchases.get(0);
		assertNotNull(purchaseMapper.findById(purchase.getPurchaseId()));
		assertNotNull(purchaseMapper.findByMemberId(purchase.getMemberId()));		
	}
	
	@Transactional
	@Test
	public void insertTest() {
    List<PurchaseProductVO> products = new ArrayList<>();
    for(int i = 1; i <= 10; i++) {
      PurchaseProductVO product = new PurchaseProductVO(i, i * 7);
      products.add(product);
    }		
		PurchaseVO purchase = PurchaseVO.builder()
		    .memberId(3)
		    .address("Korea Seoul Chuncheon-gu DarkGal-bi 23000-won")
		    .orderName("sample")
		    .products(products)
		    .build();
		purchase.setTotalPrice(2300030);
		UUID idx = purchase.getPurchaseId();
		log.info("purchase id: " + idx.toString());
		
		purchaseMapper.insertMetadata(purchase);
		purchaseMapper.insertProductList(purchase);
	}
}
