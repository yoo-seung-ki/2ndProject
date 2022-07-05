<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="Cdao" class="common.CompanyDAO"/>
<jsp:useBean id="Ddao" class="common.DismemberDAO"/>
<jsp:useBean id="Adao" class="common.AdminDAO"/>
<%@ page import="common.CompanyVO" %>
<%@ page import="common.DismemberVO" %>
<%@ page import="common.AdminVO" %>
<%@ page import="java.util.*" %>
<% List<CompanyVO> Cdaolist = Cdao.getCompanyList(); %>
<% String loginmobile = (String) session.getAttribute("loginmobile"); %> <!-- 세션에 연결된 일반사용자 전화번호 -->
<% String adid = (String) session.getAttribute("adid"); %>
<% DismemberVO mobile = Ddao.getUser(loginmobile); %> <!-- 전화번호로 해당 사용자의 모든 정보를 반환하는 mobile 생성 -->

<% AdminVO admin = Adao.getAdmin(adid); %>

<% String comid = (String) session.getAttribute("comid"); %>
<% CompanyVO idcom = Cdao.getCompanyfromid(comid); %>
<%

    // 페이징 넘버 작업

    // 한 페이지에 보여줄 게시글 개수
    int pageSize = 8;
    // 현재 페이지
    String pageNum = request.getParameter("pageNum");
    // pageNum이 null이라는 뜻은 처음 이 사이트에 들어왔다는 뜻이며, 그러한 경우 1번 페이지를 보여준다.
    if (pageNum == null) {
        pageNum = "1";
    }

    // 현재 페이지가 몇번째 페이지인지 계산
    int currentPage = Integer.parseInt(pageNum);

    // 첫번째 글이 전체 게시글중 몇번째인지 계산
    int startRow = (currentPage - 1) * pageSize + 1;

    // 모든 기업의 리스트를 가져옴
    List<CompanyVO> list = Cdao.getCompanyList();

    // 모든 기업의 리스트를 10개 단위로 잘라서 들고옴
    List<CompanyVO> tenlist = Cdao.getCompanyListTen(startRow, pageSize);

    // 기업이 총 몇개인지
    int Companycnt = list.size();

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../css/modal.css">
    <link rel="stylesheet" href="../css/modal-attention.css">
    <link rel="stylesheet" href="../css/modal-apply.css">
    <link rel="stylesheet" href="../css/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> <!-- 제이쿼리 cdn 연동 -->
</head>
<body>
<header>
    <div class="headerWrap">
        <div class="logo">
            <a href="#">
                <img src="../img/logo.png" alt="">
                <div class="title-text">예일장애인박람회</div>
            </a>
        </div>
        <div class="navMenu">
            <ul>
                <li><a class="menu" href="">팀원소개</a></li>
                <li><a class="menu" href="">온라인 채용관</a></li>
                <li><a class="menu" href="">취업 컨텐츠</a></li>
                <% if (loginmobile != null && adid == null) { %>
                <li><a class="menu" style="display:block" href="">내 정보 관리</a></li>
                <%} %>
            </ul>
        </div>
        <div class="changeBtn" name="godea">고대비
            <label class="switch">
                <input type="checkbox" id="colormode">
                <span class="slider round"></span>
            </label>
        </div>
        <script>
            $(document).ready(function () {
                $("#colormode").change(function () {
                    if ($("#colormode").is(":checked")) {
                        $("body").css("background-color", "#000");
                        $("body").css("color", "#fff");
                        $(".menu").css("color", "#fff");
                        $(".section1").css("background-color", "#7d7a7a");
                        $(".section2").css("background-color", "#5a5959");
                        $(".section3").css("background-color", "#7d7a7a");
                        $(".section4").css("background-color", "#5a5959");
                        $(".section5").css("background-color", "#000");
                        $(".myInfoCard").css("background-color", "#fff");
                        $(".myInfoCard").css("box-shadow", "none");
                        $(".title-text").css("color", "#fff");
                    } else {
                        $("body").css("background-color", "#fff");
                        $("body").css("color", "#000");
                        $(".menu").css("color", "#000");
                        $(".section1").css("background-color", "beige");
                        $(".section2").css("background-color", "burlywood");
                        $(".section3").css("background-color", "beige");
                        $(".section4").css("background-color", "#fff");
                        $(".section5").css("background-color", "#fff");
                        $(".myInfoCard").css("background-color", "#fff");
                        $(".myInfoCard").css("box-shadow", "10px 10px 20px #e1e1e1");
                        $(".title-text").css("color", "#000");


                    }

                });
            });
        </script>
        <% if (loginmobile == null && adid == null && comid == null) { %>
        <div class="signin-signup">
            <button class="signin" onclick="location.href='./login.jsp';">로그인</button>
            <button class="signup" onclick="location.href='./register.jsp';">회원가입</button>
            <button style="width:200px;" onclick="location.href='companyregister.jsp'">기업 사용자 회원가입</button>
        </div>
        <% } else if (loginmobile != null && adid == null && comid == null) { %>
        <div class="signin-signup logout">
            <form class="logout-admin" action="logoutproc.jsp">
                <p class="logininfo"><%= mobile.getName()%> 님</p>
                <button type="submit" value="logout" name="memberlogout">로그아웃</button>
            </form>
        </div>
        <% } else if (loginmobile == null && adid != null && comid == null) { %>
        <div class="signin-signup">
            <p class="logininfo"><%= admin.getId()%> 님</p>
            <form class="logout-admin" action="logoutproc.jsp">
                <button type="submit" value="logout" name="memberlogout">로그아웃</button>
            </form>
        </div>
        <% } else if (loginmobile == null && adid == null && comid != null) { %>
        <div class="signin-signup">
            <p class="logininfo"><%= idcom.getComid()%> 님</p>
            <button style="width:200px; height:50px;" type="button" onclick="location.href='companyadvertise.jsp'">구인 공고 등록</button>
            <form class="logout-admin" action="logoutproc.jsp">
                <button type="submit" value="logout" name="memberlogout">로그아웃</button>
            </form>
        </div>
        <%} %>
    </div>
