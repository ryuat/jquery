<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	String re = "[";
	re += "{\"name\": \""+ name + "\""+
			",\"age\":" + age + "}";
			
	re += "]";
	out.print(re);
%>
