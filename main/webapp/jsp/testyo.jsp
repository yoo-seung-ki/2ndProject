<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.* " %>
<%@ page import = "java.sql.* " %>
<%@ page import="common.CompanyDAO" %>
<%@ page import="common.CompanyVO" %>
<jsp:useBean id="Cdao" class="common.CompanyDAO"/>
<% CompanyDAO cdao = new CompanyDAO(); %>
<% List<CompanyVO> arrCdao = cdao.getCompanyList(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <p><%=arrCdao.get(0).getLogo() %></p>
</body>
</html>