</header>
<script>

    var lastScrollTop = 0, delta = 15;

    $(window).scroll(function () {
        var scrollTop = $(this).scrollTop() /* 스크롤바 수직 위치를 가져옵니다, 괄호 안에 값(value)이 있을 경우 스크롤바의 수직 위치를 정합니다. */
        // Math.abs: 주어진 숫자의 절대값을 반환(return)합니다.
        if (Math.abs(lastScrollTop - scrollTop) <= delta) // 스크롤 값을 받아서 ~
            return; // ~ 리턴

        if ((scrollTop > lastScrollTop) && (lastScrollTop > 0)) {
            /* 화면에 나오지 않을 때, top값은 요소가 보이지 않을 정도로 사용해야함 */
            $("header").css("top", "-100px");
        } else {
            $("header").css("top", "0px");
        }
        lastScrollTop = scrollTop;
    });
</script>
<main>
    <section class="section1">
        <div class="section1-title">
            <div class="title1">2022 예일 On-Line</div>
            <div class="title2">장애인 일자리 박람회</div>
            <div class="title3">2022-06-22(수) ~ 2022-07-05(화)</div>
        </div>
        <div>
            <img class="sectionImg" src="../img/mainImg.png" alt="메인화면">
        </div>
    </section>
    <section class="section2" id="section2">
        <div>
            <h2 class="listTitle">팀원소개</h2>
        </div>
        <div class="member">
            <div class="teamMembers">
                <img class="teamMembersImg" src="../img/Namjeongsoo.png" alt="팀원소개">
                <p class="name">남정수</p>
                <p class="role">프론트엔드</p>
                <p class="comment">우주 최강 개발자</p>
            </div>
            <div class="teamMembers">
                <img class="teamMembersImg" src="../img/kimjaehyeon.png" alt="팀원소개">
                <p class="name">김재현</p>
                <p class="role">프론트엔드</p>
                <p class="comment">집가고 싶어요</p>
            </div>
            <div class="teamMembers">
                <img class="teamMembersImg" src="../img/parkhwiwon.jpg" alt="팀원소개">
                <p class="name">박휘원</p>
                <p class="role">프론트엔드</p>
                <p class="comment">지구촌 최강 개발자</p>
            </div>
            <div class="teamMembers">
                <img class="teamMembersImg" src="../img/yuseunggi.png" alt="팀원소개" style="background-color:#ffccbc;">
                <p class="name">유승기</p>
                <p class="role">백엔드</p>
                <p class="comment">목표는 1인분</p>

            </div>
            <div class="teamMembers">
                <img class="teamMembersImg" src="../img/songminyeong.png" alt="팀원소개" style="background-color:beige;">
                <p class="name">송민영</p>
                <p class="role">백엔드</p>
                <p class="comment">은하계 최강 개발자</p>
            </div>
        </div>
    </section>
    <section class="section3">
        <div>
            <h2 class="listTitle">참여 기업 리스트</h2>
        </div>
        <div class="enterpriseList">
            <% for (int i = 0; i < 4; i++) { %>
            <div class="enterpriseCard">
                <a href="">
                    <img class="cardImg" src="../img/<%=tenlist.get(i).getLogo() %>" alt="기업 이미지">
                    <div class="cardInfo">
                        <div>
                            <p><%=tenlist.get(i).getCompanyname() %>
                            </p>
                        </div>
                        <div>
                            <p><%=tenlist.get(i).getAddress().substring(0, 7) %>
                            </p>
                        </div>
                        <div>
                            <p><%=tenlist.get(i).getRecrutype() %>
                            </p>
                        </div>
                        <div>
                            <p><%=tenlist.get(i).getEmplodate() %>
                            </p>
                        </div>
                    </div> <!-- cardInfo -->
                </a>
            </div> <!-- enterpriseCard -->
            <%} %>
        </div>

        <div>
            <h2 class="addBtn"><a href="../jsp/employment.jsp">더보기&nbsp;<i class="fas fa-plus-circle"></i></a></h2>
        </div>
    </section>
    <section class="section4">
        <h2 class="videoTitle">취업 컨텐츠</h2>
        <div class="video">
            <iframe width="800" height="500" src="https://www.youtube.com/embed/HdzoRAsgqsg"
                    title="YouTube video player" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
        </div>
    </section>
    <% if (loginmobile != null && adid == null) { %>
    <section class="section5" style="display:block">
        <h2 class="listTitle">내 정보 관리</h2>
        <div class="cardList">
            <div class="myInfoCard myInfo">
                <a href="" onclick="modalpage1()">
                    <img src="../img/user.png" alt="내 정보 관리">
                    <h3>내 정보 관리</h3>
                </a>
            </div>
            <div class="myInfoCard">
                <a href="./excelinput.jsp">
                    <img src="../img/info.png" alt="입사지원서 관리">
                    <h3>입사지원서 관리</h3>
                </a>
            </div>
            <div class="myInfoCard attention">
                <a href="" onclick="modalpage2()">
                    <img src="../img/attention.png" alt="관심 기업 관리">
                    <h3>관심 기업 관리</h3>
                </a>
            </div>
            <div class="myInfoCard">
                <a href="" onclick="modalpage3()">
                    <img src="../img/enterprise.png" alt="기업지원 현황">
                    <h3>기업지원 현황</h3>
                </a>
            </div>
        </div>
    </section>
    <% } %>
