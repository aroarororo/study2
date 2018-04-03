<%@page import="com.study.member.vo.Member"%>
<%@page import="com.study.member.service.MemberServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>타이틀을 입력하세요!!</title>
 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	 <script src=<%=request.getContextPath()%>/jquery/3.3.1/jquery.min.js"></script>
  </head>
<body>

<div class = "container">
	<div class = "page-header">
		<h1>회원 상세 정보</h1>
	</div>
<form action = "memberUpdate.jsp" method = "post">
<div class = "row">
<h3>회원 상세정보</h3>
</div>
<%

String mem_id = request.getParameter("mem_id");
MemberServiceImpl memberService = new MemberServiceImpl();
Member member = memberService.getMember(mem_id);

%>

<div>
<table class ="table table-striped">

	<tbody>
	<%
		if(member != null){
	%>

		<tr>
			<th>ID</th>
			<td>
				<%= member.getMem_id() %>
				<input type ="hidden" name = "mem_id" value = "<%= member.getMem_id() %>">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type ="text" name = "mem_name" value = "<%= member.getMem_name() %>"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type ="text" name = "mem_phone" value = "<%= member.getMem_phone() %>"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type ="text" name = "mem_email" value = "<%= member.getMem_email() %>"></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%= member.getReg_date() %></td>
		</tr>

	<%		
		}else {
	%>

			<tr>
				<td>해당  회원이 존재하지 않습니다.</td>
			</tr>

	<%
		}
	%>

	</tbody>
</table>

</div>

<div class = "row">
	<div class = "col-md-6 col-xs-4">
		<a href = "memberList.jsp" class = "btn btn-sm btn-warning">목록으로</a>
	</div>
	<div class = "col-md-6 text-right" class = "btn btn-sm btn-warning">
			<a href = "memberUpdate.jsp"><button type = "submit" class = "btn btn-sm btn-success">저장</button></a>
	</div>

</div>

</form>

</div>

</body>

</html>