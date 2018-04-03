<%@page import="com.study.board.service.BoardServiceImpl"%>
<%@page import="com.study.board.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> 18 / boardList</title>

 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	 <script src=<%=request.getContextPath()%>/jquery/3.3.1/jquery.min.js"></script>
  </head>
<body>

<div class = "container">
	<div class = "page-header">
	<h1>게시글 목록</h1>
	</div>
	<div class="row">
	<!-- 검색 폼 -->
	<form action="" method="post">
		검색구분 : 	<select name="searchType">
						<option value="all">전체</option>
						<option value="bo_title">제목</option>
						<option value="bo_writer">글쓴이</option>
						<option value="bo_content">내용</option>
					</select>
		<input type="text" name="searchWord" value=${search.searchWord}>
		<button type="submit">검새꾸</button>			
	</form>
	</div>

	<div class = "col-md-6">
	<a href = "boardForm.jsp" class = "btn btn-sm btn-warning">글쓰기</a>
	</div>

	<div class = "row">
	${search.totalRowCount} / ${search.totalPageCount} <br>
	<table class ="table table-striped">
		<colgroup>
			<col style="width: 8%;" />
			<col style="width: 45%;" />
			<col style="width: 15%;" />
			<col style="width: 10%;" />
			<col style="width: 15%;" />
		</colgroup>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>게시일</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5">목록이 조회되지 않았습니당 ㅜㅜ </td>
			</tr>
		</c:if>
		<c:if test="${not empty list}"> <!-- 여기이프문 없어도 돌아간당 -->
			<c:forEach var="board" items="${list}" >
					<tr>
						<td>${board.bo_no}</td>
						<td>
						<a href = "boardView.jsp?bo_no=${board.bo_no}"> 
						${board.bo_title}</a></td>
						<td>${board.bo_writer}</td>
						<td>${board.bo_read_cnt}</td>
						<td>${board.bo_reg_date}</td>
					</tr>
			</c:forEach>
		</c:if>
		</tbody>
		</table>
	</div>
	<div style="text-align: center;">
		<div>
			<ul class="pagination">
				<c:if test="${ search.startPage>1}">
					<li>
						<a href="boardList.do?currentPage=${search.startPage -1 }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${search.startPage }" end="${search.endPage}">
					<c:if test="${i eq search.currentPage }">
						<li class="active"><a href="#"> ${i} </a></li>
					</c:if>
					<c:if test="${i ne search.currentPage }">
						<li><a href="boardList.do?currentPage=${i}"> ${i} </a></li>
					</c:if>
				</c:forEach>
				<c:if test="${search.endPage < search.totalPageCount }">
					<li>
						<a href="boardList.do?currentPage=${search.endPage +1 }" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>				
					</li>
				</c:if>
			
			</ul>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</div>
</body>
</html>

