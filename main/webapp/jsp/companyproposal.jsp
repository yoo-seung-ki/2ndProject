<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String comseq = request.getParameter("name");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("신청되었습니다.");
	location.href="myinfo.jsp?name=<%=comseq%>";
	// DB에 유저 개인별로 어떤 기업에 입사지원을 했고 관심기업으로 등록했는지 저장하는게 필요해보인다 
</script>
</head>
<body>
	
	
</body>
</html>