package com.coffeemaster.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coffeemaster.menu.vo.MenuPropertyVO;
import com.coffeemaster.order.mapper.OrderMapper;
import com.coffeemaster.order.vo.OrderVO;

@Service
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	public List<MenuPropertyVO> orderList(){
		return orderMapper.orderList();
	}
	
	public Integer orderComplete(Long totalPrice) {
		orderMapper.insertOrderNo(totalPrice);
		OrderVO lastOrderNo =  orderMapper.maxOrderNo();
		
		return orderMapper.orderComplete(lastOrderNo,totalPrice); 
	}

	public Integer deleteCart() {
		return orderMapper.deleteCart();
		
	}
	
	public List<OrderVO> orderDetail(){
		return orderMapper.orderDetail();
	}
	
	public List<OrderVO> orderViewDetail(Long orderNo) {
		return orderMapper.orderViewDetail(orderNo);
	}

	public OrderVO storeInfo() {
		// TODO Auto-generated method stub
		return orderMapper.storeInfo();
	}

	public Integer waitingNoInsert() {
		// TODO Auto-generated method stub
		return orderMapper.waitingNoInsert();
		
	}

	public OrderVO waitingNo() {
		return orderMapper.waitingNo();
		// TODO Auto-generated method stub
		
	}



}
