$(function() {
        	// 카운트다운이벤트
            let countdown = 5;
            let countdownInterval = setInterval(function() {
              $(".timer").text(countdown);
              if (countdown === 1) {
                clearInterval(countdownInterval);
              } else {
                
                countdown--;
              }
            }, 1000); 
            
            // 메인화면 전환 
            setTimeout(function() {
                window.location.href = "/main/main"; 
            }, 6000); 
          
        });