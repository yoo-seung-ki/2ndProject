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
        <td colspan="3">www.naver.com</td>
    </tr>
    <tr>
        <th>대&nbsp;&nbsp;&nbsp;표&nbsp;&nbsp;&nbsp;자</th>
        <td colspan="3">ㅇㅇ</td>
        <th>업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</th>
        <td colspan="3">제조업</td>
    </tr>
    <tr>
        <th>설 립 시 기</th>
        <td colspan="3">2022년 6월 27일</td>
        <th>사 업 내 용</th>
        <td colspan="3">기계부품</td>
    </tr>
    <tr>
        <th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
        <td colspan="3">우엉</td>
        <th>규&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모</th>
        <td colspan="3">23423423</td>
    </tr>
</table>
</div>
<div class="company-info">
    <img src="../img/good2.png" class="good" width="45" height="45">채용정보
<table  width="1200" height="120">
    <tr>
        <th>모 집 직 종</th>
        <td colspan="3">ㅇㅇ</td>
        <th>모 집 인 원</th>
        <td colspan="3">ㅇㅇ</td>
    </tr>
    <tr>
        <th>직 무 내 용</th>
        <td colspan="3">ㅇㅇ</td>
        <th>근 무 지 역</th>
        <td colspan="3">제조업</td>
    </tr>
    <tr>
        <th>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력</th>
        <td colspan="3">2022년 6월 27일</td>
        <th>경&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력</th>
        <td colspan="3">기계부품</td>
    </tr>
    <tr>
        <th>고 용 형 태</th>
        <td colspan="3">우엉</td>
        <th>근 무 형 태</th>
        <td colspan="3">23423423</td>
    </tr>
    <tr>
        <th>급 여 조 건</th>
        <td colspan="3">ㅇㅇ</td>
        <th>사 회 보 험</th>
        <td colspan="3">www.naver.com</td>
    </tr>
    <tr>
        <th>퇴&nbsp;&nbsp;&nbsp;직&nbsp;&nbsp;&nbsp;금</th>
        <td colspan="3">ㅇㅇ</td>
        <th>상&nbsp;&nbsp;&nbsp;여&nbsp;&nbsp;&nbsp;금</th>
        <td colspan="3">제조업</td>
    </tr>
    <tr>
        <th>근 무 시 간</th>
        <td colspan="3">2022년 6월 27일</td>
        <th>잔&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</th>
        <td colspan="3">기계부품</td>
    </tr>
    <tr>
        <th>기 타 조 건</th>
        <td colspan="7">우엉</td>

    </tr>
</table>
</div>
<div class="company-info">
    <img src="../img/good3.png" class="good" width="45" height="45">
    우대사항 및 복리후생
<table  width="1200" height="120">
    <tr>
        <th>전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공</th>
        <td colspan="3">ㅇㅇ</td>
        <th>자 격 면 허</th>
        <td colspan="3">www.naver.com</td>
    </tr>
    <tr>
        <th>컴퓨터활용</th>
        <td colspan="3">ㅇㅇ</td>
        <th>편 의 시 설</th>
        <td colspan="3">제조업</td>
    </tr>
    <tr>
        <th>복 리 후 생</th>
        <td colspan="3">2022년 6월 27일</td>
        <th>우 대 사 항</th>
        <td colspan="3">기계부품</td>
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