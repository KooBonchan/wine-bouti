package com.winebouti.controller;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

/*
Not Working
*/
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
  "file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml",
  "file:src\\main\\webapp\\WEB-INF\\spring\\appServlet\\servlet-context.xml",
  })
@TestPropertySource("classpath:jdbc.properties")
@Log4j
public class CartControllerIntegralTest {
  @Autowired
  private WebApplicationContext context;
  private MockMvc mockMvc;
  
  @Before
  public void setup() {
    this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
  }
  
  @Test
  public void testWriteDelete() {
    try {
      assertTrue(String.valueOf(1).equals(
          mockMvc.perform(MockMvcRequestBuilders.post("/api/addToCart")
          .param("productId", String.valueOf(1L))
          .param("quantity", String.valueOf(27)))
        .andReturn()
        .getResponse()
        .getContentAsString()));
    } catch (Exception e) {
      fail(e.getMessage());
    }
  }
  
}
