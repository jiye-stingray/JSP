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
<h2 style ="text-align: center;">카페메뉴 수정하기</h2>

<form name="frm" method = "post"; action="action.jsp" style ="display: flex; justify-content: center; text-align: center; align-items: center;">
<table border="1">

<input type="hidden" name="mode" value="modify">
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt = null;
	
	String orderno = request.getParameter("orderno");
	String custno = "";
	String custname = "";
	String menuno = "";
	String amount = "";
	String orderdate = "";
	
	
	try{
		
		String sql = "select * from order_tbl where orderno = " + orderno;
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		orderno = rs.getString(1);
		custno = rs.getString(2);
		custname = rs.getString(3);
		menuno = rs.getString(4);
		amount = rs.getString(5);
		orderdate = rs.getString(6);
		
	}
	catch(Exception e){
		e.printStackTrace();
	}

%>

<tr>
	<td>주문번호</td>
	<td><input type = "text" name = "orderno" value = "<%=orderno %>" readonly></td>
</tr>
<tr>
	<td>고객번호</td>
	<td><input type ="text" name="custno" value = "<%=custno%>"></td>
</tr>
<tr>	
	<td>고객이름</td>
	<td><input type="text" name="custname" value = "<%=custname%>"></td>
</tr>
<tr>
	<td>메뉴번호</td>
	<td>
	<input type="radio" value="10001" name="menuno" <%if(menuno.equals("10001")) out.println("checked");%>> 아메리카노 &nbsp;
	<input type="radio" value="10002" name="menuno" <%if(menuno.equals("10002")) out.println("checked"); %>> 카페라떼 &nbsp;
	<input type="radio" value="10003" name="menuno" <%if(menuno.equals("10003")) out.println("checked"); %>> 카페모카 &nbsp;
	<input type="radio" value="10004" name="menuno" <%if(menuno.equals("10004")) out.println("checked"); %>> 돌체라때 &nbsp;
	<input type="radio" value="10005" name="menuno" <%if(menuno.equals("10005")) out.println("checked"); %>> 콜드브루 &nbsp;
	</td>
</tr>
<tr>
	<td>수량</td>
	<td>
	<select name = "amount">
	<option value = "1" <%if(amount.equals("1")) out.println("selected"); %>>1개(추가 주문 시 선택)</option>
	<option value = "2" <%if(amount.equals("2")) out.println("selected"); %>>2개</option>
	<option value = "3" <%if(amount.equals("3")) out.println("selected"); %>>3개</option>
	<option value = "4" <%if(amount.equals("4")) out.println("selected"); %>>4개</option>
	<option value = "5" <%if(amount.equals("5")) out.println("selected"); %>>5개</option>
	<option value = "6" <%if(amount.equals("6")) out.println("selected"); %>>6개</option>
	<option value = "7" <%if(amount.equals("7")) out.println("selected"); %>>7개</option>
	<option value = "8" <%if(amount.equals("8")) out.println("selected"); %>>8개</option>
	<option value = "9" <%if(amount.equals("9")) out.println("selected"); %>>9개</option>
	<option value = "10" <%if(amount.equals("10")) out.println("selected"); %>>10개</option>
	</select>
	</td>
</tr>
<tr>
	<td>주문일자</td>
	<td><input type = "text" name="orderdate" placeholder="예)20220105" value=<%=orderdate.substring(0,4) + orderdate.substring(5,7) + orderdate.substring(8,10) %>></td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="수정하기" onclick="return modify()"> 
<input type="button" value="취소" onclick="return search()">
</td>
</tr>

</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>