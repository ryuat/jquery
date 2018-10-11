$(document).ready(function(){
	$("#check").on("click", function(){
		$.ajax({
			type:"post",
			url:"createXml.jsp" , // 호출할 페이지 
			data:{"buser":$("#buser").val()},
			dataType:"xml", // 넘어오는 데이터 형식 
			success:function(data){
				//alert(data);
				$("#disp").empty();
				var str = "<table><tr><td>직원번호</td><td>직원명</td><td>부서번호</td></tr>";
				$(data).find("jikwon").each(function(){
					str += "<tr><td>" +$(this).find("jikwon_no").text() + "</td>";
					str += "<td><a href=javascript:func('"+$(this).find("jikwon_name").text() + "')>" +$(this).find("jikwon_name").text() + "</a></td>";
					str += "<td>" +$(this).find("buser_num").text() + "</td></tr>";
				});
				$("#disp").append(str);
			},
			error:function(){
				$("#disp").text("error");
			}
		});
	});

})

function func(name){
	$.ajax({
		type:"get",
		url:"createJson2.jsp",
		data:{"name":name},
		dataType:"json",
		success:function(data){
			//alert(data);
			$("#disp2").empty();
			var str = "";
			var str = "<table><tr><td>직원번호</td><td>직원명</td><td>부서번호</td></tr>";
			$.each(data, function(index, entry){
				str += "<tr><td>" + entry.gogek_name + "</td>";
				str += "<td>" + entry.gogek_tel + "</td></tr>";
			});
			str += "</table>"
			$("#disp2").append(str);
		},
		error:function(){
			$("#disp2").text("error");
		}
	});
}