<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbCon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src = "check1.js"></script>
<section style = "position: fixed; left: 0; width:100%; height: 100%; top:80px; background-color: lightgray" >
<h2 style ="text-align: center;">카페메뉴 주문하기</h2>

<form name="orderfrm1" method="post" action="action.jsp" style ="display: flex; justify-content: center; text-align: center; align-items: center;">
<table border="1">
<input type="hidden" name="mode" value="insert">
<tr>
	<td>주문번호</td>
	<%
		request.setCharacterEncoding("utf-8");
		PreparedStatement pstmt = null;
		String orderno = "";
		
		try{
			String sql = "select max(orderno) + 1 from order_tbl";
			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			orderno = rs.getString(1);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	%>
	<td><input type = "text" value = "<%=orderno%>" name = "orderno" readonly></td>
</tr>
<tr>
	<td>고객번호</td>
	<td><input type ="text" name="custno"></td>
</tr>
<tr>	
	<td>고객이름</td>
	<td><input type="text" name="custname"></td>
</tr>
<tr>
	<td>메뉴번호</td>
	<td>
	<input type="radio" value="10001" name="menuno"> 아메리카노 &nbsp;
	<input type="radio" value="10002" name="menuno"> 카페라떼 &nbsp;
	<input type="radio" value="10003" name="menuno"> 카페모카 &nbsp;
	<input type="radio" value="10004" name="menuno"> 돌체라때 &nbsp;
	<input type="radio" value="10005" name="menuno"> 콜드브루 &nbsp;
	</td>
</tr>
<tr>
	<td>수량</td>
	<td>
	<select name = "amount">
	<option value = "1">1개(추가 주문 시 선택)</option>
	<option value = "2" >2개</option>
	<option value = "3" >3개</option>
	<option value = "4" >4개</option>
	<option value = "5" >5개</option>
	<option value = "6" >6개</option>
	<option value = "7" >7개</option>
	<option value = "8" >8개</option>
	<option value = "9" >9개</option>
	<option value = "10">10개</option>
	</select>
	</td>
</tr>
<tr>
	<td>주문일자</td>
	<td><input type = "text" name="orderdate" placeholder="예)20220105"></td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="주문하기" onclick="return jo_check()"> 
<input type="reset" value="다시하기" onclick="return re()">
</td>
</tr>

</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>