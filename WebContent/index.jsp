<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index.jsp</title>
<style>
#header{}
#left{width:20%;float:left;}
#contents{width:80%; float:left;}
#footer{clear:both;}

</style>
</head>
<body>
<div>
		<div id="header">
			<!-- 메뉴영역 Start -->
			<jsp:include page="/include/top.jsp" flush="false" />
			<!-- 메뉴영역 END -->
		</div>
		<div>
			<div id="left">
				<!-- 좌측영역 Start -->
				<jsp:include page="/include/left.jsp" flush="false" />
				<!-- 좌측영역 END -->
			</div>
			<div id="contents">
				<!-- 본문 Start -->
				아러 여신 아러 개여신 아러짱짱걸
				<!-- 본문 END -->

			</div>
		</div>
		<div id="footer">
			<!-- 푸터 Start -->
			<jsp:include page="/include/footer.jsp" flush="false" />
			<!-- 푸터 END -->

		</div>
</div>



</body>
</html>