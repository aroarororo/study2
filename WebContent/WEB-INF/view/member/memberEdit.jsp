<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="ko">
<fmt:setLocale value="en"/>
<fmt:bundle basename="resource.message">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>타이틀을 입력하세요!!</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src=<%=request.getContextPath()%>/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1><fmt:message key="MEMBER.TITLE"/></h1>
		</div>
		<form action="memberUpdate.do" method="post">
			<div class="row">
				<h3><fmt:message key="MEMBER.TITLE"/></h3>
			</div>


			<div>
				<table class="table table-striped">

					<tbody>
					<tbody>
						<c:if test="${member != null }">
							<tr>
								<th><fmt:message key="MEMBER.ID"/></th>
								<td>${member.mem_id} <input type="hidden" name="mem_id"
									value="${member.mem_id}">
								</td>
							</tr>
							<tr>
								<th><fmt:message key="MEMBER.NAME"/></th>
								<td><input type="text" name="mem_name"
									value="${member.mem_name}"></td>
							</tr>
							<tr>
								<th><fmt:message key="MEMBER.PASSWD"/></th>
								<td><input type="text" name="mem_pwd"
									value="${member.mem_pwd}"></td>
							</tr>
							<tr>
								<th><fmt:message key="MEMBER.PHONE"/></th>
								<td><input type="text" name="mem_phone"
									value="${member.mem_phone}"></td>
							</tr>
							<tr>
								<th><fmt:message key="MEMBER.EMAIL"/></th>
								<td><input type="text" name="mem_email"
									value="${member.mem_email}"></td>
							</tr>
							<tr>
								<th>가입일</th>
								<td>${member.reg_date}</td>
							</tr>
						</c:if>
						<c:if test="${member == null }">
							<tr>
								<td><fmt:message key="MEMBER.NOTFOUND"/></td>
							</tr>

						</c:if>

					</tbody>
				</table>

			</div>

			<div class="row">
				<div class="col-md-6 col-xs-4">
					<a href="memberList.do" class="btn btn-sm btn-warning"><fmt:message key="MEMBER.LIST"/></a>
				</div>
				<div class="col-md-6 text-right" class="btn btn-sm btn-warning">
					<a href="memberUpdate.do"><button type="submit"
							class="btn btn-sm btn-success">저장</button></a>
				</div>

			</div>

		</form>

	</div>

</body>
</fmt:bundle>
</html>