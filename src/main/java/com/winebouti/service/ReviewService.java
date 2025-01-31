package com.winebouti.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.winebouti.vo.ReviewVO;

@Service
public interface ReviewService {
	   List<ReviewVO> getAllReviews();

	void register(ReviewVO vo);
	}

