<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8");
	String name = "한국인";
	String age = "23";
	String re = "[";
	re += "{\"name\": \""+ name + "\""+
			",\"age\":" + age + "}";
			
	re += "]";
	out.print(re);
%>
