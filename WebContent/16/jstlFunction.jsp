<%@page import="com.study.member.vo.Member"%>
<%@page import="com.study.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	<c:set var="msg" value="Hello today is TGIF its a bit blue tho"/>
	<br>\${msg} = ${msg}
	<br>\${fn:length(msg)} = ${fn:length(msg)}
	<br>\${fn:toUpperCase(msg)} = ${fn:toUpperCase(msg)}
	<br>\${fn:toLowerCase(msg)} = ${fn:toLowerCase(msg)}
	<br>\${fn:contains(msg,"TGIF")} = ${fn:contains(msg,"TGIF")}
	
	<br> 
	<c:forEach items="${fn:split(msg,' ')}" varStatus="st">
		${st.count}, ${st.current} <br>
	</c:forEach>
	<c:set var="member" value='<%=new Member("pipi","pii","123","123","@@",10)%>'/>
	id = ${member.mem_id}
	id = ${member.getMem_id()}
	${member.setMem_id('Ayo')}
	id = ${member.mem_id}
	<br>
	<br>\${FileUtil.fancySize(14241245)} = ${FileUtil.fancySize(14241245)}
	
	<br>${greaterThan = (a,b) -> a > b ? true: false; '' }
	<br>${greaterThan(3,2) }
	<br>
	${factorial = (n) -> n==1 ? 1 : n *factorial(n-1);'' }
	<br>${factorial(4)}
	${fancy = (size) -> 	size < 1024 ? size += "Bytes" : (size < 10485760 ? size/1024 += "kb" : size / 10485760 +="Mb");''}
	<br>${fancy(123123) }
	<br>
	<c:set var="dan" value="8" />
	<ul>
	${gugu = (dan, i) -> dan += 'x' += i += "="+= dan*i ;'' }
	<c:forEach begin="1" end="9" var="i">
		<li> 
		${gugu(dan,i)}
		</li>
	</c:forEach>
	</ul>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>