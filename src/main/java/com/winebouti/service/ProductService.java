package com.winebouti.service;

import org.springframework.stereotype.Service;
import java.util.List;
import com.winebouti.repository.ProductRepository; // ProductRepository 추가
import com.winebouti.domain.Product;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getRedWines() {
        // ProductRepository를 사용하여 레드 와인 상품 목록을 조회하는 로직 구현
        return productRepository.findRedWines();
    }
    // ... other methods
}