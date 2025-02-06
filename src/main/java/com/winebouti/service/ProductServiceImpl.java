package com.winebouti.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winebouti.mapper.ProductMapper;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;
import com.winebouti.vo.WineVO;

import lombok.RequiredArgsConstructor;

@Service

public class ProductServiceImpl  implements ProductService {

	private final ProductMapper productMapper;

    /* 양정민 */
    
	// 상품 ID로 상품 상세 조회
    @Override
    public ProductVO getProductById(long product_id) {
        return productMapper.getProductById(product_id);
    }

    // 상품 ID로 리뷰 리스트 조회
    @Override
    public List<ReviewVO> getReviewsByProductId(long product_id) {
        return productMapper.getReviewsByProductId(product_id);
    }
    
    
 	// 카테고리별 상품 리스트 조회
 	@Override
 	public List<ProductVO> findProductsByCategory(String category) {
 		return productMapper.findProductsByCategory(category);
 	}
    
    
    
    /* 이창현 */
    

    @Autowired
    public ProductServiceImpl (ProductMapper productMapper) {
        this.productMapper = productMapper;
    }
    
    
    @Override
    public List<ProductVO> getWines(String category) {
        return productMapper.selectWineListByType(category);
    }
    
    
    

}
