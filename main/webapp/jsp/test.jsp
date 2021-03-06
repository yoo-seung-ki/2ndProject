<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Ddao" class="common.DismemberDAO" />
<jsp:useBean id="Adao" class="common.AdminDAO" />
<%@ page import="common.CompanyDAO" %>
<%@ page import="common.CompanyVO" %>
<%@ page import="common.DismemberVO" %>
<%@ page import="common.AdminVO" %>
<%@ page import="java.util.*" %>
<% CompanyDAO Cdao = new CompanyDAO(); %>
<% List<CompanyVO> Cdaolist = Cdao.getCompanyList(); %>
<% String loginmobile = (String)session.getAttribute("loginmobile"); %>
<% String adid = (String)session.getAttribute("adid"); %>
<% DismemberVO mobile = Ddao.getUser(loginmobile); %>
<% AdminVO admin = Adao.getAdmin(adid); %>
<% String godea = (String)session.getAttribute("godea"); %>

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
    <title>채용관</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/employment.css">
    
    <!-- <script>
		function delsure() {
		if(confirm("정말 삭제하시겠습니까?") == true) {
			document.getElementById("delfrm").submit();
		} else {
			return event.preventDefault();
		}
		}
	</script> -->
    
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
        <div class="changeBtn">고대비
        <label class="switch">
            <input type="checkbox" id="colormode">
            <span class="slider round"></span>
        </label>
        </div>
       
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
            <h2 class="listTitle">참여 기업 리스트</h2>
        </div>
        <div class="enterpriseList">
        <% for(int i = 0; i < tenlist.size(); i++ ) { %>
            <div class="enterpriseCard">
                <a target="_blank" href="companyinfo.jsp?name=<%=tenlist.get(i).getCompanyseq()%>">
                    <img class="cardImg" src="../img/<%=tenlist.get(i).getLogo() %>" alt="기업 이미지">
                    <div class="cardInfo">
                        <div>
                            <p ><%=tenlist.get(i).getCompanyname() %></p>
                        </div>
                        <div>
                            <p><%=tenlist.get(i).getAddress().substring(0,7) %></p>
                        </div>
                        <div>
                            <p><%=tenlist.get(i).getRecrutype() %></p>
                        </div>
                        <div>
                            <p><%=tenlist.get(i).getEmplodate() %></p>
                        </div>
                        <% if (adid != null) { %>
                        <div>
                        	<form id="delfrm" method="post" action="delcomproc.jsp">
                        		<button  type="submit" onclick="delsure()" name="delcomseq" class="delete-button" value="<%=tenlist.get(i).getCompanyseq()%>">삭제하기</button>
                        	</form>
                        </div>
                        <% } %>
                    </div> <!-- cardInfo -->
                </a>
            </div> <!-- enterpriseCard -->
            <% } %>
            
            
        </div> <!-- enterpriseCard -->
    </section> <!-- section3 -->
    
    <div class="searchWrap">
        <div class="input">
        		<form method="get" target="_blank" action="companysearchproc.jsp">
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
    
    
    
    
    
    
    
    <!-- 게시글 페이징 -->
	    <div class="listNum" id="page_control">
			<%
    			// 전체 페이지 수 계산
    			int pageCnt = Companycnt/pageSize + (Companycnt%pageSize == 0 ? 0 : 1);
				// 한 페이지에 보여줄 게시글 개수
				
				// int Companycnt = list.size(); => 전체 기업의 수 => 20개
				// int pageSize = 8;
				// compantcnt 를 pageSize로 나눈 값이 0 이면 0이 반환되고
				// 0이 아니면 1이 반환된다.
		
				// 삼항 연산자, (A ? B : C)의 형태로 표시된다.
				// 첫번째 인덱스는 조건을 의미하고, 두번째 인덱스는s 조건이 참일 경우 리턴되는 값이며
				// 세번째 인덱스는 조건이 거짓일때 리턴되는 값이다. 
		
    			// 한 페이지에 보여줄 페이지 번호 개수
    			int pageBlock = 10;
				
    			// 시작하는 페이지 번호  ex) 1, 11, 21...
    			int startPage = ((currentPage-1) / pageBlock) * pageBlock + 1;
    			
    			// 끝나는 페이지 번호
    			int endPage = startPage + pageBlock-1;
    			
    			if(endPage > pageCnt) {
    				endPage = pageCnt;
    			
    			
    			// 10페이지 이전으로 가는 버튼
    			// 시작페이지가 11이상이 아니면 이전 버튼을 만들 필요가 없다. 
	    		if(startPage > pageBlock) { %>
	    			<a href="employment.jsp?pageNum=<%=startPage - pageBlock%>">이전</a>
	    		<%}
    			// 몇번 페이지로 갈 것인지 번호를 a태그로 생성
    			for(int i = startPage; i <= endPage; i++) { %>
    				<a href="employment.jsp?pageNum=<%=i%>"><%=i %></a>
    			<%}
    			
    			// 10페이지 건너뛰는 버튼
    			// 남은 페이지가 10 이하라면 다음으로 가는 버튼을 만들 필요가 없다.
    			if(endPage < pageCnt) { %>
    				<a href="employment.jsp?pageNum=<%=startPage + pageBlock%>">다음</a>
    			<%}
    		}
 			%>
	    </div>
    

    <footer>
        <div class="footerWrap">
            <div>copyright 2022. All RIGHT RESERVED.</div>
        </div>
    </footer>
    <script>
        $(document).ready(function() {
            $("#colormode").change(function(){
            if($("#colormode").is(":checked")){
                $("body").css("background-color","#000");
                $("body").css("color","#fff");
                $(".title-text").css("color","#fff");
                $(".bannerTitle").css("color","#000");
                $("p").css("color","#fff");
                consol.log("되네")
            }else{
                $("body").css("background-color","#fff");
                $("body").css("color","#000");
                $(".title-text").css("color","#000");
                $(".bannerTitle").css("color","#000");
                $("p").css("color","#000");
                consol.log("되네")
            }        
            });
        });
        </script>

<script src="../js/voice.js"></script>


</body>
</html>