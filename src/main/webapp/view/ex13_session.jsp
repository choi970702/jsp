<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
	<% 
		pageContext.setAttribute("name", "홍길동");
		pageContext.setAttribute("age", 24);
		
		request.setAttribute("name", "둘리");
		request.setAttribute("age", 32);
		
		session.setAttribute("name", "마루치");
		session.setAttribute("age", 18);
	%>
		
	<h2> 이름 : <%=pageContext.getAttribute("name") %></h2>
	<h2> 나이 : <%=pageContext.getAttribute("age") %></h2>
	<hr>
	
	<h2> 이름 : <%=request.getAttribute("name") %></h2>
	<h2> 나이 : <%=request.getAttribute("age") %></h2>
	<hr>
	
	<h2> 이름 : <%=session.getAttribute("name") %></h2>
	<h2> 나이 : <%=session.getAttribute("age") %></h2>
	<hr>
	
	<%-- 
		ex14_result.jsp로 이동하자. 
		이동 방법은 redirect, forward 이다.
		pageContext는 페이지를 벗어나서 사라진다.
		request는 리다이렉트를 하면 정보가 사라니고, 포워드를 하면 사라지지 않음
		session은 리다이렉트, 포워드를 해도 둘다 정보가 사라지지 않는다.
	--%>
	<%--<%response.sendRedirect("ex14_result.jsp"); --%>
	 <%request.getRequestDispatcher("ex14_result.jsp").forward(request, response); %>
	
	
	
	
	
	
	
	
</body>
</html>













