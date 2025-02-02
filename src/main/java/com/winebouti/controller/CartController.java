package com.winebouti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winebouti.service.ProductService;
import com.winebouti.service.ReviewService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("Cart")
@RequiredArgsConstructor
public class CartController {
	private final ProductService productService;
	/*
	 * 장바구니 정책: 세션, DB 사용 X
	 * */
	/*
	 * @Controller
	 * 
	 * @SessionAttributes("cartDTO") // This will keep "cartDTO" in the session
	 * automatically public class CartController {
	 * 
	 * @RequestMapping("/addToCart") public String
	 * addToCart(@RequestParam("productId") String productId,
	 * 
	 * @RequestParam("quantity") int quantity, HttpSession session, Model model) {
	 * 
	 * // Retrieve or create the cart CartDTO cartDTO = (CartDTO)
	 * session.getAttribute("cartDTO"); if (cartDTO == null) { cartDTO = new
	 * CartDTO(); cartDTO.setMemberId("some-member-id"); // You would set this
	 * dynamically based on login cartDTO.setCartItems(new ArrayList<>());
	 * session.setAttribute("cartDTO", cartDTO); }
	 * 
	 * // Fetch the product (You would typically query this from a database) Product
	 * product = findProductById(productId); // Implement this method to fetch the
	 * product from DB
	 * 
	 * // Add item to cart CartItem cartItem = new CartItem();
	 * cartItem.setProduct(product); cartItem.setQuantity(quantity);
	 * cartDTO.getCartItems().add(cartItem);
	 * 
	 * // Update the cart in session session.setAttribute("cartDTO", cartDTO);
	 * 
	 * // Add cart data to the model so the view can display it
	 * model.addAttribute("cart", cartDTO);
	 * 
	 * return "cartView"; // Return the view to show the cart (update this as per
	 * your view name) }
	 * 
	 * private Product findProductById(String productId) { // For now, just create a
	 * mock product. In real-world, query the DB. Product product = new Product();
	 * product.setProductId(productId); product.setName("Sample Product");
	 * product.setPrice(100.00); // Example price return product; } }
	 */

}
