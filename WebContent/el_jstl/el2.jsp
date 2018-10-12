<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
EL test : 연산자, 내장객체<br>
\${3+4} => ${3+4}<br>
\${5/4} => ${5/4}, ${5 div 4}<br> <!-- eclipse는 몰라서 빨간색 밑줄 생김 -->
\${5/0} => ${5/0}<br>
\${5%3} => ${5%3}, ${5 mod 3}<br>
\${5>4} => ${5>4}, ${5 gt 4}<br>
\${3<=4} => ${3<=4}, ${3 le 4}<br>
\${5<4 and 3<=4} => ${5<4 and 3<=4}<br>
\${5>4 or 3<=4} => ${5>4 or 3<=4}<br>
\${5 > 4 ? 10:20 } => ${5 > 4 ? 10:20 }
<hr>
<p> -- 내장객체(EL) -- </p>
<%
request.setAttribute("aa", "air"); 
session.setAttribute("bb", "book"); 
application.setAttribute("cc", "cat"); 
%>
<%= request.getAttribute("aa") %> ${requestScope.aa} <br>
<%= session.getAttribute("bb") %> ${sessionScope.bb} <br>
<%= application.getAttribute("cc") %> ${applicationScope.cc} <br>

<br>
jsp:<%=request.getHeader("host")%> <br>
el : ${header.host} ${header["host"]}
<br>
<%
ArrayList list = new ArrayList();
list.add("kor");
list.add("eng");
request.setAttribute("list",list);
%>
${requestScope.list[0]} ${requestScope.list[1]}
${list[0]}  ${list[1]} 

<p>--client의 값 얻기--</p>
<a href="el2.html">el2.html</a><br>
이름: ${param.name}, ${param["name"]} <br>
성격1: ${paramValues.sung[0]}
성격2: ${paramValues.sung[1]} 
</body>
</html>