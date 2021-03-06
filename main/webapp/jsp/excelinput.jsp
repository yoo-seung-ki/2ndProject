<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Ddao" class="common.DismemberDAO" />
<jsp:useBean id="Adao" class="common.AdminDAO" />

<%@ page import="common.DismemberVO" %>
<%@ page import="common.AdminVO" %>
<% String loginmobile = (String)session.getAttribute("loginmobile"); %>
<% String adid = (String)session.getAttribute("adid"); %>
<% DismemberVO mobile = Ddao.getUser(loginmobile); %>
<% AdminVO admin = Adao.getAdmin(adid); %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>채용관</title>
    <link rel="stylesheet" href="../css/jobapplication.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- SheetJS CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
    <!-- FileSaver saveAs CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
    <!-- excel export -->
    <script src="../js/sheetjs.js"></script>
    <!-- 돋보기 기능 -->
    <script src="../js/html-magnifier.js"></script>
    <!-- 다크모드 -->
    <script src="../js/dark-mode.js"></script>
    
  
</head>
<body>
    <div style="width: auto; height: auto;" class="body">

<!-- 헤더  -->
<header>
    <div class="headerWrap">
        <div class="logo">
            <a href="../jsp/home.jsp">
                <img src="../img/logo.png" alt="">
                <div class="title-text">예일장애인박람회</div>
            </a>
        </div>
        <div class="navMenu">
            <ul>
                <li>입사지원서</a></li>
            </ul>
        </div>
        
        <div class="changeBtn">고대비
            <label class="switch">
                <input type="checkbox" id="colormode" value="off" onclick="excelinputdarkmode()">
                <span class="slider round"></span>
            </label>
         </div>
         <div class="changeBtn">돋보기
            <label class="switch">
                <input type="checkbox" id="" value="off" id="toggle" onclick="magnifiertoggle()">
                <span class="slider round"></span>
            </label>
         </div>

        <button style="display: none;" onclick="magnifiertoggle()" value="off" id="toggle">돋보기</button>
               
         
        <% if (loginmobile == null && adid == null) { %>
            <div class="signin-signup">
                    <button class="signin" onclick="location.href='./login.jsp';">로그인</button>
                    <button class="signup" onclick="location.href='./register.jsp';">회원가입</button>
            </div>
            <% } else if (loginmobile != null && adid == null) { %>
            <div class="signin-signup logout">
                <form class="logout-admin" action="logoutproc.jsp">
                    <p class="logininfo"><%= mobile.getName()%> 님</p>
                    <button type="submit" value="logout" name="memberlogout" >로그아웃</button>
                </form>
            </div>
            <% } else if (loginmobile == null && adid != null){ %>
                    <div class="signin-signup">
                            <p class="logininfo"><%= admin.getId()%> 님</p>
                            <form class="logout-admin" action="logoutproc.jsp">
                            <button type="submit" value="logout" name="memberlogout" >로그아웃</button>
                            </form>
                    </div> <%} %>
        </div>
</header>

<!--  메인배너  -->
    <div class="bannerWrap">
        <div class="banner">
            <img src="../img/main.png" alt="배너">
        </div>
        <div class="bannerTitle">
            <h1>입사지원서 작성</h1>
        </div>
    </div>


