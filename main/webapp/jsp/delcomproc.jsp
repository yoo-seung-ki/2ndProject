<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Cdao" class="common.CompanyDAO" />
<%@ page import="common.CompanyVO" %>
<% int delcomseq = Integer.parseInt(request.getParameter("delcomseq")); %>

<% boolean del = Cdao.deleteCompany(delcomseq); %>

<script>
	location.href="employment.jsp";
</script>