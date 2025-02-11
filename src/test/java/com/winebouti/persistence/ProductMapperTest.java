package com.winebouti.persistence;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.winebouti.mapper.ProductMapper;
import com.winebouti.vo.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@Log4j
public class ProductMapperTest {
	@Autowired private ProductMapper productMapper;
	@Test
	public void productListTest() {
		List<ProductVO> products = productMapper.findProductsByCategory("gift_set");
		log.info(products);
		assertNotNull(products);
		assertTrue(products.size() > 0);
	}
	
	@Test
	public void wineListTest() {
		List<ProductVO> products = productMapper.selectWineListByType("sparkle");
		log.info(products);
		assertNotNull(products);
		assertTrue(products.size() > 0);
	}
	
}
