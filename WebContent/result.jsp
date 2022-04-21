<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mine.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>


<h1>결과출력</h1>
	<%
		request.setCharacterEncoding("utf-8");
	
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
	%>
	
	<h2>입력받은 user_id 값 : <%= user_id %></h2>
	<h2>입력받은 user_pw 값 : <%= user_pw %></h2>














<script type="text/javascript" src="js/mine.js"></script>
</body>
</html>







