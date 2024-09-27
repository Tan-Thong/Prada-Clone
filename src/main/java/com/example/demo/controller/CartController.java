package com.example.demo.controller;

import com.example.demo.entity.Cart;
import com.example.demo.entity.CartItem;
import com.example.demo.entity.Invoice;
import com.example.demo.entity.Product;
import com.example.demo.service.CartItemService;
import com.example.demo.service.CartService;
import com.example.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CartController {
    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CartItemService cartItemService;

    public Double totalPrice(List<CartItem> list) {
        double total = 0;
        for(CartItem item : list) {
            total += item.getPrice();
        }
        return total;
    }

    @GetMapping("/add-to-cart/{id}")
    public String addToCart(@PathVariable("id") int productID, @RequestParam("quantity") int quantity, @RequestHeader(value = "Referer", required = false) String referer) {
        CartItem cartItem = cartItemService.getCartItemByProductId(productID);
        Product item = productService.findById(productID);
        if(cartItem != null) {
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
            cartItem.setPrice(cartItem.getPrice() + item.getPrice()*quantity);
        }
        else {
            cartItem = new CartItem();
            Cart cart = cartService.getCart();
            cartItem.setCart(cart);
            cartItem.setProduct(item);
            cartItem.setQuantity(quantity);
            cartItem.setPrice(item.getPrice()*quantity);
        }


        if (cartService.addCartItem(cartItem)) {
            return "redirect:" + referer;
        } else {
            return "redirect:/wish-list/e";
        }
    }

    @PostMapping("/add-to-cart/{id}")
    public String addProductToCart(@PathVariable("id") int productID, @RequestParam("quantity") int quantity, @RequestHeader(value = "Referer", required = false) String referer) {
        CartItem cartItem = cartItemService.getCartItemByProductId(productID);
        Product item = productService.findById(productID);
        if(cartItem != null) {
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
            cartItem.setPrice(cartItem.getPrice() + item.getPrice()*quantity);
        }
        else {
            cartItem = new CartItem();
            Cart cart = cartService.getCart();
            cartItem.setCart(cart);
            cartItem.setProduct(item);
            cartItem.setQuantity(quantity);
            cartItem.setPrice(item.getPrice()*quantity);
        }


        if (cartService.addCartItem(cartItem)) {
            return "redirect:" + referer;
        } else {
            return "redirect:/wish-list/e";
        }
    }

    @PostMapping("/update-to-cart/{id}")
    public String addUpdateProductToCart(@PathVariable("id") int productID, @RequestParam("quantity") int quantity, @RequestHeader(value = "Referer", required = false) String referer) {
        CartItem cartItem = cartItemService.getCartItemByProductId(productID);
        Product item = productService.findById(productID);
        if(cartItem.getQuantity() > quantity) {
            cartItem.setQuantity(quantity);
            cartItem.setPrice(item.getPrice()*quantity);
        } else if (cartItem.getQuantity() < quantity) {
            quantity = quantity - cartItem.getQuantity();
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
            cartItem.setPrice(cartItem.getPrice() + item.getPrice()*quantity);
        }

        if (cartService.addCartItem(cartItem)) {
            return "redirect:" + referer;
        } else {
            return "redirect:/wish-list/e";
        }
    }

    @GetMapping("/remove-to-cart/{id}")
    public String removeProductToCart(@PathVariable("id") int productID, @RequestHeader(value = "Referer", required = false) String referer) {
        CartItem cartItem = cartItemService.getCartItemByProductId(productID);

        if (cartService.removeCartItem(cartItem)) {
            cartItemService.deleteCartItem(cartItem.getId());
            return "redirect:" + referer;
        } else {
            return "redirect:/wish-list/e";
        }
    }

    @GetMapping("/checkout")
    public String checkout(Model model) {
        Invoice invoice = new Invoice();
        model.addAttribute("invoice", invoice);
        // ========= List cart item ========== //
        List<CartItem> listCartItem = cartService.getAllCartItems();
        model.addAttribute("listCartItem", listCartItem);
        model.addAttribute("total", totalPrice(listCartItem));

        return "checkout";
    }
}
