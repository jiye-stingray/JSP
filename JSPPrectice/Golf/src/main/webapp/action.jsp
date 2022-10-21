<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbCon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String regist_monsth = request.getParameter("regist_month").substring(0,6);
	String c_no = request.getParameter("cNo");
	String class_area = request.getParameter("class_area");
	String tuition = request.getParameter("tuition");
	String teacher_code = "";
	
	String class_price = request.getParameter("className");
	
	PreparedStatement pstmt = null;
	
	try{
		
		
		String sql = "select teacher_code from tbl_teacher_202201 where class_price ="+ class_price;
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		teacher_code = rs.getString(1); 

		

	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	pstmt = null;
	
	try{
		
		String sql = "insert into tbl_class_202201 values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, regist_monsth);
		pstmt.setString(2, c_no);
		pstmt.setString(3, class_area);
		pstmt.setString(4, tuition);
		pstmt.setString(5,teacher_code);
		
		pstmt.executeUpdate();
		%>
			<jsp:include page="memberList.jsp"></jsp:include>
		<% 

	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	
%>
</body>
</html>