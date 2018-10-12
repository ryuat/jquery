<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8"%>
[
<%
	String name = request.getParameter("name");
	System.out.println(name);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String result = "";
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
	} catch (Exception e) {
		System.out.println("연결 오류:" + e.getMessage());
		return;
	}
	try {
		pstmt = conn.prepareStatement("select gogek_name, gogek_tel from gogek g, jikwon j where j.jikwon_no = g.gogek_damsano and j.jikwon_name =?");
		pstmt.setString(1,name);
		
		rs = pstmt.executeQuery();
		while (rs.next()) {
			result += "{";
			result += "\"gogek_name\":" + "\"" + rs.getString("gogek_name") + "\",";
			result += "\"gogek_tel\":" + "\"" + rs.getString("gogek_tel") + "\"";
			result += "},";
		}
		if (result.length() > 0) {
			result = result.substring(0, result.length() - 1);
		}
		out.print(result);
	} catch (Exception e) {
		System.out.println("처리 오류:" + e.getMessage());
	}
%>
]