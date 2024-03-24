package com.coffeemaster.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coffeemaster.cart.mapper.CartMapper;
import com.coffeemaster.menu.vo.MenuPropertyVO;

@Service
public class CartService {
	
	@Autowired
	private CartMapper mapper;
	
	public List<MenuPropertyVO> cartList(){
		return mapper.cartList();
	}
	
	public Integer cartInsert(MenuPropertyVO vo){
		return mapper.cartInsert(vo);
	}
	
	public Integer cartReset() {
		return mapper.cartReset();
	}
	
	public Integer cartQuantityMinus(Long cartNo) {
		return mapper.cartQuantityMinus(cartNo);
	}

	public Integer cartQuantityPlus(Long cartNo) {
		return mapper.cartQuantityPlus(cartNo);
		
	}

	public Integer cartDelete(Long cartNo) {
		return mapper.cartDelete(cartNo);		
	}

}
