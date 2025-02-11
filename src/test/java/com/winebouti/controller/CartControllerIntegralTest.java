package com.winebouti.controller;

import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertTrue;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.winebouti.security.CustomUser;
import com.winebouti.vo.AuthVO;
import com.winebouti.vo.MemberVO;

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
public class CartControllerIntegralTest {
  @Autowired
  private WebApplicationContext context;
  private MockMvc mockMvc;
  
  @Before
  public void setup() {
    this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
  }
  
  @Test
  public void testAddToCart() throws UnsupportedEncodingException, Exception {
    String itemsCount = mockMvc.perform(MockMvcRequestBuilders.post("/api/addToCart")
        .param("productId", String.valueOf(1L))
        .param("quantity", String.valueOf(27)))
      .andReturn()
      .getResponse()
      .getContentAsString();
    assertTrue(String.valueOf(1).equals(itemsCount));
  }
  
  @Test
  public void testOrder() throws UnsupportedEncodingException, Exception  {
    CustomUser mockUser = createCustomUser();
    
    Authentication authentication = new UsernamePasswordAuthenticationToken(mockUser, mockUser.getAuthorities());
    SecurityContextHolder.getContext().setAuthentication(authentication);
    
    String itemsCount = mockMvc.perform(MockMvcRequestBuilders.post("/api/addToCart")
        .param("productId", String.valueOf(1L))
        .param("quantity", String.valueOf(27)))
      .andReturn()
      .getResponse()
      .getContentAsString();
    mockMvc.perform(MockMvcRequestBuilders.post("/api/order"))
      .andExpect(status().isOk())
      .andExpect(request().sessionAttribute("order", notNullValue())) // Assert that 'order' attribute exists in session
      .andReturn();
  }
  
  private CustomUser createCustomUser() {
    MemberVO memberVO = new MemberVO();
    memberVO.setEmail("user15@example.com");
    memberVO.setPassword("password15");
    List<AuthVO> auths= new ArrayList<>();
    auths.add(new AuthVO("ROLE_USER"));
    memberVO.setAuths(auths);
    return new CustomUser(memberVO);
  }
}