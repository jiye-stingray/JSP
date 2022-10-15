<%@page import="java.sql.PreparedStatement"%>
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
<section style = "position: fixed; top: 80px; left: 0; width: 100%; height: 100%; background-color: lightgray; ">
<h2 style = "text-align: center; ">회원정보 조회 </h2>

<form style = "display: flex; text-align: center; align-items: center; justify-content: center;">
<table border = "1">
<tr>
<td>수강월</td>
<td>회원번호</td>
<td>회원명</td>
<td>강의명</td>
<td>강의장소</td>
<td>수강료</td>
<td>등급</td>
</tr>

<%

request.setCharacterEncoding("utf-8");
PreparedStatement pstmt = null;

try{
	
	
	String sql = "select c.regist_month, c.c_no, m.c_name, t.class_name, c.class_area, c.tuition, m.grade " +
			"from tbl_class_202201 c, tbl_member_202201 m, tbl_teacher_202201 t " + 
			"where c.c_no = m.c_no and c.teacher_code = t.teacher_code " +
			"order by c.c_no";
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
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
	
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