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
	<a href="<%=request.getContextPath()%>/15/memberList.jsp">회원목록</a><br>
	<a href="${pageContext.request.contextPath}/15/memberList.jsp">회원목록</a><br>
	<a href='<c:url value="/15/memberList.jsp"/>'>회원목록</a>

	<img alt="" src="/image/1.png" width="200px"><br>
	<img alt="" src="<c:url value="/image/1.png"/>" width="200px"><br>
	<a href="study/common/download.do?id" class="btn btn-sm btn-primary">
	<span class="glyphicon glyphicon-floppy-disk"> Download  </span>
	</a> <br>
	
	<c:url var="downUrl" value="/common/download.do">
		<c:param name="id" value="234"/>
		<c:param name="path" value="board"/>
	</c:url>

	<a href="${downUrl}" class="btn btn-sm btn-primary">
	<span class="glyphicon glyphicon-floppy-disk"> Download  </span>
	</a> <br>
</body>
</html>