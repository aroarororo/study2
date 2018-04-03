<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
	<%
		request.setCharacterEncoding("utf-8");	
	
		String mem_id = request.getParameter("mem_id");
		String mem_name = request.getParameter("mem_name");
	
		int updateCount = 0;
		
		
		Connection conn = null;
		Statement stmt= null;
		
		try{
			String jdbcDriver = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String dbUser = "java";
			String dbPass = "oracle";
			
			String query = "  update tb_member1 set mem_name = ' "+ mem_name +" 'where mem_id =  ' "+mem_id+" ' ";
				
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			stmt = conn.createStatement();
			
			updateCount = stmt.executeUpdate(query);
			
		}finally{
			if(stmt != null) try {stmt.close(); } catch(SQLException ex){}
			if(conn != null) try{ conn.close(); } catch(SQLException ex){}
		}
			
	%>

<% if (updateCount > 0){ %>
<%=mem_id %>의 이름을 <%=mem_name %>으로 변경
<% }else{ %>
<%=mem_id %>가 존재하지 않음
<% } %>

</body>
</html>