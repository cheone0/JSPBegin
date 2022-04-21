<%@page import="service.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <% 
   
   String user_id = request.getParameter("user_id");
   String user_pw = request.getParameter("user_pw");   
   
   	UserDAO dao = new UserDAO(); 
   String loginResult =  dao.userInsert(user_id, user_pw);
   
   if(loginResult.equals("success")){
	   response.sendRedirect("index.jsp");
   }else{
	   response.sendRedirect("loginfail.jsp");
   }
   
   %>
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mine.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>

<script type="text/javascript" src="js/mine.js"></script>

</body>
</html>







