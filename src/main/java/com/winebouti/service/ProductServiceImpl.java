package com.winebouti.service;

import java.util.List;

import org.eclipse.core.internal.runtime.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.winebouti.mapper.ProductMapper;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
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
    

    
    
    @Override
    public List<ProductVO> getWines(String category) {
        return productMapper.selectWineListByType(category);
    }

	@Override
	public List<ProductVO> getAllProducts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product getProductById(Long productId) {
		// TODO Auto-generated method stub
		return null;
	}
    
    
    

}
