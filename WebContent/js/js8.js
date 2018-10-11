$(document).ready(function(){
	$("#btn1").on("click", function(){
		//alert("a");
		$.ajax({
			type:"get",
			url:"jq7_xml1.jsp",
			dataType:"xml",
			success:function(data){
				//alert(data);
				$("#disp").empty();
				var str = "";
				$(data).find("person").each(function(){
					str += $(this).find("name").text() + " ";
				});
				$("#disp").append(str);
			},
			error:function(){
				$("#disp").text("error");
			}
		});
	})
	
	$("#btn2").on("click", function(){
		//var inp = $("#xmlinput").val();
		$.ajax({
			type:"post",
			url:"jq7_xml2.jsp" , // 호출할 페이지 
			//data:"name=" + $("#xmlinput").val(),
			data:{"name":$("#xmlinput").val()},
			dataType:"xml", // 넘어오는 데이터 형식 
			success:function(data){
				//alert(data);
				$("#disp").empty();
				var str = "";
				$(data).find("person").each(function(){
					str += $(this).find("name").text() + " ";
				});
				$("#disp").append(str);
			},
			error:function(){
				$("#disp").text("error");
			}
		});
	})
	
	$("#btn3").on("click", function(){
		$.ajax({
			type:"get",
			url:"jq7_json1.jsp",
			dataType:"json",
			success:function(data){
				//alert(data);
				$("#disp").empty();
				var str = "";
				$.each(data, function(index, entry){
					str += entry.name + ", " + entry.age;
				});
				$("#disp").append(str);
			},
			error:function(){
				$("#disp").text("error");
			}
		});
	})
	
	$("#btn4").on("click", function(){
		$.ajax({
			type:"get",
			url:"jq7_json2.jsp",
			dataType:"json",
			data:{"name":$("#jsoninput").val(), "age":$("#jsoninput2").val()},
			success:function(data){
				//alert(data);
				$("#disp").empty();
				var str = "";
				$.each(data, function(index, entry){
					str += entry.name + ", " + entry.age;
				});
				$("#disp").append(str);
			},
			error:function(){
				$("#disp").text("error");
			}
		});
	})
})