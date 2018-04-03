<%@page import="com.study.member.vo.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.study.member.service.MemberServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> 15 / memberList</title>

 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	 <script src=<%=request.getContextPath()%>/jquery/3.3.1/jquery.min.js"></script>
  </head>
<body>

<div class = "container">
	<div class = "page-header">
	<h1>회원목록</h1>
	</div>
	<div class = "col-md-6">
	<a href = "memberForm.jsp" class = "btn btn-sm btn-warning">회원가입</a>
	</div>
<%
	MemberServiceImpl memberService = new MemberServiceImpl();

//	List<Member> list = memberService.getMemberList();
//	request.setAttribute("member",list);
%>
	<div class = "row">
	<table class ="table table-striped">

		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty member}">
			<tr>
				<td colspan="5">목록이 조회되지 않았습니당 ㅜㅜ </td>
			</tr>
		</c:if>
		<c:if test="${not empty member}"> <!-- 여기이프문 없어도 돌아간당 -->
			<c:forEach var="member" items="${member}" >
					<tr>
						<td>${member.mem_id}</td>
						<td>
						<a href = "memberView.jsp?mem_id=${member.mem_id}"> 
						${member.mem_name}
						</a>
						</td>
						<td>${member.mem_phone}</td>
						<td>${member.mem_email}</td>
						<td>${member.reg_date}</td>
					</tr>
			</c:forEach>
		</c:if>
		</tbody>
		</table>
	</div>
</div>
</body>
</html>

