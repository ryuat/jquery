<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(request.getParameter("name") == null){
	%>
		<jsp:forward page="el1.html"/>
	<%
}
%>
<br> 결과 출력 : <br>
jsp tag: <%= request.getParameter("name") %><br>
el : ${param.name} <!-- el 자바코드 호출 메서드가 수행 -->
</body>
</html>