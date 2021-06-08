<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더 정보 보기</title>
</head>
<body>
	<h2>헤더 정보 보기</h2>
	<h3>
		<% 
			Enumeration e_numm = request.getHeaderNames();
			while(e_numm.hasMoreElements()) // 다음 요소가 있니? boolean형 있으면 true
			{
				String headname = (String)e_numm.nextElement();
				String headvalue = request.getHeader(headname);
				out.println(headname+" : "+headvalue+"<br>");
			}
			
			
		
		%>
	
	</h3>
	
	
	
	
</body>
</html>






