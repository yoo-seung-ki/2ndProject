<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Cdao" class="common.CompanyDAO"/>
<jsp:useBean id="Ddao" class="common.DismemberDAO"/>
<jsp:useBean id="Adao" class="common.AdminDAO"/>
<%@ page import="common.CompanyVO" %>
<%@ page import="common.DismemberVO" %>
<%@ page import="common.AdminVO" %>
<%@ page import="java.util.*" %>
<% String comid = (String) session.getAttribute("comid"); %>
<% CompanyVO idcom = Cdao.getCompanyfromid(comid); %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 공고등록</title>
    <% if (comid == null) { %>
		<script>
			alert("로그인이 필요합니다.");
			location.href="login.jsp";
		</script>	
	<%}%>
	
	<script>
    	function submitfunc() {
    		if(confirm("정말 신청하시겠습니까?") == true) {
    			document.getElementById("profrm").submit();
    		} else {
    			return event.preventDefault();
    		}
    	}
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/company.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
</head>
<body>

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
                <li>기업 공고등록</li>
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
            
            
	        <div class="signin-signup">
	            <p class="logininfo"><%= idcom.getComid()%> 님</p>
	            <form class="logout-admin" action="logoutproc.jsp">
	                <button type="submit" value="logout" name="memberlogout">로그아웃</button>
	            </form>
	        </div>
        
            	
        </div>
</header>

    <!--  메인배너  -->
    
    <div class="bannerWrap">
        <div class="banner">
            <img src="../img/main.png" alt="배너">
        </div>
        </div>
        


	<div class="company-info" style="margin:0 auto; width:1200px;" >
    <img src="../img/good2.png" class="good" width="45" height="45">채용정보
    <form id="profrm" method="post" action="companyadvertiseproc.jsp" >
    <div>
		<table style="width:1200px; height:120px;">
	    <tr>
	        <th>모 집 직 종</th>
	        <td colspan="3"> <input name="recrutype" type="text"  placeholder="모 집 직 종"></td>
	        <th>모 집 인 원</th>
	        <td colspan="3"> <input name="recrusize" type="number" ></td>
	    </tr>
	    <tr>
	        <th>직 무 내 용</th>
	        <td colspan="3"> <input name="workcontent" type="text"  placeholder="직 무 내 용"></td>
	        <th>근 무 지 역</th>
	        <td colspan="3"> <input name="workarea" type="text"  placeholder="근 무 지 역"></td>
	    </tr>
	    <tr>
	        <th>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력</th>
	        <td colspan="3"> <input name="graduate" type="text"  placeholder="학 력"></td>
	        <th>경&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력</th>
	        <td colspan="3"> <input name="career" type="text"  placeholder="경 력"></td>
	    </tr>
	    <tr>
	        <th>고 용 형 태</th>
	        <td colspan="3"> <input name="employcase" type="text"  placeholder="고 용 형 태"></td>
	        <th>근 무 형 태</th>
	        <td colspan="3"> <input name="worktype" type="text"  placeholder="근 무 형 태"></td>
	    </tr>
	    <tr>
	        <th>급 여 조 건</th>
	        <td colspan="3"> <input name="paytype" type="text"  placeholder="급 여 조 건"></td>
	        <th>사 회 보 험</th>
	        <td colspan="3"> <input name="insurance" type="text"  placeholder="사 회 보 험"></td>
	    </tr>
	    <tr>
	        <th>퇴&nbsp;&nbsp;&nbsp;직&nbsp;&nbsp;&nbsp;금</th>
	        <td colspan="3"> <input name="severance" type="text"  placeholder="퇴 직 금"></td>
	        <th>상&nbsp;&nbsp;&nbsp;여&nbsp;&nbsp;&nbsp;금</th>
	        <td colspan="3"> <input name="bonus" type="text"  placeholder="상 여 금"></td>
	    </tr>
	    <tr>
	        <th>근 무 시 간</th>
	        <td colspan="3"> <input name="worktime" type="text"  placeholder="근 무 시 간"></td>
	        <th>잔&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</th>
	        <td colspan="3"> <input name="addwork" type="text"  placeholder="잔 업"></td>
	    </tr>
	    <tr>
	        <th>기 타 조 건</th>
	        <td colspan="7"><input name="etc" type="text" placeholder="기 타 조 건" ></td>
	    </tr>
		</table>
	</div>
	<br>
	<div class="company-info" style="margin:0 auto; width:1200px;" >
    <img src="../img/good3.png" class="good" width="45" height="45">
    우대사항 및 복리후생
	<table style="width:1200px; height:120px;" >
    	<tr>
        	<th>전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공</th>
	        <td colspan="3"> <input name="major" type="text"  placeholder="전 공"></td>
	        <th>자 격 면 허</th>
	        <td colspan="3"> <input name="license" type="text"  placeholder="자 격 면 허"></td>
    	</tr>
   		<tr>
	        <th>컴퓨터활용</th>
	        <td colspan="3"> <input name="computer" type="text"  placeholder="컴 퓨 터 활 용"></td>
	        <th>편 의 시 설</th>
	        <td colspan="3"> <input name="facil" type="text"  placeholder="편 의 시 설"></td>
    	</tr>
    	<tr>
	        <th>복 리 후 생</th>
	        <td colspan="3"> <input name="welfare" type="text"  placeholder="복 리 후 생"></td>
	        <th>우 대 사 항</th>
	        <td colspan="3"> <input name="treatment" type="text"  placeholder="우 대 사 항"></td>
    	</tr>
	</table>
	</div>
	<br>
		<div style="text-align: center">
		    <button type="button" onclick="submitfunc()" class="regist">기업 공고등록</button>
		    <button type="button" onclick="history.back()" class="back">취소</button>
		</div>
		<br><br>
		</div>
</form>
</body>
</html>