package com.winebouti.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.winebouti.mapper.ProductMapper;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;
import com.winebouti.vo.WineVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

	private final ProductMapper productMapper;

    /* 양정민 */
    
    @Override
    public ProductVO getProductById(int product_id) {
        return productMapper.getProductById(product_id);
    }

    @Override
    public List<ReviewVO> getReviewsByProductId(int product_id) {
        return productMapper.getReviewsByProductId(product_id);
    }
    
    
    
    
    /* 이창현 */
    
    @Override
    public List<WineVO> getRedWines() {
        // ProductRepository를 사용하여 레드 와인 상품 목록을 조회하는 로직 구현
        return productMapper.findRedWines();
    }

}
