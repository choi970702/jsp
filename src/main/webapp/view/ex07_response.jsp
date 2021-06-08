<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 내장 객체 : response</title>
<script type="text/javascript">
	function send_go1() 
	{
		location.href ="ex08.jsp";
	}
	function send_go2() 
	{
		location.href ="ex08.jsp?name=마루치&age=17";
	}
</script>
</head>
<body>
	<%-- 
		response(응답) : request와 반대 기능을 한다.
						request가 요청 정보를 담고 있다면, response는 웹 브라우저에 응답 정보를 담는 역할을 한다.
		- 헤더 정보 입력
		- 쿠키 정보 전송
		- 리다이렉트 : response.sendRedirect("이동할 주소");
		=======================================================================================
		웹 페이지로 이동
		1. a 태그를 통한 페이지 이동
		<a href="이동할 주소">텍스트</a>
		<a href="이동할 주소?name=value&name=value">텍스트</a>	// 이러면 파라미터 값도 같이 넘어간다.
		
		2. 자바 스크립트로를 통해서 이동
			- location.href = "이동할 주소";
			- location.href = "이동할 주소?name=value&name=value";
			- history.go(숫자)
		
		1번과 2번은 웹 페이지에서 이벤트 처리를 해야지만 다른 페이지로 이동
		
		3. 리다이렉트 : response.sendRedirect("이동할 주소");
					기존의 request와 response는 사라진다.
					새로운 request와 response가 만들어 진다.
					파라미터가 사라진다. 주소창에 최종 주소가 보인다.
		
		4. 포워드 : request.getRequestDispacher("이동할 주소").forward(request, response);
					기존의 request와 response를 유지한다.
					파라미터가 사라지지 않는다. 주소창에 최초 주소가 보인다.
		
		3번과 4번은 이벤트 없이 자동으로 다른 페이지로 이동한다.
		
	--%>
	
	<%-- a 링크(get방식) --%>
	<a href="ex08.jsp">ex08.jsp페이지로 이동(파라미터X)</a><br>
	<a href="ex08.jsp?name=일지매&age=18">ex08.jsp페이지로 이동(파라미터O)</a><hr>
	
	<%-- 자바 스크립트 이용(get방식) --%>
	<button onclick="send_go1()">ex08.jsp페이지로 이동(파라미터X)</button>
	<button onclick="send_go2()">ex08.jsp페이지로 이동(파라미터O)</button>
	
	<%-- 리다이렉트 --%>
	<%-- response.sendRedirect("ex08.jsp");--%>
	<%-- response.sendRedirect("ex08.jsp?name=둘리&age=22");--%>
	
	<%-- 포워드 --%>
	<%-- request.getRequestDispatcher("ex08.jsp").forward(request, response); --%>
	<% request.getRequestDispatcher("ex08.jsp?name=희동이&age=30").forward(request, response); %>
	
	
	
	
</body>
</html>









