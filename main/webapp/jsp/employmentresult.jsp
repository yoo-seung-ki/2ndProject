<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.CompanyDAO" %>
<%@ page import="common.CompanyVO" %>
<%@ page import="java.util.*" %>
<% CompanyDAO Cdao = new CompanyDAO(); %>
<% List<CompanyVO> Cdaolist = Cdao.getCompanyList(); %>
<% String searchtext = request.getParameter("name");
	List<CompanyVO> list = Cdao.getSearch(searchtext); %>
<% String name = request.getParameter("godea"); %>
<%// String godea = request.getAttribute("godea"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>채용관</title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/employment.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
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
        </div>
        <div class="navMenu">
            <ul>
                <li>온라인 채용관</a></li>
            </ul>
        </div>
        <div class="changeBtn" name="godea">고대비
        <label class="switch">
            <input type="checkbox" id="colormode">
            <span class="slider round"></span>
        </label>
        </div>
        <script>
        $(document).ready(function() {
        	$("p").css("color","#000");
            $("#colormode").change(function(){
            if($("#colormode").is(":checked")){
                $("body").css("background-color","#000");
                $("body").css("color","#fff");
                $(".title-text").css("color","#fff");
                $(".bannerTitle").css("color","#000");
                $("p").css("color","#fff");
            }else{
                $("body").css("background-color","#fff");
                $("body").css("color","#000");
                $(".title-text").css("color","#000");
                $(".bannerTitle").css("color","#000");
                $("p").css("color","#000");
            }
        
            });
        });
        </script>
        <div class="signin-signup">
                <button class="signin" onclick="location.href='./login.jsp';">로그인</button>
                <button class="signup" onclick="location.href='./register.jsp';">회원가입</button>
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


<!--  검색필터  -->
    <div class="container">
        <form>
            <div class="filterWrap">
                <div class="filterList">
                    <ul>
                        <li>
                            <select>
                                <option selected>모집직종</option>
                                <option>경영·행정·사무직</option>
                                <option>교육·법률</option>
                                <option>보건·의료직</option>
                                <option>예술·디자인·방송직</option>
                                <option>여행·숙박·음식서비스직</option>
                                <option>경호·경비·청소직</option>
                                <option>영업·판매직</option>
                                <option>운전·운송직</option>
                                <option>생산·단순제조직</option>
                                <option>문화·예술</option>
                            </select>
                        </li>
                        <li>
                            <select>
                                <option selected>모집지역</option>
                                <option>부산전체</option>
                                <option>강서구·사하구</option>
                                <option>북구·사상구</option>
                                <option>동래구·해운대구·기장군</option>
                                <option>부산진구·연제구·수영구</option>
                                <option>동구·남구</option>
                                <option>영도구·중구·서구</option>
                            </select>
                        </li>
                        <li>
                            <select>
                                <option selected>근무시간</option>
                                <option>전일</option>
                                <option>반일</option>
                                <option>교대근무</option>
                                <option>시간협의</option>
                            </select>
                        </li>
                        <li>
                            <select>
                                <option selected>우대사항</option>
                                <option>운전가능자</option>
                                <option>차량소지자</option>
                                <option>인근거주자</option>
                                <option>청년층우대</option>
                                <option>장년(고량자)</option>
                                <option>여성우대</option>
                                <option>고용촉진지원금대상자</option>
                            </select>
                        </li>
                    </ul>
                    <button type="submit" class="search1">검색</button>
                </div>
            </div>
        </form>
    </div>

<!--  채용관 리스트  -->
	
    <section class="section3">
        <div class="text">
            <h2 class="listTitle">검색결과</h2>
        </div>
        <div class="enterpriseList">
        <% for(int i = 0; i < list.size(); i++ ) { %>
            <div class="enterpriseCard">
                <a href="companyinfo.jsp?name=<%=list.get(i).getCompanyseq()%>">
                    <img class="cardImg" src="../img/<%=list.get(i).getLogo() %>" alt="기업 이미지">
                    <div class="cardInfo">
                        <div>
                            <p ><%=list.get(i).getCompanyname() %></p>
                        </div>
                        <div>
                            <p><%=list.get(i).getAddress().substring(0,7) %></p>
                        </div>
                        <div>
                            <p><%=list.get(i).getRecrutype() %></p>
                        </div>
                        <div>
                            <p><%=list.get(i).getEmplodate() %></p>
                        </div>
                    </div> <!-- cardInfo -->
                </a>
            </div> <!-- enterpriseCard -->
            <% } %>
            
            
        </div> <!-- enterpriseCard -->
    </section> <!-- section3 -->
    
    <div class="searchWrap">
        <div class="input">
        		<form method="get" action="companysearchproc.jsp">
	            <input type="text" name="searchtext" 
	            autocomplete="off" id="mic" placeholder="마이크 클릭 후 음성으로 기업명 입력">
	            <button type="submit" class="search2">검색</button>
	            </form>
	            <button class="dictate"><i class="fas fa-microphone"></i>
					<svg width="1.25rem" height="1.25rem" viewBox="0 0 100 100">
						<g stroke="#fff" stroke-width="15">
							<path d="M20,20 20,80">
								<animate attributeName="d" values="M20,40 20,60;M20,20 20,80;M20,40 20,60" dur="1s"
									repeatCount="indefinite" />
							</path>
							<path d="M50,10 50,90">
								<animate attributeName="d" values="M50,10 50,90;M50,40 50,60;M50,10 50,90" dur="1s"
									repeatCount="indefinite" />
							</path>
							<path d="M80,20 80,80">
								<animate attributeName="d" values="M80,40 80,60;M80,20 80,80;M80,40 80,60" dur="1s"
									repeatCount="indefinite" />
							</path>
						</g>
					</svg>
	            </button>
        </div>
    </div> <!-- searchWrap -->
    
    

    <footer>
        <div class="footerWrap">
            <div>copyright 2022. All RIGHT RESERVED.</div>
        </div>
    </footer>

<script src="../js/voice.js"></script>
</body>
</html>