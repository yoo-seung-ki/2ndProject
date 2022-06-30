<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//인증정보(세션삭제)
	//리다이렉트
	
	session.invalidate(); // 세션을 끊는 메소드가 session.invalidate() 이다.
	response.sendRedirect("home.jsp"); //로그아웃을 하게 되면 다시 이전 페이지로 넘어온다. - 우리는 home
%>    
