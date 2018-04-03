boardInsert.jsp<%@page import="com.study.board.service.BoardServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); //없으면 한국말 깨져영 ㅠ
%>
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

<jsp:useBean id="board" class ="com.study.board.vo.Board"/>
<jsp:setProperty property="*" name="board"/>

<div class = "container">

<%
board.setBo_ip(request.getRemoteAddr());

BoardServiceImpl boardService = new BoardServiceImpl();
int cnt = boardService.insertBoard(board);

	if(cnt > 0) {
%>
		<div class = "row">
			완료, 축하합니다.
			<a href = "boardList.jsp"><button type = "submit" class = "btn btn-sm btn-success">목록</button></a>
		</div>	
<%		
	}else {

%>
		<div class = "row">
			실패!
			<a href = "boardList.jsp"><button type = "submit" class = "btn btn-sm btn-success">목록</button></a>
		</div>
<%
	}
%>
</div>
</body>
</html>