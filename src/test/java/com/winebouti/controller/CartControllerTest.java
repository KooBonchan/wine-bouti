package com.winebouti.controller;

import static org.junit.Assert.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.winebouti.vo.AddToCartDTO;
import com.winebouti.vo.CartDTO;

import lombok.extern.log4j.Log4j;

/*
Not Working since spring security issue. need other way for testing.
*/
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
  "file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml",
  "file:src\\main\\webapp\\WEB-INF\\spring\\appServlet\\servlet-context.xml",
  "file:src\\main\\webapp\\WEB-INF\\spring\\security-context.xml",
  })
@TestPropertySource("classpath:jdbc.properties")
@Log4j
public class CartControllerTest {
  @Autowired
  private WebApplicationContext context;
  private MockMvc mockMvc;
  
  @Before
  public void setup() {
    this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
  }
  
  @Test
  @WithMockUser(username = "tester", roles= {"USER"})
  public void testAddToCart() throws UnsupportedEncodingException, Exception {
    AddToCartDTO addToCartDTO = new AddToCartDTO();
    addToCartDTO.setProductId(1L);
    addToCartDTO.setQuantity(27);
    ObjectWriter objectWriter = new ObjectMapper().writer().withDefaultPrettyPrinter();
    mockMvc.perform(
        put("/api/cart")
        .contentType(MediaType.APPLICATION_JSON)
        .sessionAttr("cartDTO", generateCartDTO())
        .content(objectWriter.writeValueAsString(addToCartDTO)))
      .andExpect(status().isOk());
  }
  
  @Test
  @WithMockUser(username = "tester", roles= {"USER"})
  public void testCartController() throws Exception {
    mockMvc.perform(get("/cart"))
    .andExpect(status().isOk());
  }
 
  
  private CartDTO generateCartDTO() {
    CartDTO cartDTO= new CartDTO();
    return cartDTO;
  }
}