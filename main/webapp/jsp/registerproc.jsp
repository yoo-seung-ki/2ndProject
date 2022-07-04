<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id ="Ddao" class="common.DismemberDAO" />
<jsp:useBean id ="Dvo" class="common.DismemberVO" />
<% 

 request.setCharacterEncoding("UTF-8"); 
 Dvo.setName(request.getParameter("reginame")); 
 Dvo.setPersonid1(request.getParameter("ssnf")); 
 Dvo.setPersonid2(request.getParameter("ssnb")); 
 Dvo.setArea(request.getParameter("address"));  
 Dvo.setMobile(request.getParameter("Pnum")); 
 Dvo.setDiscase(request.getParameter("type")); 
 Dvo.setDisgrade(request.getParameter("degree")); 
 Ddao.insertUser(Dvo); 
 
 %>

<script>
	alert("회원가입이 완료되었습니다.");
	location.href="login.jsp";
</script>