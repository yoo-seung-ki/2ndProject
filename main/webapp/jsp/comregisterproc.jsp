<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Cdao" class="common.CompanyDAO" />
<jsp:useBean id="Cvo" class="common.CompanyVO" />
<% 
	Cvo.setComid(request.getParameter("companyid"));
	Cvo.setCompw(request.getParameter("companypassword"));
	Cvo.setCompanyname(request.getParameter("companyname"));
	Cvo.setCeo(request.getParameter("ceo"));
	Cvo.setCreateyear(request.getParameter("companycreate"));
	Cvo.setAddress(request.getParameter("address"));
	Cvo.setHomepage(request.getParameter("homepage"));
	Cvo.setCompanytype(request.getParameter("companytype"));
	Cvo.setCompanycontent(request.getParameter("companycontent"));
	Cvo.setCompanysize(request.getParameter("companysize"));
	
%>

