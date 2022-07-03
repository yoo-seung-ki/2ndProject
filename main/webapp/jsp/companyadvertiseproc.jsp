<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Cdao" class="common.CompanyDAO" />
<%@ page import="common.CompanyVO" %>
<% String comid = (String)session.getAttribute("comid"); %>
<% CompanyVO A = Cdao.getCompanyfromid(comid); %>
<% int B = A.getCompanyseq(); %><!-- B ==> comid로 받은 기업의 comseq -->
<% CompanyVO Cvo = new CompanyVO(); %>
<% 
	Cvo.setLogo(request.getParameter("logo")); 
	Cvo.setEmplodate(request.getParameter("emplodate"));
	Cvo.setRecrutype(request.getParameter("recrutype"));
	Cvo.setWorkcontent(request.getParameter("workcontent"));
	Cvo.setGraduate(request.getParameter("graduate"));
	Cvo.setEmploycase(request.getParameter("employcase"));
	Cvo.setPaytype(request.getParameter("paytype"));
	Cvo.setSeverance(request.getParameter("severance"));
	Cvo.setWorktime(request.getParameter("worktime"));
	Cvo.setEtc(request.getParameter("etc"));
	Cvo.setRecrusize(Integer.parseInt(request.getParameter("recrusize")));
	Cvo.setWorkarea(request.getParameter("workarea"));
	Cvo.setCareer(request.getParameter("career"));
	Cvo.setWorktype(request.getParameter("worktype"));
	Cvo.setInsurance(request.getParameter("insurance"));
	Cvo.setBonus(request.getParameter("bonus"));
	Cvo.setAddwork(request.getParameter("addwork"));
	Cvo.setMajor(request.getParameter("major"));
	Cvo.setComputer(request.getParameter("computer"));
	Cvo.setWelfare(request.getParameter("welfare"));
	Cvo.setLicense(request.getParameter("license"));
	Cvo.setFacil(request.getParameter("facil"));
	Cvo.setTreatment(request.getParameter("treatment"));
	Cdao.advercompany(B, Cvo);
%>
<script>
	alert("공고 등록에 성공하셨습니다.");
	location.href="home.jsp";
</script>