package com.winebouti.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.winebouti.domain.Product;
@Repository
public interface ProductRepository {
    List<Product> findRedWines();  // 사용자 정의 메서드
}
