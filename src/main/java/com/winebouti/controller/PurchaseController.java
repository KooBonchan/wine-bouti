package com.winebouti.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.winebouti.security.CustomUser;
import com.winebouti.service.ProductService;
import com.winebouti.service.PurchaseService;
import com.winebouti.service.PurchaseVerificationService;
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
  public String cart(HttpSession session, Model model) {
    CartDTO cartDTO = (CartDTO) session.getAttribute("cartDTO");
    /*     For debug purpose, create dummy item in session on cart request             */
//    
//    if (cartDTO == null) {
//      cartDTO = new CartDTO();
//      cartDTO.setMemberId(33); //TODO: use member ID from security
//      Map<ProductVO, Integer> cartItems = new HashMap<>();
//      for(int i = 1; i <= 3; i++) {
//        ProductVO productVO = productService.getProductById(i);
//        cartItems.merge(productVO, i, (q1,q2)->q1+q2);
//      }
//      cartDTO.setCartItems(cartItems);
//      session.setAttribute("cartDTO", cartDTO);
//    }
    /***********************************************************************************/
    if(cartDTO != null) {
      cartDTO.setTotalPrice();
    }
    
    return "cart.tiles";
  }
  
  @PutMapping("api/cart")
  public ResponseEntity<Integer> addToCart(
      @RequestParam long productId,
      @RequestParam int quantity,
      HttpSession session,
      Principal principal
  ) {
    CartDTO cartDTO = getCartFromSession(session, principal);
    ProductVO productVO = productService.getProductById(productId);
    cartDTO.getCartItems().put(productVO, quantity);
    cartDTO.setTotalPrice();
    session.removeAttribute("order");
    return ResponseEntity.ok().body(cartDTO.getTotalPrice());
  }
  
  @GetMapping("api/cart/count")
  public ResponseEntity<Integer> countCartItems(
    HttpSession session,
    Principal principal
  ){
    return ResponseEntity.ok().body(getCartFromSession(session, principal).getCartItems().size());
  }
  
  @PostMapping("api/order")
  public ResponseEntity<PurchaseVO> temporaryPurchase(
    HttpSession session, Principal principal
  ){
    PurchaseVO tempPurchase = (PurchaseVO)session.getAttribute("order");
    CartDTO cart = (CartDTO) session.getAttribute("cartDTO");
    MemberVO user = ((CustomUser) ((Authentication)principal).getPrincipal()).getMemberVO();
    if(cart == null || cart.getCartItems().isEmpty()) return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    if(tempPurchase == null) {
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
  private CartDTO getCartFromSession(HttpSession session, Principal principal) {
    CartDTO cartDTO = (CartDTO) session.getAttribute("cartDTO");
    if (cartDTO == null) {
      MemberVO user = ((CustomUser) ((Authentication)principal).getPrincipal()).getMemberVO();
      cartDTO = new CartDTO();
      cartDTO.setMemberId(user.getMemberId()); //TODO: use member ID from security
      cartDTO.setCartItems(new HashMap<>());
      session.setAttribute("cartDTO", cartDTO);
    }
    return cartDTO;
  } 
}