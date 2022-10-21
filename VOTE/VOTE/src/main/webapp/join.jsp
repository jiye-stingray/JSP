<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style = "position: fixed; top:80px; left: 0; width: 100%; height: 100%;
background-color: lightgray;">

<h2 style = "text-align: center;">과정평가형 CBQ</h2>

<form style = "display: flex; justify-content: center; text-align: center; " method="post" action="action.jsp">
<table border="1">
<tr>
	<td>수강월</td>
	<td><input type = "text" name = "regist_month"></td>
</tr>
<tr>
	<td>회원명</td>
	<td> 
	<select>
		<option>홍길동</option>
		<option>장발장</option>
		<option>임꺽정</option>
		<option>성춘향</option>
		<option>이몽룡</option>
		
	</select> 
	</td>
</tr>

<tr>
	<td>회원번호</td>
	<td></td>
</tr>

<tr>
	<td>회원번호</td>
</tr>

</table>
</form>

</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>