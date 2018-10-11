<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8"%>
[
<%
	String jik = request.getParameter("jik");

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
		if(jik == null){
			pstmt = conn.prepareStatement("select jikwon_no, jikwon_name, jikwon_jik, buser_name from jikwon j, buser b where j.buser_num = b.buser_no");		
		}else{
			pstmt = conn.prepareStatement("select jikwon_no, jikwon_name, jikwon_jik, buser_name from jikwon j, buser b where j.buser_num = b.buser_no and j.jikwon_jik = ?");
			pstmt.setString(1,jik);
		}
		rs = pstmt.executeQuery();
		while (rs.next()) {
			result += "{";
			result += "\"jikwon_no\":" + "\"" + rs.getString("jikwon_no") + "\",";
			result += "\"jikwon_name\":" + "\"" + rs.getString("jikwon_name") + "\",";
			result += "\"jikwon_jik\":" + "\"" + rs.getString("jikwon_jik") + "\",";
			result += "\"buser_name\":" + "\"" + rs.getString("buser_name") + "\"";
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