package com.winebouti.persistence;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.sql.Timestamp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.winebouti.mapper.PurchaseMapper;
import com.winebouti.mapper.ReviewMapper;
import com.winebouti.vo.ReviewVO;

import lombok.extern.log4j.Log4j;

// TODO: not working for foreign key issue
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@Log4j
@Transactional
public class ReviewMapperTest {
  @Autowired
  private ReviewMapper reviewMapper;
  
  private static final long PROD_ID = 1L;
  private static final long MEM_ID = 1L;
  
  
  private ReviewVO generateReviewVO() {
    ReviewVO review = new ReviewVO();
    review.setProductId(PROD_ID);
    review.setMemberId(5);
    review.setRating(5);
    review.setTitle("GOOOD");
    review.setContent("Excellent product!");
    review.setWriteDate(new Timestamp(System.currentTimeMillis()));
    return review;
  }
  
//  @Test
  public void testReviewCRUD() {
      ReviewVO review = generateReviewVO();
      reviewMapper.insertReview(review);
      var reviews = reviewMapper.getAllReviews();
      assertNotNull(reviews);
      assertFalse(reviews.isEmpty());
      
      long id = reviews.get(0).getReviewId();
      assertTrue("insert test: ", id> 0);
      log.info(id);
      
      review = reviewMapper.getReviewById(id);
      assertNotNull("select by id test: ", review);
      
      review.setContent("BAD");
      
      assertTrue(reviewMapper.deleteReview(id) > 0);
  }
  
  @Test
  public void testGetReviewByProductId() {
    assertNotNull(reviewMapper.getReviewsByProductId(PROD_ID));
  }

}
