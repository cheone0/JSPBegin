<%@page import="model.BoardDTO"%>
<%@page import="service.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	String bNo = request.getParameter("bNo");

	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.boardSelectOne(bNo);

%>

	<h1>글 상세보기</h1>
	<input type="hidden" value="<%=dto.getbNo()%>">
	
	<h3>글 제목:
		<span><%=dto.getbTitle()%></span>
	</h3>
	
	<h3>글 내용:
		<span><%=dto.getbContent() %></span>
	</h3>
	
	<h3>작성자:
		<span><%=dto.getbWriter() %></span>
	</h3>
	
	<h3>작성일:		<span><%=dto.getbRegDate() %></span>
	</h3>
	
	<a href="modifyBoard.jsp?bNo=<%=dto.getbNo()%>">수정</a> 
	&emsp; <a href="deleteProcess.jsp?bNo=<%=dto.getbNo()%>">삭제</a>
	&emsp;<a href="board.jsp">글목록으로</a>
</body>
</html>