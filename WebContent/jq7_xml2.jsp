<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>
<persons>
	<person>
		<name><%=name %></name>
	</person>
</persons>