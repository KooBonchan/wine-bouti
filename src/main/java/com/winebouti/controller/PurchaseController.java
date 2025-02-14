package com.winebouti.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.winebouti.security.CustomUser;
import com.winebouti.service.ProductService;
import com.winebouti.service.PurchaseService;
import com.winebouti.service.PurchaseVerificationService;
import com.winebouti.vo.AddToCartDTO;
import com.winebouti.vo.CartDTO;
import com.winebouti.vo.MemberVO;
import com.winebouti.vo.ProductVO;
import com.winebouti.vo.PurchaseVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@PreAuthorize("isAuthenticated()")
@Controller
@SessionAttributes(names = {"cartDTO", "purchase"})
@RequiredArgsConstructor
@Log4j
public class PurchaseController {
  private final ProductService productService;
  private final PurchaseService purchaseService;
  private final PurchaseVerificationService verificationService;
  
  @GetMapping("cart")
  public String cart() { return "cart.tiles"; }
  
  @GetMapping("api/cart")
  public ResponseEntity<CartDTO> cart(HttpSession session, Model model, Principal principal) {
    CartDTO cartDTO = getCartFromSession(session);
    if(! cartDTO.getItemDetail().isEmpty()) {
      cartDTO.calculatePrice();
    } else {
      cartDTO.resetCalculated();
    }
    return ResponseEntity.ok().body(cartDTO);
  }
  
  

  @PostMapping("api/cart")
  public ResponseEntity<Void> addToCart(
      @RequestBody AddToCartDTO addToCartDTO,
      HttpSession session,
      Principal principal
  ) {
    long productId  = addToCartDTO.getProductId();
    int quantity = addToCartDTO.getQuantity();
    CartDTO cartDTO = getCartFromSession(session);
    cartDTO.getItemDetail().computeIfAbsent(productId, id -> productService.getProductById(id));
    cartDTO.getItemQuantity().merge(productId, quantity, (a,b) -> a + b);
    session.removeAttribute("order");
    return ResponseEntity.ok().build();
  }
  
  @PutMapping("api/cart")
  public ResponseEntity<Void> modifyCart(
      @RequestBody AddToCartDTO addToCartDTO,
      HttpSession session,
      Principal principal
  ) {
    long productId  = addToCartDTO.getProductId();
    int quantity = addToCartDTO.getQuantity();
    CartDTO cartDTO = getCartFromSession(session);
    cartDTO.getItemDetail().computeIfAbsent(productId, id -> productService.getProductById(id));
    cartDTO.getItemQuantity().put(productId, quantity);
    session.removeAttribute("order");
    return ResponseEntity.ok().build();
  }
  
  @DeleteMapping("api/cart/{productId}")
  public ResponseEntity<Void> deleteFromCart(
      @PathVariable Long productId,
      HttpSession session){
    CartDTO cartDTO = getCartFromSession(session);
    cartDTO.getItemDetail().remove(productId);
    cartDTO.getItemQuantity().remove(productId);
    session.removeAttribute("order");  
    return ResponseEntity.ok().build();
  }
  
  @GetMapping("api/cart/count")
  public ResponseEntity<Integer> countCartItems(
    HttpSession session,
    Principal principal
  ){
    return ResponseEntity.ok().body(getCartFromSession(session).getItemDetail().size());
  }
  
  @PostMapping("api/order")
  public ResponseEntity<PurchaseVO> temporaryPurchase(
    HttpSession session, Principal principal
  ){
    PurchaseVO tempPurchase = (PurchaseVO)session.getAttribute("order");
    CartDTO cart = (CartDTO) session.getAttribute("cartDTO");
    MemberVO user = ((CustomUser) ((Authentication)principal).getPrincipal()).getMemberVO();
    if(cart == null || cart.getItemQuantity().isEmpty()) return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    if(tempPurchase == null) {
      cart.calculatePrice();
      tempPurchase = cart.order(user);
      session.setAttribute("order", tempPurchase);
    }
    return ResponseEntity.ok().body(tempPurchase);
  }
  
  @PostMapping("api/purchase/complete")
  public ResponseEntity<Void> purchase(
    HttpSession session
  ){
    PurchaseVO purchase = (PurchaseVO)session.getAttribute("order");
    
    try {
      verificationService.verifyPurchaseData(purchase);
      purchaseService.storePurchaseInfo(purchase);
      return ResponseEntity.ok().build();
    } catch(Exception e) {
      log.error(e.getMessage());
      return ResponseEntity.badRequest().build();
    }
  }
  
  // if no cart exists in session, create cart based on principal.
  private CartDTO getCartFromSession(HttpSession session) {
    CartDTO cartDTO = (CartDTO) session.getAttribute("cartDTO");
    if (cartDTO == null) {
      cartDTO = new CartDTO();
      session.setAttribute("cartDTO", cartDTO);
    }
    return cartDTO;
  } 
  
  
  
}