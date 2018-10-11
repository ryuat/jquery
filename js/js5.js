$(document).ready(function(){
	// alert("a");
	var speech = $("div.speech");
	var defaultSize = speech.css("font-size");
	//alert("font-size: " + defaultSize);
	//alert(parseFloat('123kbs')); // parseFloat 문자열에서 숫자만 취할 때 
	
	$("#switcher button").click(function(){
		var num = parseFloat(speech.css("fontSize")); // 문자열에서 10진수로 숫자를 추출
		//alert(num);
		switch(this.id){
			case "sw-large":
				num *= 1.2; // num *= 1.4
 				break;
			case "sw-small":
				num *= 0.8;
				break;
			default:
				num = parseFloat(defaultSize);
		}
		console.log(num);
		speech.animate({fontSize:num + "px"}, 100); // 변화되는 데 걸리는 시간 
	})
	
	$("button, a.more").hover(
		function(){
			$(this).addClass("myhover");
		},
		function(){
			$(this).removeClass("myhover");
		}
	);
	
	// 문서의 일부 숨기고 보이기
	var para = $("p:eq(1)"); // 첫번째 p 
	para.hide();
	$("a.more").click(function(){
		if(para.is(":hidden")){
			$(this).text("read less");
			//para.show();
			//para.fadeIn("slow");// fast
			para.slideToggle("slow");
		}else{
			$(this).text("read more");
			//para.hide();
			//para.fadeOut("slow");
			para.slideToggle("slow");
		}
	})
	
});