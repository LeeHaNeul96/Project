<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!-- 			장바구니 리스트 화면  -->
			<div class="cartRow">
			<h2>장바구니</h2>
			<div class="cartList" id="cartList">
				<div class="cartListBox form-control" style="height: 150px;">
			<c:forEach items="${cartList }" var="cartList" varStatus="vs">
				<div class="cartListMenu" >
				<div class="cartProperty" >[${cartList.temName}]${cartList.menuName } </div>
				<div class="cartProperty">${cartList.beanName }</div>
				<div class="cartProperty">${cartList.sizeName }</div>
				<div class="cartProperty">
				<div class="quantityBtn">
				<button class="cartQuantityBtn cartQuantityMinus" data-cartno="${cartList.cartNo }" >➖</button><span class="cartQuantityInput"> ${cartList.quantity }</span><button  class="cartQuantityBtn cartQuantityPlus" data-cartno="${cartList.cartNo }">➕</button></div> 
				</div>
				<div class="cartProperty">${cartList.menuPrice * cartList.quantity }원</div>
				<button class="cartDeleteBtn" data-cartno="${cartList.cartNo }">✖</button>
				</div>
			</c:forEach>
				</div>
			</div>
			<button id="resetBtn" type="button" class="btn btn-secondary btn-lg orderBtn">전체 초기화</button>
			<button id="orderBtn" type="button" class="btn btn-secondary btn-lg orderBtn">주문하기</button>
			</div>
			
			
<!-- 			장바구니리스트 끝  -->