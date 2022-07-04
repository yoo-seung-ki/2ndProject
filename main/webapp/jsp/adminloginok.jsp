<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<jsp:useBean id="Adao" class="common.AdminDAO" />
<% request.setCharacterEncoding("UTF-8");  %>
<% String id = request.getParameter("adid"); %>
<% String pw = request.getParameter("adpw"); %>
<% int num = Adao.adlogin(id, pw); %>
<% String url = "login.jsp"; %>
<% String msg = ""; %>
<% switch(num) {
		case 1: msg = "아이디가 없습니다.";
			break;
		case 2: msg = "비밀번호가 일치하지 않습니다.";
			break;
		case 3: {
			msg = "로그인에 성공하였습니다. 관리자\\n" + id + "님 환영합니다!";
			url = "home.jsp";
			session.setAttribute("adid", id);
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