<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL : JSP 표준 태그 라이브러리</title>
</head>
<body>
	<%-- 
		1. 라이브러리 다운받아서 해당 프로젝트에 넣기(tomcat.apache.org)
		2. 다운받은 라이브러리 WEB-INF 안에 lib폴더를 만들어서 넣어두자.
		3. 지시어중 <%@ taglib %> 에 선언하고 사용한다.						
			core : <% taglib prfix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			fmt : <% taglib prfix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			** core 라이브러리는 핵심, fmt 라이브러리는 국제화(숫자와 날짜 처리할때 사용)
			
		4. 사용법 : (core)<c: 명령어>	 </c:명령어>, (fmt)<fmt:명령어> </fmt:명령어>
		
		
	--%>
	<%-- 
		변수 생성 (set) : <c:set var="변수이름" value="변수에 저장되는 데이터"/>
		변수 출력 (out) : <c:out value="출력할 데이터" or ${변수이름}/> 또는 ${변수이름}
		변수 삭제 (remove) : <c:remove var="변수이름"/>
		
	--%>
	<%-- 변수 생성 및 데이터 저장 --%>
	<c:set var="str" value="Hello JSP"/>
	<hr>
	
	<%-- 변수가 가지고 있는 값을 출력 (EL사용)--%>
	<li><c:out value="str"/></li>
	<li><c:out value="${str}"/></li>
	<li>${str}</li>
	<hr>
	
	<%-- 변수 삭제 후 출력해 보기 (EL사용 X)--%>
	<c:remove var="str"/>
	<li>결과 : <c:out value="${str}"/></li>
	<li>결과 : ${str}</li>
	<hr>
	
	<%-- 
		if문 (else가 없음, 조건이 참일때만 실행) 
		<c:if var="변수명" test="조건식(관계연산,비교연산 =>EL방식으로 사용)">
			조건식이 참일때 실행할 문장;
		</c:if>
	
	--%>
	<c:if test="${4>3}">
		<li>결과 : Hello JSTL_1</li>
	</c:if>
	
	<c:if test="${4<3}">
		<li>결과 : Hello JSTL_2</li>
	</c:if>
	
	<%-- avg의 점수가 80이상이면 합격, 아니면 불합격 --%>
	<c:set var="avg" value="79"/>
	<c:if test="${avg>=80}" >
		<li>합격</li>
	</c:if>
	<c:if test="${avg<80}" >
		<li>불합격</li>
	</c:if>
	<hr>
	
	<%-- 
		if문은 else가 없는 불편함이 있어서 choose문을 사용한다. choose문은 switch문과 비슷(if~else대신 많이 사용됨.) 
		<c:choose>
			<c:when test="조건식(관계연산,비교연산 =>EL방식으로 사용)"> 참일때 실행 </c:when>
			<c:when test="조건식(관계연산,비교연산 =>EL방식으로 사용)"> 참일때 실행 </c:when>
			<c:when test="조건식(관계연산,비교연산 =>EL방식으로 사용)"> 참일때 실행 </c:when>
			<c:when test="조건식(관계연산,비교연산 =>EL방식으로 사용)"> 참일때 실행 </c:when>
			<c:when test="조건식(관계연산,비교연산 =>EL방식으로 사용)"> 참일때 실행 </c:when>
			<c:otherwise>위 조건이 모두 거짓일때,즉 나머지를 말한다.</c:otherwise>
		</c:choose>
	--%>
	<%-- avg의 점수가 80이상이면 합격, 아니면 불합격 --%>
	<c:choose>
		<c:when test="${avg>=80}"><li>합격</li></c:when>
		<c:when test="${avg<80}"><li>불합격</li></c:when>
	</c:choose>
	
	<%-- avg의 점수가 90이상이면 A학점, 80이상이면 B학점, 70이상이면 C학점 나머진 F --%>
	<%-- 정수는 정수로 비교, 실수는 실수로 비교 해야된다. --%>
	<c:set var="avg" value="86.5" />
	<c:choose>
		<c:when test="${avg>=90.0}"><li>학점 : A학점</li></c:when>
		<c:when test="${avg>=80.0}"><li>학점 : B학점</li></c:when>
		<c:when test="${avg>=70.0}"><li>학점 : C학점</li></c:when>
		<c:otherwise><li>학점 : F학점</li></c:otherwise>
	</c:choose>
	<br>
	
	<%-- 
	<c:set var="hak" value="" />
	<c:choose>
		<c:when test="${avg>=90}"><li>학점 : ${hak = "A"}</li></c:when>
		<c:when test="${avg>=80}"><li>학점 : ${hak = "B"}</li></c:when>
		<c:when test="${avg>=70}"><li>학점 : ${hak = "C"}</li></c:when>
		<c:otherwise>${hak = "F"}</c:otherwise>
	</c:choose>
	<br>
	--%>
	
	<%-- 
		반복문  
		1. 일반적인 for문
		<c:forEach begin="시작값" end="끝값" step="증가값" var="사용변수">
			반복내용 (EL을 활용한다.)
		</c:forEach>
		
		2. 개선된 for문(배열, ArrayList(컬렉션)에서 주로 사용한다.)
		<c:forEach var="사용변수" items="${배열이나 리스트(컬렉션)}">
			반복내용 (EL을 활용한다.)
		</c:forEach>
		
	--%>
	
	<h2> 1부터 10까지 출력하기 </h2>
	<h3>
		<c:forEach begin="1" end="10" step="1" var="i">
			<li>${i} &nbsp; &nbsp;</li>
		</c:forEach>
	</h3>
	<hr>
	<h2> 1부터 10까지 짝수만 출력하기 </h2>
	<%--<h3>
		<c:forEach begin="2" end="10" step="2" var="i">
			<li>${i} &nbsp; &nbsp;</li>
		</c:forEach>
	</h3>--%>
	<h3>
		<c:forEach begin="1" end="10" step="1" var="i">
			<c:if test="${i%2==0}">
				<li>${i} &nbsp; &nbsp;</li>
			</c:if>
		</c:forEach>
	</h3><hr>
	
	<h2> 21부터 30까지 출력하기(짝수) </h2>
	<h3>
		<%-- varStatus : count, index, (first, last => boolean) --%>
		<c:forEach begin="21" end="30" step="1" var="i" varStatus="vs">
			<c:if test="${i%2==0}">
				<li>${i}  / ${vs.count} / ${vs.index} / ${vs.first} / ${vs.last}</li>
			</c:if>
		</c:forEach>
	</h3><hr>
	
	<%-- 개선된 for문 --%>
	<%-- 배열생성 --%>
	<c:set var="arr_1" value="홍길동, 임꺽정, 장길산, 임지매"/>
	<c:forEach var="i" items="${arr_1}">
		<li>${i}</li>
	</c:forEach>
	<hr>
	
	<%-- 반복하면서 나누기 --%>
    <%-- <c:forTokens items="배열,컬렉션" delims="구분자" var="변수"></c:forTokens> --%>
    <c:set var="arr_2" value="홍길동, 임꺽정, 장길산/ 일지매, 둘리, 희동이/ 고길동, 마이콜" />
    <c:forTokens items="${arr_2}" delims="," var="k">
    	<li> ${k} </li>
    </c:forTokens>
    <hr>
         
    <c:set var="arr_2" value="홍길동, 임꺽정, 장길산/ 일지매, 둘리, 희동이/ 고길동, 마이콜" />
    <c:forTokens items="${arr_2}" delims="/" var="k">
           <li> ${k} </li>
    </c:forTokens>
         <hr>
         
         <%-- 구분자를 여러개 사용 가능 --%>
         <c:set var="arr_2" value="홍길동, 임꺽정, 장길산/ 일지매, 둘리, 희동이/ 고길동, 마이콜" />
         <c:forTokens items="${arr_2}" delims="/," var="k">
           <li> ${k} </li>
         </c:forTokens>
         <hr>
         
         <%-- 페이지 이동 : forward, sendRedirect 
              JSP 액션 태그 : forward만 존재
              JSTL          : sendRedirect만 존재
              둘 다 파라미터값을 넘길 수 있다.
              
             <jsp:forward page="이동할 장소">
                  <jsp:param value="" name=""/>
             </jsp:forward>

          <%request.setCharacterEncoding("utf-8"); %>
          <jsp:forward page="ex08.jsp">
             <jsp:param value="도우너" name="name" />
	         <jsp:param value="1004" name="age" />
          </jsp:forward>
         
         <c:redirect url="ex08.jsp">
            <c:param name="name" value="또치" />
            <c:param name="age" value="108" />
         </c:redirect>  
         --%>
         
        <h2>form태그를 이용해서 파라미터 전송</h2>
		<form action="ex29_result.jsp" method="post">
		<fieldset>
			<legend> 데이저 전송 </legend>
			<p> **이름 : <input type="text" name="name" placeholder="이름 입력하세요" required></p>
			<p> **나이 : <input type="number" name="age" placeholder="나이 입력하세요" required></p>
			<p> 성별 : <input type="radio" name="gender" value="남성">남성
			           <input type="radio" name="gender" value="여성">여성
			</p>
			<p> 취미 : <input type="checkbox" name="hobby" value="운동">운동
			           <input type="checkbox" name="hobby" value="영화">영화
			           <input type="checkbox" name="hobby" value="게임">게임
			           <input type="checkbox" name="hobby" value="독서">독서
			</p>
			<input type="submit" value="보내기" >
		</fieldset>
	</form>
	
	
	
	
	
</body>
</html>










