<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- prefix는 사용자 임의로 정한다 -->
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
* 변수 연습 * 

<br>
<c:set var="name" value="홍길동" scope="page"/> <!-- scope: page < request < session < application -->
<c:out value="${name}"/>

<br>
<c:set var="ir">한국인</c:set>
<c:out value="${ir}"/>

<br>
<c:set var="aa" value="${header['User-Agent']}" scope="page"></c:set>
<c:out value="${aa}"/>

<br>
<c:remove var="aa" scope="page"/> <!-- 변수가 생성될 때의 scope와 일치해야 삭제된다. -->
삭제 후 aa 변수 값은 <c:out value="${aa}"/>

<br>
<c:set var="su1" value="10"/>
<c:set var="su2">3.5</c:set>
su1 + su2 = ${su1} + ${su2} = ${su1+su2}

<br>
<p>조건문</p>
<c:set var="bb" value="${'star'}"/>
<c:if test="${bb == 'star'}">star true</c:if> <!-- test:비교대상, '==' = 'eq' -->
<c:if test="${bb != null}">null false</c:if> <!-- test:비교대상, '==' = 'eq' -->

<br>
<p> else 대신 choose문 사용 </p>
<c:choose>
	<c:when test="${bb eq 'moon'}">달</c:when>
	<c:when test="${bb eq 'star'}"><c:out value="${bb}"/></c:when>
	<c:otherwise>해당없음</c:otherwise>
</c:choose>

<br>
<c:choose>
	<c:when test="${empty param.msg}">
		<form>
			입력: <input type="text" name="msg">
				  <input type="submit" value="확인">
		</form>
	</c:when>
	<c:when test="${param.msg == 'admin'}">
			관리자
	</c:when>
	<c:otherwise>
		환영합니다. 일반회원 <c:out value="${param.msg}"/>
	</c:otherwise>
</c:choose>
</body>
</html>