<?xml version="1.0" encoding="UTF-8"?>

<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<jikwons> <%
	request.setCharacterEncoding("utf-8");
	String buser = request.getParameter("buser");
	System.out.println(buser);
	Connection conn = null;
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	try {
 		Class.forName("oracle.jdbc.driver.OracleDriver");
 		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
 	} catch (Exception ex) {
 		System.out.println("연결 오류 : " + ex.getMessage());
 		return;
 	}
 	try {
 		pstmt = conn.prepareStatement("select jikwon_no, jikwon_name, buser_num from jikwon j, buser b where b.buser_name = ? and j.buser_num = b.buser_no");
 		pstmt.setString(1,buser);
 		rs = pstmt.executeQuery();
 		while (rs.next()) {
 %> <jikwon> <jikwon_no><%=rs.getString("jikwon_no")%></jikwon_no> <jikwon_name><%=rs.getString("jikwon_name")%></jikwon_name>
<buser_num><%=rs.getString("buser_num")%></buser_num> </jikwon>
<%
	}
	} catch (Exception e) {
		System.out.println("처리 오류 : " + e.getMessage());
		return;
	}
%> </jikwons>