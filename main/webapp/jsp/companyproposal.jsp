<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.CompanyDAO" %>
<%@ page import="common.CompanyVO" %>
<%@ page import="common.DismemberDAO" %>
<%@ page import="common.DismemberVO" %>
<% DismemberDAO Ddao = new DismemberDAO(); %>
<% CompanyDAO Cdao = new CompanyDAO(); %>

<% String loginmobile = (String)session.getAttribute("loginmobile"); %>
<% DismemberVO vo = Ddao.getUser(loginmobile); %>

<% int companyseq = Integer.parseInt(request.getParameter("name")); %>
<% CompanyVO companyinfo = Cdao.getCompany(companyseq); %>
<% String comname = companyinfo.getCompanyname(); %>

<% Ddao.procom(vo.getMemberseq(), comname); %>


<script>
	alert("입사지원 신청이 완료되었습니다.");
	location.href="home.jsp";
</script>