</main>


<!-- 내 정보변경 모달 -->
<div class="modalBackground inactive1">
    <div class="modalContainer">
        <div>
            <form>
                <p class="modalTitle">내 정보 변경</p>
                <div class="modalInput">
                    성 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명 <input type="text" disabled
	                    value="<%= mobile.getName() %>">
	            </div>
                <div class="modalInput">
                    거주지역 <select class="insert-info" name="address" id="travel_arriveVia" onchange="showfield(this.options[this.selectedIndex].value)">
                    <option selected="selected">구분</option>
                    <option value="강서구">강서구</option>
                    <option value="금정구">금정구</option>
                    <option value="기장군">기장군</option>
                    <option value="남구">남구</option>
                    <option value="동구">동구</option>
                    <option value="동래구">동래구</option>
                    <option value="부산진구">부산진구</option>
                    <option value="북구">북구</option>
                    <option value="사상구">사상구</option>
                    <option value="사하구">사하구</option>
                    <option value="서구">서구</option>
                    <option value="수영구">수영구</option>
                    <option value="연제구">연제구</option>
                    <option value="영도구">영도구</option>
                    <option value="중구">중구</option>
                    <option value="해운대구">해운대구</option>
                    <option value="경남 김해시">경남 김해시</option>
                    <option value="경남 양산시">경남 양산시</option>
                    <option value="경남 창원시">경남 창원시</option>
                    <option value="Other">기타(직접 입력)</option>
                </select>
                    <div id="div1"></div>
                </div>
                <div class="modalInput">
                    전화번호 <input type="text" maxlength="11">
                </div>
                <div class="modalInput">
                    장애유형 <input type="text" disabled value="<%=mobile.getDiscase() %>">
                </div>
                <div class="modalInput">
                    장애정도 <input type="text" disabled value="<%=mobile.getDisgrade() %>">
                </div>
            </form>
            <div class="modal-Bnt">
                <button class="modalSendBnt" type="submit">보내기</button>
                <button class="modalClose" onclick="modalpage1close()">취소</button>
            </div>
        </div>
    </div>
