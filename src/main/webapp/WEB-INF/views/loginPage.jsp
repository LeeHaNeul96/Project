<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFEEMASTER LOGIN</title>
<%@ include file ="layOut/linkLayOut.jsp" %>
<link rel="stylesheet" href="/css/login.css">
<script type="text/javascript" >

$(function(){
	let loginFail = "${loginFail}";
	if(loginFail == "loginFail") {
		alert("로그인에 실패하였습니다.");
	}
})
	</script>
</head>
<body>
	<div class="row">
		<div class="col-sm-2"></div>


		<div class="col-sm-8 ">
			<div class="black">
				<form action="/main/login" method="post">
					<img id="logo" src="/image/logo.png"/>
					<p>ID</p>
					<input class="idInput" type="text" id="id" name="id" autocomplete="off">
					<div class="line"></div>
					<p>PASSWORD</p>
					<input class="pwInput" type="password" id="pw" name="pw" >
					<div class="line"></div>

					<button type="submit" class="btn btn-dark btn-lg">SIGN IN</button>
				</form>
			</div>
		</div>



		<div class="col-sm-2"></div>
	</div>
</body>
</html>