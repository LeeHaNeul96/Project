<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<%@ include file ="layOut/linkLayOut.jsp" %>
<link rel="stylesheet" href="/css/main.css">



<script type="text/javascript" src="/js/main.js"></script>

</head>
<body>


	<!--  주문 창  -->
	<div id="orderPage">
		<h1 class="orderText" style="color: black;">주문하기</h1>
		<div class='menuClickName'></div>
		<div id="orderPageData">
			

			<div style="display: flex; flex-wrap: wrap;">

				<div class="menuTem hot " data-temno="1">
					<h2 style="line-height: 100px;">HOT</h2>
				</div>
				<div class="menuTem ice " data-temno="2">
					<h2 style="line-height: 100px;">ICE</h2>
				</div>
			</div>

			<div style="display: flex; flex-wrap: wrap;">
				<div class="menuSize tall" data-sizeno="1">
					<h2 style="line-height: 100px;">TALL</h2>
				</div>
				<div class="menuSize grande" data-sizeno="2">
					<h2 style="line-height: 100px;">GRANDE</h2>
				</div>
				<div class="menuSize venti" data-sizeno="3">
					<h3 style="line-height: 100px;">VENTI</h3>
				</div>
			</div>
			<!-- 			수량조절 버튼  -->
			<img id='orderImg' class='orderImg' src="">
			<div class='menuPrice'><h2 class="price"></h2></div>
				<div class="quantityText">수량</div>
			<div class="btn-group quantity">
				<button type="button" class="btn btn-dark quantityMinus ">-</button>
				<input class="quantityInput" value="1" readonly>
				<button type="button" class="btn btn-dark quantityPlus">+</button>
			</div>
			<!-- 			수량조절 끝  -->

			<div style="display: flex; flex-wrap: wrap;">
				<div class="menuBeans dark" data-beanno="1">
					<h2 style="line-height: 100px;">DARK</h2>
				</div>
				<div class="menuBeans aroma" data-beanno="2">
					<h2 style="line-height: 100px; font-size: 24px;">AROMA</h2>
				</div>
				<div class="menuBeans deCaffein" data-beanno="3">
					<h3 style="line-height: 30px; margin-top: 20px;">DE CAFFEIN</h3>
				</div>
			</div>
		</div>

		<div style="display: flex;">
			<button type="button" class="btn btn-secondary closeBtn orderButton">취소하기</button>

			<button type="button" class="btn btn-secondary cartBtn orderButton">주문하기</button>
			
			
			<input type="hidden" id="menunoInput" name="menuNo" value="">
			<input type="hidden" id="temnoInput" name="temNo" value="">
			<input type="hidden" id="sizenoInput" name="sizeNo" value="">
			<input type="hidden" id="beannoInput" name="beanNo" value="">
			
			
		</div>
	</div>
	<!--  주문창 끝  -->




	<div class="row">
		<div class="col-sm-2"></div>


		<div class="col-sm-8 ">
			<div class="black">
				<img class="logo" src="/image/logo.png">
			<c:if test="${login.gradeNo == 1 }">
				<button class="btn btn-dark orderDetail">영수증 조회</button></c:if>
				<button class="btn btn-dark logoutBtn " style="float:right;">로그아웃</button><br>
				<div class="btn-group btn-group-lg">
					<button type="button" class="btn btn-dark menu btn-coffee">COFFEE</button>
					<button type="button" class="btn btn-dark menu btn-beverage">BEVERAGE</button>
					<button type="button" class="btn btn-dark menu btn-non-coffee">NON_COFFEE</button>
				</div>

				<!-- 커피 메뉴 -->
				<div class="coffee-menu">
					<p class="menuName">커피 메뉴</p>
					<div class="menu-container">

						<c:forEach items="${menu }" var="menu" varStatus="vs">
							<c:if test="${menu.divisionNo == 1 }">
								<div class="menuList menuClick" data-menuno="${menu.menuNo }">
									<img class="menuImg" src="${menu.imageAdd }">
									<div>${menu.menuName }</div>
									<div>${menu.menuPrice }₩</div>
								</div>

							</c:if>
						</c:forEach>


					</div>
				</div>


				<!-- 음료 메뉴 -->
				<div class="beverage-menu">
					<!-- 여기에 음료 메뉴에 대한 내용 추가 -->
					<p class="menuName">베버리지 메뉴</p>
					<div class="menu-container">
						<c:forEach items="${menu }" var="menu" varStatus="vs">
							<c:if test="${menu.divisionNo == 2 }">
								<div class="menuList menuClick" data-menuno="${menu.menuNo }">
									<img class="menuImg" src="${menu.imageAdd }">
									<div>${menu.menuName }</div>
									<div>${menu.menuPrice }</div>
								</div>


							</c:if>
						</c:forEach>
					</div>
				</div>

				<!-- 비커피 메뉴 -->
				<div class="non-coffee-menu">
					
					<p class="menuName">논-커피 메뉴</p>
					<div class="menu-container">
						<c:forEach items="${menu }" var="menu" varStatus="vs">
							<c:if test="${menu.divisionNo == 3 }">
								<div class="menuList menuClick" data-menuno="${menu.menuNo }">
									<img class="menuImg" src="${menu.imageAdd }">
									<div>${menu.menuName }</div>
									<div>${menu.menuPrice }</div>
								</div>


							</c:if>
						</c:forEach>
					</div>

				</div>
				
<!-- 				장바구니 리스트  -->
				<jsp:include page="cartList.jsp"></jsp:include>
				
				
				<!-- 옵션 미지정 모달 -->
		<div class="optionSelectModal">
			<div class="TextBox">
				<div class="text">옵션을 모두 선택해주세요.</div>
			</div>
		</div>
		
		

			</div>
		</div>



		<div class="col-sm-2"></div>
	</div>
</body>
</html>