<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	<!-- //jstl var로 시작하는 속성에는 EL 사용하면 안된답니당 -->
	<!-- // var=${1000} 이렇게 하지 말란소리임 -->
	<!-- // value 에는 상관 없는듯. -->
	<c:set var="msg" value="1000" />
	${msg }<br>
	<c:set var="msg2" value="${msg + 4}" />
	${msg2 }<br>
	<c:set var="member" value="<%=new Member() %>" />
	<c:set target ="${member }" property="mem_name" value="배고빠힝"/>
	<c:set target ="${member }" property="mem_id" value="aro"/>
	<br>\${member.mem_id } = ${member.mem_id }
	<br>\${member.mem_name } = ${member.mem_name }
	${member.mem_phone = '040-203-0402';'' }
	<br>\${member.mem_phone} = ${member.mem_phone}
	<hr>
	<br><c:remove var="member"/>
	<br>1:${member.mem_name }
	<br>2:${member.mem_id }
	<br><hr>
	<br><c:set var="grade" value="76"/>
	<c:if test="${grade >= 90}"> 참 잘햇어영 </c:if>
	<c:if test="${grade gt 80 and grade lt 90}"> 잘햇어영 </c:if>
	<c:if test="${grade >= 70 && grade < 80}"> 못햇어영 </c:if>
	<c:if test="${grade < 70}"> 참 못햇어영 </c:if>
	<hr>
	<c:choose>
		<c:when test="${grade >= 90}">잘햇어~~</c:when>
		<c:when test="${grade gt 60 and grade lt 90}">응잘햇어~</c:when>
		<c:when test="${grade lt 50}">응 나가~</c:when>
		<c:otherwise> 점수잘못</c:otherwise>
	</c:choose>
	<br>
	<c:forEach var="i" begin="1" end="15" step="2">
		맘마주떼여 ~ ${i}
	</c:forEach>
	<hr>
	<c:set var="sum" value="0"/>
	<c:forEach var="i" begin="1" end="100" step="1">
		<c:set var="sum" value="${sum + i }"/>
	</c:forEach>
	
	1부터 100까지의 합 = ${sum }<br>
<hr>
<%
	List<Member> list = new ArrayList();
	list.add(new Member("aro","아로","123","0101010101","aro@ac.com",0));
	list.add(new Member("ayo","케로로","123","0101010101","ayo@ac.com",0));
	list.add(new Member("aci","헤헤","123","0101010101","zelo@ac.com",0));

	request.setAttribute("members",list);
%>
<ul>
	<c:forEach var="user" items="${members}">
		<li>${user.mem_id}= ${user.mem_name}</li>	
	</c:forEach>
</ul>
<ul>
	<c:forEach var="user" items="${members}" begin="0" varStatus="st">
		<c:if test="${st.first}"><hr style="border-color:red; border-style: dashed;"></c:if>
		<li>${st.count},${st.index},${st.first},${st.last},${st.current.mem_id},${user.mem_id}= ${user.mem_name}</li>	
		<c:if test="${st.last}"><hr style="border-color:blue; border-style: dashed;"></c:if>
	</c:forEach>
</ul>
	<br>
	<br>
	<br>
	<br>

</body>
</html>


















