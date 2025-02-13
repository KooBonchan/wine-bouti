package com.winebouti.mapper;

import java.util.List;

import com.winebouti.vo.ProductVO;
import com.winebouti.vo.ReviewVO;
import com.winebouti.vo.WineVO;

public interface ProductMapper {

	/* 양정민 */
  ProductVO getProductById(long product_id);  
  List<ReviewVO> getReviewsByProductId(long product_id);
  List<ProductVO> findProductsByCategory(String category);

  
  /* 이창현 */
  
  List<ProductVO> selectProductList(String category);
  List<ProductVO> selectWineListByType(String category);
  List<ProductVO> getRedWines();
  List<ProductVO> getAllProducts(String category);
  List<ProductVO> getProductsByCategory(String category); // 카테고리별 상품 조회
  
}