<!-- 메인 내용 -->
<main>
    <div class="option">
         <!-- 남자 여자 -->
            <span class="value1">남자</span>
            <span class="value2">여자</span>
        <!-- 병역 -->
            <span class="value3">필</span>
            <span class="value4">미필</span>
            <span class="value5">면제</span>
            <span class="value6">해당사항 없음</span>
        <!-- 보장구 유무 -->
            <span class="value7">유</span>
            <span class="value8">무</span>
        <!-- 장애정도 -->
            <span class="value9">심한</span>
            <span class="value10">심하지 않은</span>
        <!-- 학력 -->
            <span class="value11">무학</span>
            <span class="value12">재학</span>
            <span class="value13">졸업</span>
            <span class="value14">휴학</span>
            <span class="value15">중퇴</span>
    </div>

    <div class="excelTable">
    <form>
    <table id="table">
        <thead>
            <th colspan="6">입사지원서</th>
        </thead>
        <tbody>
            <tr>
                <td class="tablecolor">성명</td>
                <td colspan="2">
                    <input id='name2' placeholder="이름을 입력하시오." onkeyup='printName()'/>
                    <div style="display: none;" id='result2'></div>
                </td>
                <td class="tablecolor">성별</td>
                <td colspan="2">
                    <input class="radio" type='radio' name='gender' value='남자' onclick='getGender(event)'/>           
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='radio' name='gender' value='여자' onclick='getGender(event)'/>
                    <div style="display: none;" id='radioresult1'></div>
                </td>
            </tr>
            <tr>
                <td class="tablecolor">연락처</td>
                <td colspan="2">
                    <input id='name3' placeholder="연락처를 입력하시오." onkeyup='printName()'/>
                    <div style="display: none;" id='result3'></div>
                </td>
                <td class="tablecolor">생년월일</td>
                <td colspan="2">
                    <input id='name4' placeholder="생년월일을 입력하시오." onkeyup='printName()'/>
                    <div style="display: none;" id='result4'></div>
                </td>
            </tr>
            <tr>
                <td class="tablecolor">주소</td>
                <td colspan="5">
                    <input id='name5' placeholder="주소를 입력하시오." onkeyup='printName()'/>
                    <div style="display: none;" id='result5'></div>                    
                </td>
            </tr>
            <tr>
                <td class="tablecolor">병역</td>
                <td colspan="5">
                    <input type='radio' name='militaly' value='필' onclick='militaly(event)'/>            
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='radio' name='militaly' value='미필' onclick='militaly(event)'/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='radio' name='militaly' value='면제' onclick='militaly(event)'/>            
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='radio' name='militaly' value='해당사항없음' onclick='militaly(event)'/>
                    <div style="display: none;" id='radioresult2'></div>
                </td>
            </tr>
            <tr>
                <td class="tablecolor">장애유형</td>
                <td colspan="2" >지체장애(<input id='name6' onkeyup='printName()'/>
                    <div style="display: none;" id='result6'></div>)<br>
                    (*중복장애입력)
                </td>
                <td class="tablecolor">보장구 유/무</td>
                <td colspan="2">
                    <input type='radio' name='getvalue1' value='유' onclick='getvalue1(event)'/>            
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='radio' name='getvalue1' value='무' onclick='getvalue1(event)'/>
                    <div style="display: none;" id='radioresult3'></div>
                </td>
            </tr>
            <tr>
                <td class="tablecolor">장애정도</td>
                <td colspan="2">
                    <input type='radio' name='getvalue2' value='심한' onclick='getvalue2(event)'/>            
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='radio' name='getvalue2' value='심하지 않은' onclick='getvalue2(event)'/>
                    <div style="display: none;" id='radioresult4'></div>
                </td>
                <td class="tablecolor">보장구 종류</td>
                <td colspan="2">
                    <input id='name7' placeholder="보장구 종류를 입력하시오." onkeyup='printName()'/>
                    <div style="display: none;" id='result7'></div>  
                </td>
            </tr>
            <tr>
                <td rowspan="2" class="tablecolor">최종학력</td>
                <td colspan="3">
                    <input id='name8' placeholder="학교를 입력하시오." onkeyup='printName()'/>
                    <div style="display: none;" id='result8'></div>학교
                </td>
                <td rowspan="2" colspan="2">
                    <input type='radio' name='graduate' value='무학' onclick='getvalue3(event)'/>            
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='radio' name='graduate' value='재학' onclick='getvalue3(event)'/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='radio' name='graduate' value='졸업' onclick='getvalue3(event)'/>            
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='radio' name='graduate' value='휴학' onclick='getvalue3(event)'/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='radio' name='graduate' value='중퇴' onclick='getvalue3(event)'/>
                    <div style="display: none;" id='radioresult5'></div>
                </td>              
            </tr>
            <tr>
                <td colspan="3">
                    <input id='name9' placeholder="학과를 입력하시오." onkeyup='printName()'/>
                    <div style="display: none;" id='result9'></div>학과
                </td>            
            </tr>

            <tr>
                <td rowspan="4" class="tablecolor">경력사항</td>
                <td >사업체명</td>
                <td >근무기간</td>
                <td >담당업무</td>
                <td colspan="2" >비고</td>
            </tr>
            <tr>
                <td>
                    <input id='name10' onkeyup='printName()' placeholder="사업체명을 입력하시오."/>
                    <div style="display: none;" id='result10'></div>
                </td>
                <td>
                    <input id='name11' onkeyup='printName()'placeholder="근무기간을 입력하시오."/>
                    <div style="display: none;" id='result11'></div>
                </td>
                <td>
                    <input id='name12' onkeyup='printName()'placeholder="담당업무를 입력하시오."/>
                    <div style="display: none;" id='result12'></div>
                </td>
                <td colspan="2">
                    <input id='name13' onkeyup='printName()'placeholder="비고를 입력하시오."/>
                    <div style="display: none;" id='result13'></div>
                </td>
            </tr>
            <tr>
                <td>
                    <input id='name14' onkeyup='printName()'placeholder="사업체명을 입력하시오."/>
                    <div style="display: none;" id='result14'></div>
                </td>
                <td>
                    <input id='name15' onkeyup='printName()'placeholder="근무기간을 입력하시오."/>
                    <div style="display: none;" id='result15'></div>
                </td>
                <td>
                    <input id='name16' onkeyup='printName()'placeholder="담당업무를 입력하시오."/>
                    <div style="display: none;" id='result16'></div>
                </td>
                <td colspan="2">
                    <input id='name17' onkeyup='printName()'placeholder="비고를 입력하시오."/>
                    <div style="display: none;" id='result17'></div>
                </td>
            </tr>
            <tr>
                <td>
                    <input id='name18' onkeyup='printName()'placeholder="사업체명을 입력하시오."/>
                    <div style="display: none;" id='result18'></div>
                </td>
                <td>
                    <input id='name19' onkeyup='printName()'placeholder="근무기간을 입력하시오."/>
                    <div style="display: none;" id='result19'></div>
                </td>
                <td>
                    <input id='name20' onkeyup='printName()'placeholder="담당업무를 입력하시오."/>
                    <div style="display: none;" id='result20'></div>
                </td>
                <td colspan="2">
                    <input id='name21' onkeyup='printName()'placeholder="비고를 입력하시오."/>
                    <div style="display: none;" id='result21'></div>
                </td>
            </tr>
            <tr height="40">
                <td rowspan="4" class="tablecolor">자 격 면 허 </td>
                <td>자격종목</td>
                <td>급수</td>
                <td>등록번호</td>
                <td>발행처</td>
                <td>발급일자</td>
            </tr>
            <tr height="40">
                <td>
                    <input id='name22' onkeyup='printName()' placeholder="자격종목을 입력하시오."/>
                    <div style="display: none;" id='result22'></div>
                </td>
                <td>
                    <input id='name23' onkeyup='printName()' placeholder="급수를 입력하시오."/>
                    <div style="display: none;" id='result23'></div>
                </td>
                <td>
                    <input id='name24' onkeyup='printName()' placeholder="등록번호를 입력하시오."/>
                    <div style="display: none;" id='result24'></div>
                </td>
                <td>
                    <input id='name25' onkeyup='printName()' placeholder="발행처를 입력하시오."/>
                    <div style="display: none;" id='result25'></div>
                </td>
                <td>
                    <input id='name26' onkeyup='printName()' placeholder="발급일자를 입력하시오."/>
                    <div style="display: none;" id='result26'></div>
                </td>
            </tr>
            <tr height="40">
                <td>
                    <input id='name27' onkeyup='printName()' placeholder="자격종목을 입력하시오."/>
                    <div style="display: none;" id='result27'></div>
                </td>
                <td>
                    <input id='name28' onkeyup='printName()' placeholder="급수를 입력하시오."/>
                    <div style="display: none;" id='result28'></div>
                </td>
                <td>
                    <input id='name29' onkeyup='printName()' placeholder="등록번호를 입력하시오."/>
                    <div style="display: none;" id='result29'></div>
                </td>
                <td>
                    <input id='name30' onkeyup='printName()' placeholder="발행처를 입력하시오."/>
                    <div style="display: none;" id='result30'></div>
                </td>
                <td>
                    <input id='name31' onkeyup='printName()' placeholder="발급일자를 입력하시오."/>
                    <div style="display: none;" id='result31'></div>
                </td>
            </tr>
            <tr height="40">
                <td>
                    <input id='name32' onkeyup='printName()' placeholder="자격종목을 입력하시오."/>
                    <div style="display: none;" id='result32'></div>
                </td>
                <td>
                    <input id='name33' onkeyup='printName()' placeholder="급수를 입력하시오."/>
                    <div style="display: none;" id='result33'></div>
                </td>
                <td>
                    <input id='name34' onkeyup='printName()' placeholder="등록번호를 입력하시오."/>
                    <div style="display: none;" id='result34'></div>
                </td>
                <td>
                    <input id='name35' onkeyup='printName()' placeholder="발행처를 입력하시오."/>
                    <div style="display: none;" id='result35'></div>
                </td>
                <td>
                    <input id='name36' onkeyup='printName()' placeholder="발급일자를 입력하시오."/>
                    <div style="display: none;" id='result36'></div>
                </td>
            </tr>
            <tr height="40">
                <td rowspan="4" class="tablecolor">교 육 및 훈 련</td>
                <td>교육ㆍ훈련기관</td>
                <td>교육ㆍ훈련일자</td>
                <td colspan="3">교육ㆍ훈련내용</td>
            </tr>
            <tr height="40">
                <td>
                    <input id='name37' onkeyup='printName()' placeholder="교육, 훈련기간를 입력하시오."/>
                    <div style="display: none;" id='result37'></div>
                </td>
                <td>
                    <input id='name38' onkeyup='printName()' placeholder="교육, 훈련일자를 입력하시오."/>
                    <div style="display: none;" id='result38'></div>
                </td>
                <td colspan="3">
                    <input id='name39' onkeyup='printName()' placeholder="교육, 훈련내용을 입력하시오."/>
                    <div style="display: none;" id='result39'></div>
                </td>
            </tr>
            <tr height="40">
                <td>
                    <input id='name40' onkeyup='printName()' placeholder="교육, 훈련기간를 입력하시오."/>
                    <div style="display: none;" id='result40'></div>
                </td>
                <td>
                    <input id='name41' onkeyup='printName()' placeholder="교육, 훈련일자를 입력하시오."/>
                    <div style="display: none;" id='result41'></div>
                </td>
                <td colspan="3">
                    <input id='name42' onkeyup='printName()' placeholder="교육, 훈련내용을 입력하시오."/>
                    <div style="display: none;" id='result42'></div>
                </td>
            </tr>
            <tr height="40">
                <td>
                    <input id='name43' onkeyup='printName()' placeholder="교육, 훈련기간를 입력하시오."/>
                    <div style="display: none;" id='result43'></div>
                </td>
                <td>
                    <input id='name44' onkeyup='printName()' placeholder="교육, 훈련일자를 입력하시오."/>
                    <div style="display: none;" id='result44'></div>
                </td>
                <td colspan="3">
                    <input id='name45' onkeyup='printName()' placeholder="교육, 훈련내용을 입력하시오."/>
                    <div style="display: none;" id='result45'></div>
                </td>
            </tr>
        </tbody>
    </table>
