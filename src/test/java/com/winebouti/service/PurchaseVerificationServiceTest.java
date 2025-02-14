package com.winebouti.service;

import java.util.ArrayList;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.winebouti.vo.PurchaseVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
    "file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml",
    "file:src\\main\\webapp\\WEB-INF\\spring\\security-context.xml",
    "file:src\\main\\webapp\\WEB-INF\\spring\\appServlet\\servlet-context.xml",
})
@Log4j
public class PurchaseVerificationServiceTest {

  @Autowired private PurchaseVerificationService service;
  
  // change purchase id with known purchase
  private static final UUID paymentId = UUID.fromString("f0d5b93d-696d-4166-be37-1a0315b881ac");
  private static final int total = 1000;
  @Test
  public void testWithHardcodedPaymentId() {
    PurchaseVO purchaseVO = new PurchaseVO(0, null, new ArrayList<>(), null, total);
    purchaseVO.setPurchaseId(paymentId);
    
    service.verifyPurchaseData(purchaseVO);
  }
  
}
