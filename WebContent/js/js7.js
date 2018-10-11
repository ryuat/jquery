$(document).ready(function(){
	//1. html을 text형태로 읽기
	$("#btnT").click(function(){
		//alert("t클릭");
		
		$.getJSON("createJson.jsp", null, function(data){// xhr.onreadystatechange = function()와 동일 
			$("#disp").empty();
		//	alert(data);
			var str = "<table><tr><td>직원번호</td><td>직원명</td><td>직급</td><td>부서명</td></tr>";
			//$("#disp").append(str_init);
		
			var i =0;
			$.each(data, function(kindex, value){ // ??
				str += "<tr>"
				str += "<td>" + value["jikwon_no"] + "</td>"
				str += "<td>" + value["jikwon_name"] + "</td>"
				str += "<td>" + value["jikwon_jik"] + "</td>"
				str += "<td>" + value["buser_name"] + "</td></tr>"
				//$("#disp").append(str);
				i++;
			});
			str += "</table><br> 인원수: " + i;
			
			$("#disp").append(str);
		}); 
	});
	
	$("#btnOne").click(function(){
		//alert("t클릭");
		$.getJSON("createJson.jsp?jik="+$("#jik").val(), null, function(data){// xhr.onreadystatechange = function()와 동일 
			$("#disp").empty();
		//	alert(data);
			var str = "<table><tr><td>직원번호</td><td>직원명</td><td>직급</td><td>부서명</td></tr>";
			//$("#disp").append(str_init);
		
			var i = 0 ;
			alert(data.length);
			$.each(data, function(kindex, value){ // ??
				str += "<tr>"
				str += "<td>" + value["jikwon_no"] + "</td>"
				str += "<td>" + value["jikwon_name"] + "</td>"
				str += "<td>" + value["jikwon_jik"] + "</td>"
				str += "<td>" + value["buser_name"] + "</td></tr>"
				//$("#disp").append(str);
				i++;
			});
			str += "</table><br> 인원수: " + i;
			$("#disp").append(str);
		}); 

	});
});