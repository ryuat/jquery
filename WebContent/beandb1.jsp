<%@page import="pack1.SangpumDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="test" class="pack1.ConnBean" scope="page" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>*상품자료(beans 사용)*</h2>
<table border="1">
  <tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>
  <%
  ArrayList<SangpumDto> list = test.getDatas();
  for(int i=0; i < list.size(); i++){
	  SangpumDto dto =(SangpumDto)list.get(i);
  %>
  <tr>
  	<td><%=dto.getCode() %></td>
  	<td><%=dto.getSang() %></td>
  	<td><%=dto.getSu() %></td>
  	<td><%=dto.getDan() %></td>
  </tr>
  <%
  }
  %>
</table>
<hr>
<table border="1">
  <tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>
  <%
  for(SangpumDto s:list){
  %>
  <tr>
  	<td><%=s.getCode() %></td>
  	<td><%=s.getSang() %></td>
  	<td><%=s.getSu() %></td>
  	<td><%=s.getDan() %></td>
  </tr>
  <%
  }
  %>
</table>

<hr>
jstl로 출력<br>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>

	<tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>
	<c:forEach var="s" items="<%=list%>">
	<tr>
		
		<td>${s.code}</td>
		<td>${s.sang}</td>
		<td>${s.su}</td>
		<td>${s.dan}</td>
	  </tr>
	 </c:forEach>
</table>
</body>
</html>






