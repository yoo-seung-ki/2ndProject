<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Cdao" class="common.CompanyDAO" />
<%@ page import="common.CompanyVO" %>
<% int companyseq= Integer.parseInt(request.getParameter("name"));%>
<% CompanyVO companyinfo = Cdao.getCompany(companyseq); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>기업 정보</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/companyinfo.css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
</head>
<body>
<!-- 헤더  -->
<header>
    <div class="headerWrap">
        <div class="logo">
            <a href="../jsp/main.jsp">
                <img src="../img/logo.png" alt="">
                <div class="title-text">예일장애인박람회</div>
            </a>
        </div> <!-- logo -->
        <div class="navMenu">
            <ul>
                <li>온라인 채용관</a></li>
            </ul>
        </div>
        <div>고대비
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
        </script>
        <div class="signin-signup">
            <button class="signin">로그인</button>
            <button class="signup">회원가입</button>
        </div>
    </div>
</header>

    <!--  메인배너  -->
    
    <div class="bannerWrap">
        <div class="banner">
            <img src="../img/main.png" alt="배너">
        </div>
        <div class="bannerTitle">
            <h1>온라인 채용관</h1>
        </div>
    </div>
    <main>
    <!-- 회사배너 -->
    <div class="companyWrap">
        <div class="companybanner">
            <img src="../img/scrollup.png" width="150" alt="회사배너">
        </div>
    </div>
  <!--회사 정보? -->
  <div class="company-info">
    <img src="../img/good1.png" class="good"  width="45" height="45">기업정보
<table style="width:1200px; height:120px;">

    <tr>
        <th>기&nbsp;&nbsp;&nbsp;업&nbsp;&nbsp;&nbsp;명</th>
        <td colspan="3"><%=companyinfo.getCompanyname() %></td>
        <th>홈 페 이 지</th>
        <% String G = companyinfo.getHomepage(); %>
        <% if(G == null) {G = "-";} %>
        <td colspan="3"><%=G %></td>
    </tr>
    <tr>
        <th>대&nbsp;&nbsp;&nbsp;표&nbsp;&nbsp;&nbsp;자</th>
        <td colspan="3"><%=companyinfo.getCeo() %></td>
        <th>업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</th>
        <td colspan="3"><%=companyinfo.getCompanycontent() %></td>
    </tr>
    <tr>
        <th>설 립 시 기</th>
        <td colspan="3"><%=companyinfo.getCreateyear() %></td>
        <th>사 업 내 용</th>
        <td colspan="3"><%=companyinfo.getCompanytype() %></td>
    </tr>
    <tr>
        <th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
        <td colspan="3"><%=companyinfo.getAddress() %></td>
        <th>규&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모</th>
        <td colspan="3"><%=companyinfo.getCompanysize() %></td>
    </tr>
</table>
</div>
<div class="company-info">
    <img src="../img/good2.png" class="good" width="45" height="45">채용정보
<table  width="1200" height="120">
    <tr>
        <th>모 집 직 종</th>
        <td colspan="3"><%=companyinfo.getRecrutype() %></td>
        <th>모 집 인 원</th>
        <td colspan="3"><%=companyinfo.getRecrusize() %></td>
    </tr>
    <tr>
        <th>직 무 내 용</th>
        <td colspan="3"><%=companyinfo.getWorkcontent() %></td>
        <th>근 무 지 역</th>
        <td colspan="3"><%=companyinfo.getWorkarea() %></td>
    </tr>
    <tr>
        <th>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력</th>
        <td colspan="3"><%=companyinfo.getGraduate() %></td>
        <th>경&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력</th>
        <td colspan="3"><%=companyinfo.getCareer() %></td>
    </tr>
    <tr>
        <th>고 용 형 태</th>
        <td colspan="3"><%=companyinfo.getEmploycase() %></td>
        <th>근 무 형 태</th>
        <td colspan="3"><%=companyinfo.getWorktype() %></td>
    </tr>
    <tr>
        <th>급 여 조 건</th>
        <td colspan="3"><%=companyinfo.getPaytype() %></td>
        <th>사 회 보 험</th>
        <td colspan="3"><%=companyinfo.getInsurance() %></td>
    </tr>
    <tr>
        <th>퇴&nbsp;&nbsp;&nbsp;직&nbsp;&nbsp;&nbsp;금</th>
        <td colspan="3"><%=companyinfo.getSeverance() %></td>
        <th>상&nbsp;&nbsp;&nbsp;여&nbsp;&nbsp;&nbsp;금</th>
        <% String I = companyinfo.getBonus(); %>
        <% if(I == null) {I = "-";} %>
        <td colspan="3"><%=I %></td>
    </tr>
    <tr>
        <th>근 무 시 간</th>
        <td colspan="3"><%=companyinfo.getWorktime() %></td>
        <th>잔&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</th>
        <td colspan="3"><%=companyinfo.getAddwork() %></td>
    </tr>
    <tr>
        <th>기 타 조 건</th>
        <% String H = companyinfo.getEtc(); %>
        <% if(H == null) {H = "-";}	%>
        <td colspan="7"><%=H %></td>

    </tr>
</table>
</div>
<div class="company-info">
    <img src="../img/good3.png" class="good" width="45" height="45">
    우대사항 및 복리후생
<table  width="1200" height="120">
    <tr>
        <th>전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공</th>
        <% String A = companyinfo.getMajor(); %>
        <% if(A == null) {A = "-";}%>
        <td colspan="3"><%=A %></td>
        <th>자 격 면 허</th>
        <% String B = companyinfo.getLicense(); %>
        <% if(B == null) {B = "-";}%>
        <td colspan="3"><%=B %></td>
    </tr>
    <tr>
        <th>컴퓨터활용</th>
        <% String C = companyinfo.getComputer(); %>
        <% if(C == null) {C = "-";}%>
        <td colspan="3"><%=C %></td>
        <th>편 의 시 설</th>
        <% String D = companyinfo.getFacil(); %> 
        <% if(D == null) {D = "-";}	%>
        <td colspan="3"><%=D %></td>
    </tr>
    <tr>
        <th>복 리 후 생</th>
        <% String E = companyinfo.getWelfare(); %>
        <% if(E == null) {E = "-";}%>
        <td colspan="3"><%=E %></td>
        <th>우 대 사 항</th>
        <% String F = companyinfo.getTreatment(); %>
        <% if(F == null) {F = "-";}	%>
        <td colspan="3"><%=F %></td>
    </tr>
</table>
<div style="float:right">
    <button type="button" onclick="location.href='#'" class="interest">관심채용공고 담기</button>
    <button tlye="button" onclick="history.back()" class="golist">목록</button>
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