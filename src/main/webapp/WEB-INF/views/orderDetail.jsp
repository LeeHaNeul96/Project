<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="layOut/linkLayOut.jsp" %>
<link rel="stylesheet" href="/css/orderDetail.css">
<script type="text/javascript">$(function(){
	
	//주문내역 매장정보 
			let storeName = '${storeInfo.storeName}';
			let address = '${storeInfo.address}';
			let tel = '${storeInfo.tel}'
			
			$(".storeName").append(storeName);
			$(".address").append(address);
			$(".tel").append(tel);

			//주문내역 리스트 클릭 이벤트 
		$(".orderListClick").click(function(){
			let orderNo = $(this).find(".orderNo").data("orderno");
			$.ajax({
				type: "GET",
				url: "/order/orderViewDetail",
				data:{
					orderNo: orderNo
				},
				success:function(data){
					
					$(".orderList").empty();
					let { orderDate, totalPrice } = data[0];
					 $(".orderList").append("<div class='orderDate'>주문일시 : " + orderDate + "</div> ");
					$.each(data,function(index,item){
						
						 if (item.menuName !== null) {
						        $(".orderList").append("<div class='menuNameContainer'><div>" + item.menuName + "</div><div>" + item.menuPrice + "원</div></div>");
						    }
						    if (item.beanName !== null ) {
						        $(".orderList").append("<div class='menuProperty'>▶" + item.beanName + "</div>");
						    }
						    if (item.temName !== null) {
						        $(".orderList").append("<div class='menuProperty'>▶" + item.temName +"</div>");
						    }
						    if (item.sizeName !== null) {
						        $(".orderList").append("<div class='menuProperty'>▶" + item.sizeName + "</div> ");
						    }
						    if (item.quantity !== null) {
						        $(".orderList").append("<div class='menuQuantity'>수량 : " + item.quantity + "<div> ");
						    }

					       
						   
					});
				     $(".orderList").append("<div class='totalPrice'> 총 결제금액 : " + totalPrice + "원</div> ");

					
					
				},
				error:function(error) {
				console.log('Error', error);

				}
			})
			
		});
		
		
		// 뒤로가기 클릭 이벤트
		$("#backBtn").click(function(){
			 window.history.back();
		});
		$("#logoutBtn").click(function(){
			location="/main/logout";
		});
		
		
	
});</script>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<body>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="mainBox">
				<div class="mainText">주문영수증</div>
				<div class="subBox">
					<ul class="orderListBox">

						<table class="table">
							<thead>
								<tr class="tableHeader">
									<th>주문번호</th>
									<th>주문일시</th>
									<th>총 가격</th>
								</tr>
							</thead>
							<c:forEach items="${orderList }" var="orderList">
								<tbody>
									<tr class="orderListClick" style="">
										<td class="orderNo" data-orderno="${orderList.orderNo }">${orderList.orderNo }</td>
										<td><fmt:formatDate value="${orderList.orderDate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
										<td>${orderList.totalPrice }원</td>
									</tr>

								</tbody>
							</c:forEach>
						</table>
					</ul>

					<div class="orderDetailBox">
						<div id="orderText">주문 영수증</div>
						<div class="storeName"></div>
						<div class="address"></div>
						<div class="tel"></div>

						<div class="orderList">

							<div class="orderDate"></div>
						</div>

					</div>
				</div>

				<button id="backBtn" type="button"
					class="btn btn-secondary btn-lg orderBtn">메인메뉴</button>
				<button id="logoutBtn" type="button"
					class="btn btn-secondary btn-lg orderBtn">로그아웃</button>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</body>
</html>