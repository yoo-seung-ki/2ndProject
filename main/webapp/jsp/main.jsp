<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="Cdao" class="common.CompanyDAO" />
<%@ page import="common.CompanyVO" %>
<%@ page import="java.util.*" %>
<% List<CompanyVO> Cdaolist = Cdao.getCompanyList(); %>

<% 

	// 페이징 넘버 작업
	
	// 한 페이지에 보여줄 게시글 개수
	int pageSize = 8;
	// 현재 페이지
	String pageNum = request.getParameter("pageNum");
	// pageNum이 null이라는 뜻은 처음 이 사이트에 들어왔다는 뜻이며, 그러한 경우 1번 페이지를 보여준다.
	if(pageNum == null) {
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/main.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
</head>
<body>
    <header>
        <div class="headerWrap">
            <div class="logo">
                <a href="../html/main.html">
                    <img src="../img/logo.png" alt="">
                    <div class="title-text">예일장애인박람회</div>
                </a>
            </div>
            <div class="navMenu">
                <ul>
                    <li><a href="">팀원소개</a></li>
                    <li><a href="">온라인 채용관</a></li>
                    <li><a href="">취업 컨텐츠</a></li>
                    <li><a href="">내 정보 관리</a></li>
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
                    $(".section1").css("background-color","#7d7a7a");
                    $(".section2").css("background-color","#5a5959");
                    $(".section3").css("background-color","#7d7a7a");
                    $(".section4").css("background-color","#5a5959");
                    $(".section5").css("background-color","#000");
                    $(".myInfoCard").css("background-color","#fff");
                    $(".myInfoCard").css("box-shadow","none");
                    $(".title-text").css("color","#fff");
                }else{
                    $("body").css("background-color","#fff");
                    $("body").css("color","#000");
                    $(".section1").css("background-color","beige");
                    $(".section2").css("background-color","burlywood");
                    $(".section3").css("background-color","beige");
                    $(".section4").css("background-color","#fff");
                    $(".section5").css("background-color","#fff");
                    $(".myInfoCard").css("background-color","#fff");
                    $(".myInfoCard").css("box-shadow","10px 10px 20px #e1e1e1");
                    $(".title-text").css("color","#000");
                    
                    
                }
            
                });
            });
            </script>
            <div class="signin-signup">
                <button class="signin">로그인</button>
                <button class="signup">회원가입</button>
            </div>
        </div>
    </header>
    <main>
        <section class="section1">
            <div class="section1-title">
                <div class="title1">2022 예일 On-Line</div>
                <div class="title2">장애인 일자리 박람회</div>
                <div class="title3">2022-06-22(수) ~ 2022-06-22(수)</div>
            </div>
            <div>
                <img class="sectionImg" src="../img/mainImg.png" alt="메인화면">
            </div>
        </section>
        <section class="section2">
            <div>
                <h2 class="listTitle">팀원소개</h2>
            </div>
            <div>
                <img class="sectionImg" src="" alt="팀원소개">
            </div>
        </section>
        <section class="section3">
            <div>
                <h2 class="listTitle">참여 기업 리스트</h2>
            </div>
            <div class="enterpriseList">
                <% for(int i = 0; i < 4; i++ ) { %>
            <div class="enterpriseCard">
                <a href="">
                    <img class="cardImg" src="../img/<%=tenlist.get(i).getLogo() %>" alt="기업 이미지">
                    <div class="cardInfo">
                        <div>
                            <p><%=tenlist.get(i).getCompanyname() %></p><br>
                            
                        </div>
                        <div>
                            <p><%=tenlist.get(i).getAddress().substring(0,7) %></p><br>
                            <p><%=tenlist.get(i).getRecrutype() %></p><br>
                        </div>
                        <div>
                            <p>지원기간</p>
                        </div>
                    </div> <!-- cardInfo -->
                </a>
            </div> <!-- enterpriseCard -->
            <% } %>
                        </div>
                    </a>
                </div>
         
            </div>
            <div>
                <h2 class="addBtn"><a href="">더보기</a></h2>
            </div>
        </section>
        <section class="section4">
            <h2 class="videoTitle">취업 컨텐츠</h2>
            <div class="video">
                <iframe width="800" height="500" src="https://www.youtube.com/embed/HdzoRAsgqsg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </section>
        <section class="section5">
            <h2 class="listTitle">내 정보 관리</h2>
            <div class="cardList">
                <div class="myInfoCard">
                    <a href="">
                        <img src="../img/user.png" alt="내 정보 관리">
                        <h3>내 정보 관리</h3>
                    </a>
                </div>
                <div class="myInfoCard">
                    <a href="">
                        <img src="../img/info.png" alt="입사지원서 관리">
                        <h3>입사지원서 관리</h3>
                    </a>
                </div>
                <div class="myInfoCard">
                    <a href="">
                        <img src="../img/attention.png" alt="관심 기업 관리">
                        <h3>관심 기업 관리</h3>
                    </a>
                </div>
                <div class="myInfoCard">
                    <a href="">
                        <img src="../img/enterprise.png" alt="기업지원 현황">
                        <h3>기업지원 현황</h3>
                    </a>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <div class="footerWrap">
            <div>copyright 2022. All RIGHT RESERVED.</div>
        </div>
    </footer>

    <script src="../js/mainScroll.js"></script>
</body>
</html>