</div>


<!-- 관심 기업 목록 모달 -->
<% if (loginmobile != null) { %>
<% if ( Ddao.listintercom(loginmobile) != null) { %>
<% String intercomlist = Ddao.listintercom(loginmobile); %>
<% String[] arr = intercomlist.split(","); %>

<div class="modalBackground-attention inactive2">
    <div class="modalContainer-attention">
        <div>
            <form>
                <p class="modalTitle-attention">관심 기업 목록</p>
                <div class="enterpriseList">

                    <% for (int i = 1; i < arr.length; i++) { %>
                    <% CompanyVO newarr = Cdao.getCompanyfromname(arr[i]);%>
                    <div class="enterpriseCard">
                        <a target="_blank" href="companyinfo.jsp?name=<%=newarr.getCompanyseq()%>">
                            <img class="cardImg" src="../img/<%=newarr.getLogo() %>" alt="기업 이미지">
                            <div class="cardInfo">
                                <div>
                                    <p><%=newarr.getCompanyname() %>
                                    </p>
                                </div>
                                <div>
                                    <p><%=newarr.getAddress().substring(0, 7) %>
                                    </p>
                                </div>
                                <div>
                                    <p><%=newarr.getRecrutype() %>
                                    </p>
                                </div>
                                <div>
                                    <p><%=newarr.getEmplodate() %>
                                    </p>
                                </div>
                                <% if (adid != null) { %>
                                <div class="modalBnt">
                                    <button type="" onclick="" name="" class="modalClose" value="">삭제하기</button>
                                </div>
                                <% } %> <!-- 바로 위의 if문 종료 -->
                            </div> <!-- cardInfo -->
                        </a>
                    </div> <!-- enterpriseCard -->
                    <% } %> <!-- for문 종료 -->

                </div> <!-- enterpriseList -->
                <div class="modalBnt">
                    <button class="modalClose" onclick="modalpage1close()">닫기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<% } %>
<% } %>

<!-- 기업지원 현황 모달 -->
<div class="modalBackground-attention inactive3">
    <div class="modalContainer-attention">
        <div>
            <form>
                <div class="subTitle">
                    <p class="modalTitle-attention">기업지원 현황</p>
                </div>
                <div class="slideList slide">
                    <% for (int i = 0; i < tenlist.size(); i++) { %>
                    <div class="slideCard">
                        <a target="_blank" href="companyinfo.jsp?name=<%=tenlist.get(i).getCompanyseq()%>">
                            <img class="slideImg" src="../img/<%=tenlist.get(i).getLogo() %>" alt="기업 이미지">
                            <div class="slideInfo">
                                <div>
                                    <p><%=tenlist.get(i).getCompanyname() %>
                                    </p>
                                </div>
                                <div>
                                    <p><%=tenlist.get(i).getAddress().substring(0, 7) %>
                                    </p>
                                </div>
                                <div>
                                    <p><%=tenlist.get(i).getRecrutype() %>
                                    </p>
                                </div>
                                <div>
                                    <p><%=tenlist.get(i).getEmplodate() %>
                                    </p>
                                </div>

                                <% if (adid != null) { %>
                                <div class="modalBnt">
                                    <button type="" onclick="" name="" class="modalClose" value="">삭제하기</button>
                                </div>
                                <% } %>
                            </div> <!-- cardInfo -->
                        </a>
                    </div> <!-- enterpriseCard -->
                    <% } %>



                </div> <!-- enterpriseList -->
                <div class="modalBnt">
                    <button class="modalClose" onclick="modalpage1close()">닫기</button>
                </div>
            </form>
        </div>
    </div>
</div>


<footer>
    <div class="footerWrap">
        <div>copyright 2022. All RIGHT RESERVED.</div>
    </div>
</footer>


<script src="../js/mainScroll.js"></script>
<script src="../js/modal.js"></script>
<script type="text/javascript">
    function showfield(name){
        if(name=='Other')document.getElementById('div1').innerHTML='직접입력 <input type="text" name="other" />';
        else document.getElementById('div1').innerHTML='';
    }
</script>


</body>
</html>