<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/JSPBegin/css/mine.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>

<% 
	if(session.getAttribute("user_id") != null) {
		
%>

<%= session.getAttribute("user_id") %> 님 환영합니다. 
<a href="logout.jsp">로그아웃</a>

<h1>jsp로만 이루어진 기능</h1>
	<table border = "1">
		<tr>
			<td>번호</td>
			<td>기능</td>		
		</tr>
		 <tr>
			<td>1</td>
			<td><a href="login.jsp">로그인하러가기</a></td>		
		</tr> 
		<tr>
			<td>2</td>
			<td><a href="userRegist.jsp">회원가입하러가기</a></td>		
		</tr>
		
		<tr>
			<td>3</td>
			<td><a href="board.jsp">게시판으로가기</a></td>		
		</tr>
		
	
	</table>
	
	
	<% 
		}else {
	%>

<h1>jsp로만 이루어진 기능</h1>
	<table border = "1">
		<tr>
			<td>번호</td>
			<td>기능</td>		
		</tr>
		 <tr>
			<td>1</td>
			<td><a href="login.jsp">로그인하러가기</a></td>		
		</tr> 
		<tr>
			<td>2</td>
			<td><a href="userRegist.jsp">회원가입하러가기</a></td>		
		</tr>
		
		<tr>
			<td>3</td>
			<td><a href="board.jsp">게시판으로가기</a></td>		
		</tr>
		
	
	</table>
	
	
	<% } %>





<script type="text/javascript" src="js/mine.js"></script>
</body>
</html>