</form>
</div>
<div>
    <button type="button" class="excelexport" onclick="fnExcelReport('table','title');">Excel로 불러오기</button>
    <button type="submit" class="DBsave">저장</button>
</div>    


</main> 
    <footer>
        <div class="footerWrap">
            <div>copyright 2022. All RIGHT RESERVED.</div>
        </div>
    </footer>
    <script>      
            // 돋보기 모드
        const magnifier = new HTMLMagnifier({ width: 500, height: 500 });
        magnifier.show();

        // header 스크롤 반응
        var lastScrollTop = 0, delta = 15;

        $(window).scroll(function(){
        var scrollTop = $(this).scrollTop() /* 스크롤바 수직 위치를 가져옵니다, 괄호 안에 값(value)이 있을 경우 스크롤바의 수직 위치를 정합니다. */
        // Math.abs: 주어진 숫자의 절대값을 반환(return)합니다.
        if(Math.abs(lastScrollTop - scrollTop) <= delta) // 스크롤 값을 받아서 ~
        return; // ~ 리턴

        if ((scrollTop > lastScrollTop) && (lastScrollTop>0)) {
            /* 화면에 나오지 않을 때, top값은 요소가 보이지 않을 정도로 사용해야함 */
            $("header").css("top","-100px");
        } else {
            $("header").css("top","0px");
        }
        lastScrollTop = scrollTop;
        });
            
    </script>
    </div>
</body>
</html>

        