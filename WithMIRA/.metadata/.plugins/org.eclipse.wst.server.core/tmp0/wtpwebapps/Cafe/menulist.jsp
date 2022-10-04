<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbCon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<section
		style="position: fixed; left: 0; width: 100%; height: 100%; top: 80px; background-color: lightgray">
		<h2 style="text-align: center;">카페메뉴</h2>

		<form name="frm"
			style="display: flex; text-align: center; justify-content: center; align-items: center">
			<table border="1">
				<tr>
					<td>메뉴번호</td>
					<td>메뉴이름</td>
					<td>가격</td>
					<td>칼로리</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				PreparedStatement pstmt = null;

				try {
					String sql = "select * from menu_tbl";
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();

					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%>원</td>
					<td><%=rs.getString(4)%></td>
				</tr>

				<%
				}

				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</table>
		</form>

	</section>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>