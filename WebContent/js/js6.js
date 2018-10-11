$(document).ready(function(){
	//1. html을 text형태로 읽기
	$("#test1").click(function(){
		$("#disp").load("a.html") // ajax
	});
	$("#test2").click(function(){
		$.getJSON("jq6b.json", null, function(data){// xhr.onreadystatechange = function()와 동일 
			$("#disp").empty();
		//	alert(data);
			$.each(data, function(kindex, value){ // ??
				//alert(kindex + " " + value);
				var str = "<ol>";
				str += "<li>" + value["title"] + "</li>"
				str += "<li>" + value["desc"] + "</li>"
				str += "<li>" + value["author"] + "</li>"
				str += "</ol>";
				$("#disp").append(str);
			});
		}); 
		
	});
	$("#test3").click(function(){
		$.getJSON("jq6c.jsp", null, function(data){// xhr.onreadystatechange = function()와 동일 
			$("#disp").empty();
		//	alert(data);
			var items = [];

			$.each(data, function(kindex, value){ // ??
				//alert(kindex + " " + value);
				var str = "<ol>";
				str += "<li>" + value["code"] + "</li>"
				str += "<li>" + value["sang"] + "</li>"
				str += "<li>" + value["su"] + "</li>"
				str += "<li>" + value["dan"] + "</li>"
				str += "</ol>";
				
				//$("#disp").append(str);
				items.push(str); // 윗 코드와 동일
			});
			$("<b/>",{html:items}).appendTo("#disp"); // ??
		}); 
	});
	
	$("#test4").click(function(){
		$.get("jq6d.xml", function(data){
			//alert(data);
			//alert($(data).find("aa").size());
			$("#disp").empty();
			$(data).find("aa").each(function(){ // aa 태그 찾아 순회
				var fdata = $(this); // aa tag object
				var str = "<div>";
				str += fdata.attr("part") + " " + fdata.attr("term");
				str += " - ";
				str += fdata.find("desc").text();
				str += "</div>";
				$("#disp").append(str);
			});
		});
	});
	
	$("#test5").click(function(){
		$.get("jq6e.jsp", function(data){
			//alert(data);
			$("#disp").empty();
			$(data).find("sangpum").each(function(){  // sangpum 배열 순회
				var sangpum = $(this); // this : sangpum tag object
				var str = "<div>";
				str += sangpum.find("code").text() + "&nbsp;";
				str += sangpum.find("sang").text() + "&nbsp;";
				str += sangpum.find("su").text() + "&nbsp;";
				str += sangpum.find("dan").text() + "&nbsp;";
				str += "</div>";
				$("#disp").append(str);
			});
			//$("#disp").empty();
			$(data).find("aa").each(function(){ // aa 태그 찾아 순회
				var fdata = $(this); // aa tag object
				var str = "<div>";
				str += fdata.attr("part") + " " + fdata.attr("term");
				str += " - ";
				str += fdata.find("desc").text();
				str += "</div>";
				$("#disp").append(str);
			});
		});
	});
});