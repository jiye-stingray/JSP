<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbCon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section style = "position: fixed; left: 0; width:100%; height: 100%; top:80px; background-color: lightgray" >
<h2 style ="text-align: center;">GSM 카페에 오신 걸 환영합니다</h2>
<form name = "frm2" 
	style = "display: flex; justify-content:center; text-align: center; align-items: center" >
	<table border = 1 style = "border-collapse: collapse">
	<tr>
	<td colspan="9" style = "text-align: right; border-left: hidden; border-top:hidden; border-right:hidden"><a href="order.jsp">주문하기</a></td>
	</tr>
		<tr>
			<td>주문번호</td>
			<td>고객번호</td>
			<td>고객이름</td>
			<td>메뉴이름</td>
			<td>수량</td>
			<td>지불금액</td>
			<td>주문일자</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		
		<%
			request.setCharacterEncoding("UTF-8");
			PreparedStatement pstmt = null;
			
			try{
				String sql = "select o.orderno, o.custno, o.custname, m.menuname, o.amount, (o.amount * m.price), o.orderdate "+
						"from menu_tbl m, order_tbl o "+
						"where m.menuno = o.menuno order by o.orderno";
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
				
				%>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %>원</td>
						<td><%=rs.getString(7).substring(0,4) + rs.getString(7).substring(5,7) + rs.getString(7).substring(8,10) %></td>
						<td><a href = "modify.jsp?orderno=<%=rs.getString(1)%>">주문 수정</a></td>
						<td><a href = "action.jsp?orderno=<%=rs.getString(1)%>&mode=delete">주문 삭제</a></td>
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