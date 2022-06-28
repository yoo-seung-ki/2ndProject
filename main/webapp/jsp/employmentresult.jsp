<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.CompanyDAO" %>
<%@ page import="common.CompanyVO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	CompanyDAO Cdao = new CompanyDAO();
	String searchtext = request.getParameter("name");
	List<CompanyVO> list = Cdao.getSearch(searchtext); %>
	<%System.out.println(searchtext); %>
	<% for (int i = 0; i < list.size(); i++) { %>
	<table>
	<tr>
		<td><%=list.get(i).getCompanyname()%></td>
		<%--현재 게시글에 대한 정보 --%>
	</tr>
	</table> <% } %>
</body>
</html>