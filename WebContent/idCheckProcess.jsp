<%@page import="service.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <% 
   
   		String user_id = request.getParameter("user_id");
   
		UserDAO dao = new UserDAO() ; 
   		String result = dao.idCheck(user_id);
   		
   		if(result.equals("Duplicate")){
   			out.print("실패");
   			
   		}else{
   			out.print("아이디 사용 가능");
   		}
  
   
   %>
    
    







