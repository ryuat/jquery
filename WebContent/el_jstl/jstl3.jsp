<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
* JSTL로 DB 자료 읽기 * <br>
<c:catch>
<sql:setDataSource var="ds" 
				   url="jdbc:mysql://localhost:3306/test"
				   driver="org.mariadb.jdbc.Driver"
				   user="root"
				   password="123"
				   />
<sql:query var="rs" dataSource="${ds}">
	select * from sangdata where code >= ? and code <= ?
	<sql:param value="7"/>
	<sql:param value="9"/>
</sql:query>


	<table border="1">
	<tr>
		<th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>
		<c:forEach var="s" items="${rs.rows }">
			<tr>
				<td>${s.code}</td>
				<td>${s.sang}</td>
				<td>${s.su}</td>
				<td>${s.dan}</td>
			</tr>
		</c:forEach>
	</table>
</c:catch>
<c:if test="${err != null}">
	에러발생: ${err.message}
</c:if>

</body>
</html>