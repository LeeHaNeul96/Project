
	$(function() {
	
		let mainImage;
		let subImage;
		

		//****************** 메인메뉴 클릭 이벤트 **************************
		$(".beverage-menu").hide();
		$(".non-coffee-menu").hide();

		// 커피 버튼 클릭 시
		$(".btn-coffee").click(function() {
			$(".coffee-menu").show();
			$(".beverage-menu").hide();
			$(".non-coffee-menu").hide();
		});

		// 음료 버튼 클릭 시
		$(".btn-beverage").click(function() {
			$(".coffee-menu").hide();
			$(".beverage-menu").show();
			$(".non-coffee-menu").hide();
		});

		// 논커피 버튼 클릭 시
		$(".btn-non-coffee").click(function() {
			$(".coffee-menu").hide();
			$(".beverage-menu").hide();
			$(".non-coffee-menu").show();
		});
		
		let orderPageData = $("#orderPageData").html();

		$(".closeBtn").click(function() {
			$(".hot").css("visibility", "hidden");
			$(".ice").css("visibility", "hidden");
			$(".tall").css("visibility", "hidden");
			$(".grande").css("visibility", "hidden");
			$(".venti").css("visibility", "hidden");
			$(".dark").css("visibility", "hidden");
			$(".aroma").css("visibility", "hidden");
			$(".deCaffein").css("visibility", "hidden");
			
			
			$("#menunoInput").val("");
			$("#temnoInput").val("");
			$("#sizenoInput").val("");
			$("#beannoInput").val("");
			$(".quantityInput").val("1");
			
			//주문선택 초기화
			 $(".hot, .ice, .tall, .grande, .venti, .dark, .aroma, .deCaffein").css({
			        "border": "",
			        "color": ""
			    });
			
			//옵션 초기화
			temNo = undefined;
			beanNo =undefined;
			sizeNo = undefined;
			$("#orderPage").fadeOut();
		});

		//메뉴선택 보기 
				$(".menuClick").click(
						
						
						function() {
							let menuNo = $(this).data("menuno");
							console.log(menuNo);
							$("#orderPage").fadeIn();
							$.ajax({
								type : 'GET',
								url : '/main/menuProperty',
								data : {
									menuNo : menuNo
								},
								dataType : "json",
								success : function(response) {
									let menuTem = response.menuTem.map(item => item.temNo);
									let menuBean = response.menuBean.map(item => item.beanNo);
									let menuSize = response.menuSize.map(item => item.sizeNo);
									let mainImageArr = response.menuImage.filter(item => item.mainImage === 1);
									let subImageArr = response.menuImage.filter(item => item.mainImage === 0);
								
									mainImage = mainImageArr.map(item => item.imageAdd);
									subImage = subImageArr.map(item => item.imageAdd);
									if(subImage == '') subImage = mainImage;
										
									
									
									
									//주문하기 메뉴넘버 추가
									$("#menunoInput").val(menuNo);
									
									$("#orderImg").attr("src",mainImage);
									console.log(mainImage);
									$(".menuClickName").text(response.menu.menuName);
									
									$(".price").text(response.menu.menuPrice+"₩");
									
									// 이미지와 가격을 한 번에 추가
//									$("#orderPageData").append("<img id='orderImg' class='orderImg'  src='" + mainImage + "'>");
//									$("#orderPageData").append("<div class='menuClickName'>" + response.menu.menuName + "</div>");
//									$("#orderPageData").append("<div class='menuPrice'><h2>" + response.menu.menuPrice + "원</h2></div>");
//									
									$("#menunoInput").val();
//
//									$("#orderImg").insertBefore(".quantity");
//									$(".menuClickName").insertAfter(".orderText");
//									$(".menuPrice").insertBefore(".quantity");

								


//									hot ice 구별
									if(menuTem.includes(1) ===  true){
										$(".hot").css("visibility", "visible");
									
									};
									if(menuTem.includes(2) === true){
										$(".ice").css("visibility", "visible");
										console.log("??");

									};
									
									//원두 구별
									if(menuBean.includes(1) === true){
										$(".dark").css("visibility", "visible");
									

									};
									if(menuBean.includes(2) === true){
										$(".aroma").css("visibility", "visible");
									};
									if(menuBean.includes(3) === true){							
										$(".deCaffein").css("visibility", "visible");

									};
									
									if(menuSize.includes(1) === true){							
										$(".tall").css("visibility", "visible");
									};
									if(menuSize.includes(2) === true){							
										$(".grande").css("visibility", "visible");
									};
									if(menuSize.includes(3) === true){							
										$(".venti").css("visibility", "visible");
									};
									
									

								},
								error : function(error) {
									console.log('Error', error);

								}

							});
						});

		//------------------- 메뉴보기 끝 ------------------
		
		
		// ------메뉴선택 
		let temNo;
		let sizeNo;
		let beanNo;
		
		
		$(".hot").click(function(){
			temNo = $(".hot").data("temno");

			$("#orderImg").attr("src", mainImage);	
			
		});
		$(".ice").click(function(){
			temNo = $(".ice").data("temno");
			console.log(temNo);
			$("#orderImg").attr("src", subImage);		
			console.log(subImage);

			
		});
		
		$(".tall").click(function(){
			sizeNo = $(".tall").data("sizeno");
			console.log(sizeNo);
		});
		$(".grande").click(function(){
			 sizeNo = $(".grande").data("sizeno");
			console.log(sizeNo);
		});
		
		$(".venti").click(function(){
			 sizeNo = $(".venti").data("sizeno");
			console.log(sizeNo);
		});
		
		$(".dark").click(function(){
			 beanNo = $(".dark").data("beanno");
			console.log(beanNo);
		});
		$(".aroma").click(function(){
			 beanNo = $(".aroma").data("beanno");
			console.log(beanNo);
		});
		
		$(".deCaffein").click(function(){
			 beanNo = $(".deCaffein").data("beanno");
			console.log(beanNo);
		});
		
		
		// 수량조절
		
		$(".quantityMinus").click(function(){
			let quantityValue = parseInt($(".quantityInput").val());
			if(quantityValue >1){
			quantityValue = quantityValue - 1;
			$(".quantityInput").val(quantityValue);
			};
		});
		$(".quantityPlus").click(function(){
			let quantityValue = parseInt($(".quantityInput").val());
			quantityValue = quantityValue+1;
			$(".quantityInput").val(quantityValue);
		});
		
		//수량조절 끝 

		
		// 메뉴옵션 선택 //
		$(".hot").click(function(){
		    $(this).css("border", "1px solid rgb(252, 123, 114)");
		    $(this).css("color", "rgb(252, 123, 114)");
		    $(".ice").css("border", "");
		    $(".ice").css("color", "");
		});
		
		$(".ice").click(function(){
		    $(this).css("border", "1px solid rgb(252, 123, 114)");
		    $(this).css("color", "rgb(252, 123, 114)");
		    $(".hot").css("border", "");
		    $(".hot").css("color", "");
		});
		
		$(".tall").click(function(){
		    $(this).css("border", "1px solid rgb(252, 123, 114)");
		    $(this).css("color", "rgb(252, 123, 114)");
		    $(".grande").css("border", "");
		    $(".grande").css("color", "");
		    $(".venti").css("border", "");
		    $(".venti").css("color", "");
		});
		$(".grande").click(function(){
		    $(this).css("border", "1px solid rgb(252, 123, 114)");
		    $(this).css("color", "rgb(252, 123, 114)");
		    $(".tall").css("border", "");
		    $(".tall").css("color", "");
		    $(".venti").css("border", "");
		    $(".venti").css("color", "");
		});
		$(".venti").click(function(){
		    $(this).css("border", "1px solid rgb(252, 123, 114)");
		    $(this).css("color", "rgb(252, 123, 114)");
		    $(".grande").css("border", "");
		    $(".grande").css("color", "");
		    $(".tall").css("border", "");
		    $(".tall").css("color", "");
		});
		$(".dark").click(function(){
		    $(this).css("border", "1px solid rgb(252, 123, 114)");
		    $(this).css("color", "rgb(252, 123, 114)");
		    $(".aroma").css("border", "");
		    $(".aroma").css("color", "");
		    $(".deCaffein").css("border", "");
		    $(".deCaffein").css("color", "");
		});
		$(".aroma").click(function(){
		    $(this).css("border", "1px solid rgb(252, 123, 114)");
		    $(this).css("color", "rgb(252, 123, 114)");
		    $(".dark").css("border", "");
		    $(".dark").css("color", "");
		    $(".deCaffein").css("border", "");
		    $(".deCaffein").css("color", "");
		});
		$(".deCaffein").click(function(){
		    $(this).css("border", "1px solid rgb(252, 123, 114)");
		    $(this).css("color", "rgb(252, 123, 114)");
		    $(".aroma").css("border", "");
		    $(".aroma").css("color", "");
		    $(".dark").css("border", "");
		    $(".dark").css("color", "");
		});
		//옵션선택 끝 
		
		
		//장바구니 추가
		$(".cartBtn").click(function(){

			$.ajax({
				
				type: "POST",
				url : "/cart/cartInsert",
				data: {
					menuNo : $("#menunoInput").val(),
					temNo : $("#temnoInput").val(),
					sizeNo : $("#sizenoInput").val(),
					beanNo : $("#beannoInput").val(),
					quantity : $(".quantityInput").val()
			},
			success: function(response){
				$("#orderPage").remove();
				$("#menunoInput").val(""),
				$("#temnoInput").val(""),
				$("#sizenoInput").val(""),
				$("#beannoInput").val(""),
				$(".quantityInput").val("1")
				location.reload();
				
			},
			error: function(error) {
				$(".optionSelectModal").show();
				$(".optionSelectModal").fadeOut(2000);
			
			}
			});
			
			
		});
		//장바구니 추가 끝 -----------
	
		
		//메뉴속성 클릭 이벤트 -----
		$(".hot, .ice").click(function() {
		    $(".hot, .ice").removeClass("selected");
		    $(this).addClass("selected");
		    $("#temnoInput").val($(this).data("temno"));
		});

		$(".tall, .grande, .venti").click(function() {
		    $(".tall, .grande, .venti").removeClass("selected");
		    $(this).addClass("selected");
		    $("#sizenoInput").val($(this).data("sizeno"));
		});

		$(".dark, .aroma, .deCaffein").click(function() {
		    $(".dark, .aroma, .deCaffein").removeClass("selected");
		    $(this).addClass("selected");
		    $("#beannoInput").val($(this).data("beanno"));
		});
		
		// 메뉴속성 클릭 이벤트 끝 -------
		
		
		//장바구니 초기화
		$("#resetBtn").click(function(){
		    $.ajax({
		        type: "POST", 
		        url: "/cart/cartReset",
		        success: function(response){
		            location.reload();
		        },
		        error: function(error) {
		            console.log('Error', error);
		        }
		    });
		});
		// 장바구니 초기화 끝
		
		
		//장바구니 수량조절
		
		$(".cartQuantityMinus").click(function(){
			let cartQuantityInput = $(this).closest('.quantityBtn').find('.cartQuantityInput');
	        let cartQuantityInputInt = parseInt(cartQuantityInput.text());
		console.log(cartQuantityInputInt);
		if(cartQuantityInputInt >1){
			let cartNo = $(this).data("cartno");
			$.ajax({
				type: "POST",
				url: "/cart/cartQuantityMinus",
				data: {
					cartNo : cartNo
					},
					success: function(response){
			            location.reload();
					},
					error: function(error){
						console.log(error)
					}
			});
		}});
		
		
		$(".cartQuantityPlus").click(function(){
			let cartNo = $(this).data("cartno");
			$.ajax({
				type: "POST",
				url: "/cart/cartQuantityPlus",
				data: {
					cartNo : cartNo
					},
					success: function(response){
			            location.reload();
					},
					error: function(error){
						console.log(error)
					}
			});
		});
		
		$(".cartDeleteBtn").click(function(){
		    let cartNo = $(this).data("cartno");
		    $.ajax({
		        type: "POST",
		        url: "/cart/cartDelete",
		        data: {
		            cartNo : cartNo
		        },
		        success: function(response){
		            location.reload();
		        },
		        error: function(error){
		            console.log(error);
		        }
		    });
		});
		
		
		
		$("#orderBtn").click(function(){
			location="/order/orderPage";
		});
		
		
		$(".orderDetail").click(function(){
			location="/order/orderDetail";
		});
		
		$(".logoutBtn").click(function(){
			location="/main/logout";
		});


 
	});
