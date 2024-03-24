package com.coffeemaster.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.coffeemaster.menu.vo.MenuPropertyVO;
import com.coffeemaster.order.vo.OrderVO;

@Mapper
@Repository
public interface OrderMapper {
	
	public List<MenuPropertyVO> orderList();
	
	public Integer orderComplete(@Param("lastOrderNo") OrderVO lastOrderNo, @Param("totalPrice") Long totalPrice);

	public Long insertOrderNo(Long totalPrice);
	
	public OrderVO maxOrderNo();

	public Integer deleteCart();

	public List<OrderVO> orderDetail();
	
	public List<OrderVO> orderViewDetail(Long orderNo);

	public OrderVO storeInfo();

	public Integer waitingNoInsert();

	public OrderVO waitingNo();


}
