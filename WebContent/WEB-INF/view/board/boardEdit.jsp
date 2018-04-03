<%@page import="com.study.board.vo.Board"%>
<%@page import="com.study.board.service.BoardServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
<form action = "boardUpdate.do" method = "post">
<div class = "row">
<h3>회원 상세정보</h3>
</div>
<%-- <%
	BoardServiceImpl boardService = new BoardServiceImpl();
	String temp = request.getParameter("bo_no");
	int bo_no = Integer.parseInt(temp);
	Board board = boardService.getBoard(bo_no);
	request.setAttribute("board", board);
%> --%>

<div>
<table class ="table table-striped">

	<tbody>
		<c:if test="${board != null }">
		
		<tr>
			<th>글번호</th> <!-- 여기서 bo_no 안넘겨주면 파라미터 안넘어가면 not null에서 걸린당. 콘솔 확인할것 -->
			<td><input type ="hidden" name = "bo_no" value = "${board.bo_no }"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type ="text" name = "bo_title" value = "${board.bo_title }"> </td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type ="text" name = "bo_writer" value = "${board.bo_writer }"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type ="text" name = "bo_email" value = "${board.bo_email }"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><input type ="text" name = "bo_content" value = "${board.bo_content }"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type ="password" name = "bo_passwd" value = "${board.bo_passwd }"></td>
		</tr>
		<tr>
			<th>수정일</th>
			<td> ${board.bo_mod_date} </td>
		</tr>
		<tr>
			<th>아이피</th>
			<td> ${request.getRemoteAddr()} </td>
		</tr>
		<tr>
			<th>조회수</th>
			<td> ${board.bo_read_cnt} </td>
		</tr>
		<tr>
			<th>게시일</th>
			<td> ${board.bo_reg_date} </td>
		</tr>
		
	
	</c:if>
		<c:if test="${board == null }">
			<tr>
				<td>해당  글이 존재하지 않습니다.</td>
			</tr>
</c:if>

	</tbody>
</table>

</div>

<div class = "row">
	<div class = "col-md-6 col-xs-4">
		<a href = "boardList.do" class = "btn btn-sm btn-warning">목록으로</a>
	</div>
	<div class = "col-md-6 text-right" class = "btn btn-sm btn-warning">
			<a href = "boardUpdate.do"><button type = "submit" class = "btn btn-sm btn-success">저장</button></a>
	</div>

</div>

</form>

</div>

</body>

</html>