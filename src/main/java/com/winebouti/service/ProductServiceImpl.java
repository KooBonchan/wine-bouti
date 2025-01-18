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

    @Override
    public ProductVO getProductById(int product_id) {
        return productMapper.getProductById(product_id);
    }

    @Override
    public List<ReviewVO> getReviewsByProductId(int product_id) {
        return productMapper.getReviewsByProductId(product_id);
    }
}
