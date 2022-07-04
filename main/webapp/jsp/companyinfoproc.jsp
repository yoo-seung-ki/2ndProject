<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.CompanyDAO" %>
<%@ page import="common.DismemberDAO" %>
<%@ page import="common.CompanyVO" %>
<%@ page import="common.DismemberVO" %>
<% CompanyDAO Cdao = new CompanyDAO(); %>
<% DismemberDAO Ddao = new DismemberDAO(); %>
<% String loginmobile = (String)session.getAttribute("loginmobile"); %>
<% DismemberVO vo = Ddao.getUser(loginmobile); %>
<% System.out.println(loginmobile); %>

<% int companyseq = Integer.parseInt(request.getParameter("comseq")); %>
<% CompanyVO companyinfo = Cdao.getCompany(companyseq); %>
<% String comname = companyinfo.getCompanyname(); %>

<% System.out.println(comname); %>
<% Ddao.intercom(vo.getMemberseq(), comname); %>


<script>
	alert("관심기업 목록에 추가되었습니다.");
	location.href="home.jsp";
</script>