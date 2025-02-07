package com.winebouti.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.winebouti.security.CustomUser;
import com.winebouti.service.ProductService;
import com.winebouti.vo.CartDTO;
import com.winebouti.vo.MemberVO;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.PurchaseVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@PreAuthorize("isAuthenticated()")
@Controller
@RequiredArgsConstructor
@SessionAttributes(names = {"cartDTO", "purchase"})
@Log4j
public class PurchaseController {
  private final ProductService productService;
  
  @GetMapping("cart")
  public String cart(HttpSession session, Model model) {
    /*     For debug purpose, create dummy item in session on cart request             */
    CartDTO cartDTO = (CartDTO) session.getAttribute("cartDTO");
    if (cartDTO == null) {
      cartDTO = new CartDTO();
      cartDTO.setMemberId(33); //TODO: use member ID from security
      Map<ProductVO, Integer> cartItems = new HashMap<>();
      for(int i = 1; i <= 5; i++) {
        ProductVO productVO = productService.getProductById(i);
        cartItems.merge(productVO, i, (q1,q2)->q1+q2);
      }
      cartDTO.setCartItems(cartItems);
      session.setAttribute("cartDTO", cartDTO);
    }
    /***********************************************************************************/
    if(cartDTO != null) {
      cartDTO.setTotalPrice();
    }
    
    return "cart.tiles";
  }
  
  
  /*
   * 장바구니 정책: 세션, DB 사용 X, 결제 시 결제 정보만 저장.
   * 추후 SQL에서 Cart table 제거
   */
  @PutMapping("api/cart")
  public ResponseEntity<Integer> addToCart(
      long productId,
      int quantity,
      HttpSession session,
      Principal principal
  ) {
    MemberVO user = ((CustomUser) ((Authentication)principal).getPrincipal()).getMemberVO();
    CartDTO cartDTO = (CartDTO) session.getAttribute("cartDTO");
    if (cartDTO == null) {
      cartDTO = new CartDTO();
      cartDTO.setMemberId(user.getMemberId()); //TODO: use member ID from security
      cartDTO.setCartItems(new HashMap<>());
      session.setAttribute("cartDTO", cartDTO);
    }
    ProductVO productVO = productService.getProductById(productId);
    cartDTO.getCartItems().put(productVO, quantity);
    
    return ResponseEntity.ok().body(cartDTO.getCartItems().size());
  }
  
  @PostMapping("api/order")
  public ResponseEntity<PurchaseVO> temporaryPurchase(
      HttpSession session, Principal principal
    ){
    PurchaseVO tempPurchase = (PurchaseVO)session.getAttribute("order");
    CartDTO cart = (CartDTO) session.getAttribute("cartDTO");
    MemberVO user = ((CustomUser) ((Authentication)principal).getPrincipal()).getMemberVO();
    if(tempPurchase == null && cart == null) return ResponseEntity.status(HttpStatus.I_AM_A_TEAPOT).build();
    if(tempPurchase == null) {
      if(cart == null || cart.getCartItems().isEmpty()) {
        return ResponseEntity.status(HttpStatus.I_AM_A_TEAPOT).build();
      }
      tempPurchase = cart.order(user);
      session.setAttribute("order", tempPurchase);
    }
    return ResponseEntity.ok().body(tempPurchase);
  }
}