<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Cdao" class="common.CompanyDAO" />
<jsp:useBean id="Ddao" class="common.DismemberDAO" />
<jsp:useBean id="Adao" class="common.AdminDAO" />
<%@ page import="common.CompanyVO" %>
<%@ page import="common.DismemberVO" %>
<%@ page import="common.AdminVO" %>
<%@ page import="java.util.*" %>
<% int companyseq= Integer.parseInt(request.getParameter("name"));%>
<% CompanyVO companyinfo = Cdao.getCompany(companyseq); %>
<% String loginmobile = (String)session.getAttribute("loginmobile"); %>
<% String adid = (String)session.getAttribute("adid"); %>
<% DismemberVO mobile = Ddao.getUser(loginmobile); %>
<% AdminVO admin = Adao.getAdmin(adid); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 회원가입</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/companyinfo.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
    <script>
    	function submitfunc() {
    		if(confirm("정말 신청하시겠습니까?") == true) {
    			document.getElementById("profrm").submit();
    		} else {
    			return event.preventDefault();
    		}
    	}
    </script>
</head>
<body>
<!-- 헤더  -->
<header>
    <div class="headerWrap">
        <div class="logo">
            <a href="../jsp/home.jsp">
                <img src="../img/logo.png" alt="">
                <div class="title-text">예일장애인박람회</div>
            </a>
        </div> <!-- logo -->
        <div class="navMenu">
            <ul>
                <li>기업 회원가입</li>
            </ul>
        </div>
        <div class="changeBtn">고대비
        	<label class="switch">
            	<input type="checkbox" id="colormode">
           		<span class="slider round"></span>
        	</label>
        </div>
        <script>
 
            $(document).ready(function() {
                $("#colormode").change(function(){
                if($("#colormode").is(":checked")){
                    $("body").css("background-color","#000");
                    $("body").css("color","#fff");
                    $(".title-text").css("color","#fff");
                    $(".good").css("filter","invert(100%)");
                    $(".bannerTitle").css("color","#000");
                    $(".companybanner").css("filter","invert(100%)");
                    $("th").css("color","#000");
                    $("td").css("color","#fff");
                }else{
                    $("body").css("background-color","#fff");
                    $("body").css("color","#000");
                    $(".title-text").css("color","#000");
                    $(".good").css("filter","invert(0%)");
                    $(".companybanner").css("filter","invert(0%)");
                    $("td").css("color","#000");
                    
                    
                }
            
                });
            });
            </script>
        <% if (loginmobile == null && adid == null) { %>
       	<div class="signin-signup">
       		<button class="signin" onclick="location.href='./login.jsp';">로그인</button>
            <button class="signup" onclick="location.href='./register.jsp';">회원가입</button>
       	</div>
       	<% } else if (loginmobile != null && adid == null) { %>
       	<div class="signin-signup">
            <form action="logoutproc.jsp">
            	<p><%= mobile.getName()%> 님 환영합니다 </p>
            	<button type="submit" value="logout" name="memberlogout" >로그아웃</button>
            </form>
        </div>
        <% } else if (loginmobile == null && adid != null){ %>
       	<div>
       		<p><%= admin.getId()%> 님 환영합니다 </p>
       		<form action="logoutproc.jsp">
       		<button type="submit" value="logout" name="memberlogout" >로그아웃</button>
       		</form>
       	</div> <%} %>
</header>
  <!--  메인배너  -->
    
    <div class="bannerWrap">
        <div class="banner">
            <img src="../img/main.png" alt="배너">
        </div>
        <div class="bannerTitle">
            <h1>기업 회원가입</h1>
        </div>
    </div>
    <main>
    <!-- 회사배너 -->
    <div class="companyWrap">
        <div class="companybanner">
            <img src="../img/<%=companyinfo.getLogo() %>" class="uploadimage" width="350" alt="회사배너">
        </div>
    </div>
  <!--회사 정보? -->
  <div class="company-info">
  <div>
    <img src="../img/good1.png" class="good"  width="45" height="45">기업정보 
   		<input type="file" id="file" name="file"  accept="image/*" onchange="changeValue(this)"/>
   		<button type="button" id="btn-upload" style="float:right;">이미지업로드</button>

    <script>
    $(function () {
    	$('#btn-upload').click(function (e) {
    		e.preventDefault();
    		$('#file').click();
    		});
    	}); 
     function changeValue(obj){
		alert(obj.value);
	}

  </script>
  </div>
