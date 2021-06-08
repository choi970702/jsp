<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Script 요소</title>
</head>
<body>
	<%-- 
	스크립트 요소 : HTML 안에서 자바코드를 사용할 수 있도록 만든 요소들
	- 선언부 (<%! 내용 %>) : 변수 선언이나 메소드 선언을 할때 사용
	- 스크립트릿 (<% 내용 %>) : 자바 코드를 코딩할때 사용
	- 표현식 (<%= 내용 %>) : 변수값이나 메소드의 결과값을 출력할때 사용(나중에 EL이나 JSTL로 변경한다.)
		
	** 주의사항 : 스크립트요소들은 겹쳐서 사용하면 안된다.
	
	
	
	
	--%>
	<h2> 0~10 까지 for문을 사용해서 출력하자 </h2>
	<% 
		for(int i = 0; i<11;i++)
		{
			// 콘솔에 출력하는것 
			// System.out.println(i);
			
			// 웹페이지, 브라우저에 출력
			// 서블릿 처럼 out이라는 객체가 존재해서 사용 가능하다.("태그")
			out.println(+i+"&nbsp;&nbsp;");
			
		}
	%>
	<hr>
	
	<h2> 0~10 까지 for문을 사용해서 출력하자 </h2>
	<% 
		for(int i = 0; i<11;i++)
		{%>
			<%= i%>&nbsp;&nbsp;
			
		<%}
	%>
	<hr>
	
	<h2> 0~10 까지의 합을 for문을 사용해서 출력하자 </h2>
	<% 
		int sum = 0;
		for(int i = 0; i<11;i++)
		{
			sum = sum + i;
				
		}
		out.println("합은 : "+sum);
	%>
	<hr>
	
	<h2> 0~10 까지의 합을 for문을 사용해서 출력하자 </h2>
	<% 
		int sum2 = 0;
		for(int i = 0; i<11;i++)
		{
			sum2 = sum2 + i;
				
		}
	%>
	합 : <%=sum2 %>
	<hr>
	
	<h2> 변수와 메소드를 만들어서 사용하기 </h2>
	<%! 
		public int add(int s1,int s2)
		{
			int res = 0;
			res = s1 + s2;
			return res;
		}
		int result = 0;
		public void sub(int s1,int s2)
		{
			// out 객체를 사용할 수 없다.
			// out.println(s1-s2);
			result = s1 - s2;
		}
		
	
	%>
	<p>7 + 5 = <%= add(7,5) %></p>
	<p>7 + 5 = <% out.println(add(7,5));%></p>
	<hr>
	
	<% sub(7,5); %>
	<p>7 - 5 = <%= result %></p>
	<p>7 - 5 = <% out.println(result);%></p>
	<hr>
	
	<h2> 오늘 날짜와 운수 출력하기 </h2>
	<% 
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		int date = now.get(Calendar.DATE);
		int lucky = (int)(Math.random()*101);
		String res = "날짜 : "+year+". "+month+". "+date+" 운세 : "+lucky+"%";
	%>
	<%= res %>
	
	<h2> 5단 출력 </h2>
	<% 
		for(int i=1;i<10;i++)
		{%>
			5 * <%= i%>  = <%=(5*i) %><br>
		<%}
	%>
	<hr>
	
	
</body>
</html>





