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
<h2 style = "text-align: center; ">골프연습 </h2>

<form style = "display: flex; text-align: center; align-items: center; justify-content: center;">
<table border = "1">
<tr>
<td>강사코드</td>
<td>강사명</td>
<td>강의명</td>
<td>수강료</td>
<td>강사자격취득일</td>
</tr>


<%

request.setCharacterEncoding("utf-8");
PreparedStatement pstmt = null;

try{
	
	
	String sql = "select * from TBL_TEACHER_202201";
	pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){
		%>
			<tr>
			<td><%=rs.getString(1) %></td>
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