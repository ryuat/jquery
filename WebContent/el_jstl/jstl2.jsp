<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
* 반복문 (forEach) * <br>
<c:forEach var="cc" begin="1" end="10" step="1"><c:out value="${cc}"/></c:forEach>
<br>
<c:forEach var="num" begin="1" end="9">${3*num}<br></c:forEach>
<br>
<%
HashMap map = new HashMap();
map.put("name", "yoo");
map.put("today", new Date());
%>

<c:set var="arr" value="<%=new int[]{1,2,3,4,5}%>"/>
<c:set var="m" value="<%=map%>"/>
맵 컬렉션 출력: <br>
<c:forEach var="k" items="${m}">
	${k.key} ^^; ${k.value}<br>
</c:forEach>
<br>배열 출력:<br>
<c:forEach var="i" items="${arr}" begin="1" end="2">
	${i} <br>
</c:forEach>
<hr>
* 문자열 분할 * <br>
<c:forTokens var="ani" items="horse,cat,dog,pig,tiger" delims="," varStatus="num">
	${num.count})동물은 <c:out value="${ani}"/><br>
</c:forTokens>


<hr>
* 서식(format) * <br><br>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
숫자: <fmt:formatNumber value="12345.678" type="number"></fmt:formatNumber><br>
숫자+패턴: <fmt:formatNumber value="12345.678" type="number" pattern="#,##0.0"></fmt:formatNumber><br>
통화: <fmt:formatNumber value="12345.678" type="currency" currencySymbol="W"></fmt:formatNumber><br>

<br>
<c:set var="now" value="<%= new Date() %>"/>
<c:out value="${now}"/>

<br>
날짜: <fmt:formatDate value="${now}" type="date"/><br>
날짜: <fmt:formatDate value="${now}" type="time"/><br>
날짜: <fmt:formatDate value="${now}" type="both" pattern="yyyy/MM/dd hh:mm:ss"/><br>
</body>
</html>