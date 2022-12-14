<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="dbCon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section style = "position: fixed; left: 0; width:100%; height: 100%; top:80px; background-color: lightgray" >
<h2 style ="text-align: center;">카페 매출 조회 프로그램</h2>
<form style = "display: flex; text-align: center; align-items: center; justify-content: center;">
	<table border = "1">
		<tr>
			<td>메뉴번호</td>
			<td>메뉴이름</td>
			<td>주문량</td>
			<td>합계</td>
		</tr>
		<%
		
			request.setCharacterEncoding("utf-8");
			PreparedStatement pstmt = null;
			
			try{
				String sql = "select m.menuno, m.menuname, sum(o.amount), sum(o.amount * m.price) " +
						"from menu_tbl m, order_tbl o " +
						"where m.menuno = o.menuno " +
						"group by m.menuno, m.menuname " +
						"order by m.menuno asc";

				pstmt = conn.prepareStatement(sql);
				
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					%>
						<tr>
							<td><%=rs.getString(1) %></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4) %></td>
						</tr>
					<%
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		
		%>
	
	</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>