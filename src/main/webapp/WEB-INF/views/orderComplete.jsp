<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="layOut/linkLayOut.jsp" %>
<link rel="stylesheet" href="/css/orderComplete.css">
<meta charset="UTF-8">
<title>orderConplete</title>
 <script src="/js/orderComplete.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 ">
			<div class="orderCompletePage">
				<div class="waitingText">주문완료 
					<div class="waitingNoText">대기번호</div>
					<div class="waitingNo">${waitingNo.waitingNo }</div>
					<div class="quideText">대기번호로 음료제공을 알려드립니다.</div>
					<div class="timer"></div><div id="text">초뒤 메인화면으로 돌아갑니다.</div>
					</div>
					
			
			</div>
		</div>

		<div class="col-sm-2"></div>
	</div>

</body>
</html>