$(function() {

		let totalPrice = 0;

		$(".price").each(function() {
			let priceVal = parseFloat($(this).text().replace(/[^\d.-]/g, ''));
			totalPrice += priceVal;

		})
		$(".totalPrice").text("합계 : " + totalPrice + "원");
		
		
		$("#backBtn").click(function(){
			 window.history.back();
		});
		
		$("#completeBtn").click(function(){
			location="/order/orderComplete";
			
		});
		

	});
	