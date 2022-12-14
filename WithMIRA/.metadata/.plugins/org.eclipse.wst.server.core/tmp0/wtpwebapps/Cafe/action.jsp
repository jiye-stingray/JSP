<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbCon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String orderno = request.getParameter("orderno");
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String menuno = request.getParameter("menuno");
	String amount = request.getParameter("amount");
	String orderdate = request.getParameter("orderdate");

	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt = null;

	String mode = request.getParameter("mode");

	try {

		String sql = "";
		switch (mode) {
		case "insert":
			sql = "insert into order_tbl values(?, ?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderno);
			pstmt.setString(2, custno);
			pstmt.setString(3, custname);
			pstmt.setString(4, menuno);
			pstmt.setString(5, amount);
			pstmt.setString(6, orderdate);

			pstmt.executeUpdate();
	%>
	<jsp:forward page="orderlist.jsp"></jsp:forward>
	<%
	break;
	case "modify":
		sql = "update order_tbl set custno = ?, custname = ?, menuno = ?, amount = ?, orderdate = ? where orderno = ?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, menuno);
		pstmt.setString(4, amount);
		pstmt.setString(5, orderdate);
		pstmt.setString(6, orderno);

		pstmt.executeUpdate();
	%>
	<jsp:forward page="orderlist.jsp"></jsp:forward>
	<%
	break;

	case "delete":
		sql = "delete from order_tbl where orderno = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, orderno);

		pstmt.executeUpdate();
	%>
	<jsp:forward page="orderlist.jsp"></jsp:forward>
	<%
	break;

	}

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>