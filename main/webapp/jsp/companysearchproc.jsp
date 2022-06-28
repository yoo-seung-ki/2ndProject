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
	String searchtext = request.getParameter("searchtext");
	CompanyDAO Cdao = new CompanyDAO();
	List<CompanyVO> list = Cdao.getSearch(searchtext);
	System.out.println(searchtext);
	if (list.size() == 0) { %>
		<script>
		alert('검색결과가 없습니다.')
		history.back();
		</script>
	<% } else { %>
		<script>
			location.href="employmentresult.jsp?name=<%=searchtext%>"
		</script>
	<% }%>
	
	

</body>
</html>