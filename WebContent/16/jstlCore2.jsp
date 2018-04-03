<%@page import="com.study.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
	
<c:set var="msg"> 나리, 누리, 웅, 마리, 여신, 늘이, 뭄무미  </c:set>

<c:set var="msg2">
	<h4>어제 술을 많이  먹어서 조금 전에 읽어났습니다.</h4>
	<b style="color:blue;font-size:130%">영진이 아빠 화이팅</b>
	<script> alert("불금임");</script>
</c:set>

	<pre>
	${msg}
	
	<c:forTokens var="m" items="${msg}" delims="," varStatus="st">
		${st.count},	${m} 
	</c:forTokens>

<!--  
${msg2}하면 html태그들이 실제로 alert, href`` 작동해
근데 c:out하면 태그들까지 포함해서 보여줘. 실행하지않아
 -->

	<c:out value="${msg2}" escapeXml="true"/>
	
	msg3=<c:out value="${msg3}" default="N/Aro" />


<c:set var="member" value='<%=new Member("aro1","aro2","345","6","7",10)%>' />


<c:catch var="ex">
${member.mem_name}
${member.mem_pwd}
${member.mem_id}
</c:catch>
	</pre>
	
<c:if test="${not empty ex}">
예외발생 : ${ex.message }
</c:if>
</body>
</html>