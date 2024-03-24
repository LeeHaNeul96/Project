package com.coffeemaster.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coffeemaster.cart.service.CartService;
import com.coffeemaster.menu.vo.MenuPropertyVO;

import lombok.Data;

@Controller
@RequestMapping("/cart")
@Data
public class CartController {
	
	@Autowired
	private CartService cartService;

	
	@PostMapping("/cartInsert")
	@ResponseBody
	public Integer cartInsert(MenuPropertyVO vo) {
		
		cartService.cartInsert(vo);
		return 1;
		
	}
	
	
	@PostMapping("/cartReset")
	@ResponseBody
	public Integer cartReset() {
		cartService.cartReset();
		return 1;
	}

	@PostMapping("/cartQuantityMinus")
	@ResponseBody
	public Integer cartQuantityMinus(Long cartNo) {
		cartService.cartQuantityMinus(cartNo);
		return 1;
		
	}
	@PostMapping("/cartQuantityPlus")
	@ResponseBody
	public Integer cartQuantityPlus(Long cartNo) {
		cartService.cartQuantityPlus(cartNo);
		return 1;
		
	}
	@PostMapping("/cartDelete")
	@ResponseBody
	public Integer cartDelete(Long cartNo) {
		cartService.cartDelete(cartNo);
		return 1;
		
	}
}
