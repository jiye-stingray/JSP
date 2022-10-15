<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "dbCon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<section style = "position: fixed; top: 80px; left: 0; width: 100%; height: 100%; background-color: lightgray; ">
<h2 style = "text-align: center; ">수강신청</h2>

<form name = "frm" method="post" action="action.jsp"
 style = "display: flex; text-align: center; align-items: center; justify-content: center;">

<table border = "1">
<tr>
	<td>수강일</td>
	<td>
		<input type = "text" name = "regist_month" >
		2022년 11일 13일 예)20221113 
	</td>
</tr>
<tr>
	<td>회원명</td>
	<td>
		<select name = "c_name" onchange="return Change_C_NO()">
			<option value = "10001">홍길동</option>
			<option value = "10002">장발장</option>
			<option value = "10003">임꺽정</option>
			<option value = "20004">성춘향</option>
			<option value = "20005">이몽룡</option>
		</select>
	</td>
</tr>

<tr>
<td>회원번호</td>
<td>
	<input name = "cNo" type = "text" readonly>
	예)10001
</td>
</tr>

<tr>
<td>강의장소</td>
<td>
	<select name = "class_area">
		<option>서울본원</option>
		<option>성남분원</option>
		<option>대전분원</option>
		<option>부산분원</option>
		<option>대구분원</option>
	</select>
</td>
</tr>

<tr>
<td>강의명</td>
<td>
	<select name = "className" onchange="return Change_class_name()">
		<option value = "100000">초급반</option>
		<option value = "200000">중급반</option>
		<option value = "300000">고급반</option>
		<option value = "400000">심화반</option>
	</select>
</td>
</tr>

<tr>
<td>수강료</td>
<td>
	<input name = "tuition" type = "text" readonly>
</td>
</tr>

<tr>
<td colspan="2">
	<input type = "submit" value = "수강신청" onclick="return JoinCheck()">
	<input type = "button" value = "다시쓰기" onclick="return Re()">
</td>
</tr>

</table>

</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>