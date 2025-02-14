package com.winebouti.service;

import java.util.ArrayList;
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
         // 카테고리별로 와인을 조회하는 메서드
         return productMapper.selectWineListByType(category);
     }

     @Override
     public List<ProductVO> getAllProducts(String category) {
         // 전체 상품 목록을 반환
         return productMapper.getAllProducts(category);
     }

     @Override
     public Product getProductById(Long productId) {
         // 상품 ID로 상품을 조회하는 메서드 (이건 나중에 구현 필요)
         return null;
     }

     @Override
     public List<ProductVO> getWinesByCategory(String category) {
         // 카테고리별로 상품을 가져오는 메서드 (구체적인 로직을 작성)
         List<ProductVO> products = new ArrayList<>();

         if ("red".equals(category)) {
             // 레드와인 카테고리 상품 목록 반환
             products = productMapper.selectWineListByType("red");
         } else if ("white".equals(category)) {
             // 화이트와인 카테고리 상품 목록 반환
             products = productMapper.selectWineListByType("white");
         } else if ("sparkle".equals(category)) {
             // 스파클링 와인 카테고리 상품 목록 반환
             products = productMapper.selectWineListByType("sparkle");
         }

         return products;
     }
 }
    
    


