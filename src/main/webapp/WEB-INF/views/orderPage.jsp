<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file ="layOut/linkLayOut.jsp" %>
<link rel="stylesheet" href="/css/orderPage.css">
<title>주문 페이지</title>

<script type="text/javascript" src="/js/orderPage.js">
</script>
</head>
<body>
	<div class="row">
		<div class="col-sm-2"></div>



		<div class="col-sm-8">
			<div class="orderPage">

				<div class="orderPageBox">
					<div class="orderText">주문하기</div>
					<div class="orderList">
						<h2 class="orderListText">주문내역</h2>
						<div class="orderListBox">
							<c:forEach items="${orderList }" var="orderList">
								<div class="menuList">
									<span>[${orderList.temName}]${orderList.menuName }</span>
									<div class="menuProperty">
										<c:if test="${orderList.beanName != null }">
											<div>▶${orderList.beanName }</div>
										</c:if>
										<div>▶${orderList.sizeName}</div>
										<div>▶수량 : ${orderList.quantity }</div>
										<div class="price">▶${orderList.menuPrice * orderList.quantity }원</div>
									</div>

								</div>
							</c:forEach>
						</div>
						<h2 class="totalPrice"></h2>
						<button id="backBtn" type="button"
							class="btn btn-secondary btn-lg orderBtn">뒤로가기</button>
						<button id="completeBtn" type="button"
							class="btn btn-secondary btn-lg orderBtn">주문완료</button>

					</div>

				</div>


			</div>
		</div>




		<div class="col-sm-2"></div>
	</div>

</body>
</html>