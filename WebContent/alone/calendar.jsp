<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! public int multiply(int a, int b){
	int c= a*b;
	return c;
	
} %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
java.util.Calendar cal = java.util.Calendar.getInstance();
%>
오늘은
<%= cal.get(java.util.Calendar.YEAR) %>년 
<%= cal.get(java.util.Calendar.MONTH) + 1 %>월 
<%= cal.get(java.util.Calendar.DATE) %>일 
<br>

<%
int sum=0;
for(int i=0;i<=10; i++){
	sum = sum +i;
}
%>

sum from 1 to 10 equals to <%= sum %>
<br>

10 * 25 = <%= multiply(10,25) %>
</body>
</html>