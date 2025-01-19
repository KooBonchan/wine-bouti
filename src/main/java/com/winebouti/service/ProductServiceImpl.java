package com.winebouti.service;

import com.winebouti.mapper.ProductMapper;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

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
    public List<ProductVO> getRedWines() {
        // ProductRepository를 사용하여 레드 와인 상품 목록을 조회하는 로직 구현
        return productMapper.findRedWines();
    }

}
