package com.winebouti.persistence;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.winebouti.service.ProductService;
import com.winebouti.vo.ProductVO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@Log4j
public class SelectTest {

    @Autowired
    private ProductService productService;

    @Test
    public void testProductService() {
        long ProductId = 1L;

        ProductVO product = productService.getProductById(ProductId);

        // 결과 검증
        assertNotNull("상품이 null이어서는 안됩니다.", product);
        assertEquals("상품 ID가 일치하지 않습니다.", ProductId, product.getProductId());
    }
}
