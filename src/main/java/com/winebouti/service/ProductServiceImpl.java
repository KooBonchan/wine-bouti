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
    
	// 상품 ID로 상품 상세 조회
    @Override
    public ProductVO getProductById(int product_id) {
        return productMapper.getProductById(product_id);
    }

    // 상품 ID로 리뷰 리스트 조회
    @Override
    public List<ReviewVO> getReviewsByProductId(int product_id) {
        return productMapper.getReviewsByProductId(product_id);
    }
    
    // 레드 와인 리스트 조회
 	@Override
 	public List<WineVO> findRedWines() {
 		return productMapper.findRedWines();
 	}

 	// 카테고리별 상품 리스트 조회
 	@Override
 	public List<ProductVO> findProductsByCategory(String category) {
 		return productMapper.findProductsByCategory(category);
 	}
    
    
    
    /* 이창현 */
    
    @Override
    public List<WineVO> getRedWines() {
        // ProductRepository를 사용하여 레드 와인 상품 목록을 조회하는 로직 구현
        return productMapper.findRedWines();
    }

	@Override
	public List<WineVO> getwhiteWine() {
		// TODO Auto-generated method stub
		return productMapper.findWhiteWines();
	}

	@Override
	public List<WineVO> getSparkleWine() {
		// TODO Auto-generated method stub
		return productMapper.findSparkleWines();
	}

	@Override
	public List<WineVO> getGiftWine() {
		// TODO Auto-generated method stub
		return productMapper.findGiftWines();
	}

	@Override
	public List<WineVO> getpairingWine() {
		// TODO Auto-generated method stub
		return productMapper.findpairingWines();
	}

}
