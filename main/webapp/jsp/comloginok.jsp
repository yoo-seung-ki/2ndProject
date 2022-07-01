<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Cdao" class="common.CompanyDAO" />
<% request.setCharacterEncoding("UTF-8");  %>
<% String comid = request.getParameter("comid"); %>
<% String compw = request.getParameter("compw"); %>
<% int num = Cdao.comlogin(comid, compw); %>
<% String url = "login.jsp"; %>
<% String msg = ""; %>
<% switch(num) {
		case 1: msg = "아이디가 없습니다.";
			break;
		case 2: msg = "전화번호가 일치하지 않습니다.";
			break;
		case 3: {
			msg = "로그인에 성공하였습니다.\\n" + comid + "님 환영합니다!";
			url = "home.jsp";
			session.setAttribute("comid", comid);
			break; }
		}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("<%=msg%>");
		location.href="<%=url%>";
	</script>
</body>
</html>