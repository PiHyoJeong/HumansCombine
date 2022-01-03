<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Boolean connect = false;
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"Hotel","1234");
		connect = true;
	}catch(Exception e){
		connect = false;
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(connect == true){
%>
	연결 되었습니다.
<%} else{ %>
	연결에 실패했습니다.
<%} %>
</body>
</html>