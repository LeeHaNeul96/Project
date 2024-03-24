package com.coffeemaster.order.controller;

import java.util.List;

import javax.ws.rs.GET;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.coffeemaster.cart.service.CartService;
import com.coffeemaster.menu.vo.MenuPropertyVO;
import com.coffeemaster.order.service.OrderService;
import com.coffeemaster.order.vo.OrderVO;

import lombok.Data;

@Controller
@RequestMapping("/order")
@Data
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	
	@GetMapping("/orderPage")
	public String orderPage(Model model) {
		List<MenuPropertyVO> orderList =  orderService.orderList();
		
		model.addAttribute("orderList", orderList);
		
		return "orderPage";
	}
	
	
	@GetMapping("/orderComplete")
	public String orderComplete(Model model) { 
		
		
		List<MenuPropertyVO> cartListVO = cartService.cartList();
		
		 Long totalPrice = cartListVO.stream()
	                .mapToLong(item -> item.getQuantity() * item.getMenuPrice())
	                .sum();

	        System.out.println("Total Price: " + totalPrice);
	
		Integer result = orderService.orderComplete(totalPrice);
		System.out.println("daslkasjdlkasjdlksalkdjalsjdlaj" + result);
		orderService.deleteCart();
		orderService.waitingNoInsert();
		model.addAttribute("waitingNo", orderService.waitingNo());
		
		
		
		return "orderComplete";
	}
	
	@GetMapping("/orderDetail")
	public String orderDetail(Model model) {
		
		List<OrderVO> orderDetailList = orderService.orderDetail();
		model.addAttribute("orderList", orderDetailList);
		OrderVO storeVO = orderService.storeInfo();
		model.addAttribute("storeInfo", storeVO);
		return "orderDetail";
	}
	
	@GetMapping("/orderViewDetail")
	@ResponseBody
	public List<OrderVO> orderViewDetail(Model model,Long orderNo) {
			List<OrderVO> orderViewDetail = orderService.orderViewDetail(orderNo);
			System.out.println("orderViewDetail ===== " + orderViewDetail);
			
		return orderViewDetail;
	}
	
}
