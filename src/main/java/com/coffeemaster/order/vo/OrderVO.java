package com.coffeemaster.order.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	String menuName,beanName,temName,sizeName,storeName,address,tel;
	Long menuPrice,cartNo,lastOrderNo,quantity,orderNo,totalPrice,waitingNo;
	Date orderDate;

}