<table style="width:1200px; height:120px;">

    <tr>
        <th>기&nbsp;&nbsp;&nbsp;업&nbsp;&nbsp;&nbsp;명</th>
        <td colspan="3"> <input  type="text"  placeholder="기 업 명"></td>
        <th>홈 페 이 지</th>
        <td colspan="3"> <input  type="text"  placeholder="홈 페 이 지"></td>
    </tr>
    <tr>
        <th>대&nbsp;&nbsp;&nbsp;표&nbsp;&nbsp;&nbsp;자</th>
        <td colspan="3"> <input  type="text"  placeholder="대 표 자"></td>
        <th>업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</th>
        <td colspan="3"> <input  type="text"  placeholder="업 종"></td>
    </tr>
    <tr>
        <th>설 립 시 기</th>
        <td colspan="3"> <input  type="text"  placeholder="설 립 시 기"></td>
        <th>사 업 내 용</th>
        <td colspan="3"> <input  type="text"  placeholder="사 업 내 용"></td>
    </tr>
    <tr>
        <th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
        <td colspan="3"> <input  type="text"  placeholder="주 소"></td>
        <th>규&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모</th>
        <td colspan="3"> <input  type="text"  placeholder="규 모"></td>
    </tr>
</table>
</div>
<div class="company-info">
    <img src="../img/good2.png" class="good" width="45" height="45">채용정보
<table  width="1200" height="120">
    <tr>
        <th>모 집 직 종</th>
        <td colspan="3"> <input  type="text"  placeholder="모 집 직 종"></td>
        <th>모 집 인 원</th>
        <td colspan="3"> <input  type="number" ></td>
    </tr>
    <tr>
        <th>직 무 내 용</th>
        <td colspan="3"> <input  type="text"  placeholder="직 무 내 용"></td>
        <th>근 무 지 역</th>
        <td colspan="3"> <input  type="text"  placeholder="근 무 지 역"></td>
    </tr>
    <tr>
        <th>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력</th>
        <td colspan="3"> <input  type="text"  placeholder="학 력"></td>
        <th>경&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력</th>
        <td colspan="3"> <input  type="text"  placeholder="경 력"></td>
    </tr>
    <tr>
        <th>고 용 형 태</th>
        <td colspan="3"> <input  type="text"  placeholder="고 용 형 태"></td>
        <th>근 무 형 태</th>
        <td colspan="3"> <input  type="text"  placeholder="근 무 형 태"></td>
    </tr>
    <tr>
        <th>급 여 조 건</th>
        <td colspan="3"> <input  type="text"  placeholder="급 여 조 건"></td>
        <th>사 회 보 험</th>
        <td colspan="3"> <input  type="text"  placeholder="사 회 보 험"></td>
    </tr>
    <tr>
        <th>퇴&nbsp;&nbsp;&nbsp;직&nbsp;&nbsp;&nbsp;금</th>
        <td colspan="3"> <input  type="text"  placeholder="퇴 직 금"></td>
        <th>상&nbsp;&nbsp;&nbsp;여&nbsp;&nbsp;&nbsp;금</th>
    
        <td colspan="3"> <input  type="text"  placeholder="상 여 금"></td>
    </tr>
    <tr>
        <th>근 무 시 간</th>
        <td colspan="3"> <input  type="text"  placeholder="근 무 시 간"></td>
        <th>잔&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</th>
        <td colspan="3"> <input  type="text"  placeholder="잔 업"></td>
    </tr>
    <tr>
        <th>기 타 조 건</th>
        <td colspan="7"><input  type="text" placeholder="기 타 조 건" ></td>
    </tr>
</table>
</div>
<div class="company-info">
    <img src="../img/good3.png" class="good" width="45" height="45">
    우대사항 및 복리후생
<table  width="1200" height="120">
    <tr>
        <th>전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공</th>
        <td colspan="3"> <input  type="text"  placeholder="전 공"></td>
        <th>자 격 면 허</th>
        <td colspan="3"> <input  type="text"  placeholder="자 격 면 허"></td>
    </tr>
    <tr>
        <th>컴퓨터활용</th>

        <td colspan="3"> <input  type="text"  placeholder="컴 퓨 터 활 용"></td>
        <th>편 의 시 설</th>
   
        <td colspan="3"> <input  type="text"  placeholder="편 의 시 설"></td>
    </tr>
    <tr>
        <th>복 리 후 생</th>
        
        <td colspan="3"> <input  type="text"  placeholder="복 리 후 생"></td>
        <th>우 대 사 항</th>
        <td colspan="3"> <input  type="text"  placeholder="우 대 사 항"></td>
    </tr>
</table>
<div style="float:right">
    <button type="button" onclick="location.href='#'" class="regist">기업 회원가입</button>
    <button tlye="button" onclick="history.back()" class="back">취소</button>
</div>
</div>
</main>
    <footer>
        <div class="footerWrap">
            <div>copyright 2022. All RIGHT RESERVED.</div>
        </div>
    </footer>
</body>
</html>