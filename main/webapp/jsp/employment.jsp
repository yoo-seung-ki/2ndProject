<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.CompanyDAO" %>
<%@ page import="common.CompanyVO" %>
<%@ page import="java.util.*" %>
<% CompanyDAO Cdao = new CompanyDAO(); %>
<% List<CompanyVO> Cdaolist = Cdao.getCompanyList(); %>
    
<% 

	// 페이징 넘버 작업
	
	// 한 페이지에 보여줄 게시글 개수
	int pageSize = 10;
	// 현재 페이지
	String pageNum = request.getParameter("pageNum");
	// pageNum이 null이라는 뜻은 처음 이 사이트에 들어왔다는 뜻이며, 그러한 경우 1번 페이지를 보여준다.
	if(pageNum == null) {
		pageNum = "1";
	}
	
	// 첫번째 글이 전체 게시글중 몇번째인지 계산
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	
	// 모든 기업의 리스트를 가져옴 
	List<CompanyVO> list = Cdao.getCompanyList();
	
	// 현재 카테고리에 해당하는 글이 총 몇개인지 확인
	// int cnt;
	// 우리는 카테고리를 지정해서 글을 들고오는것이 아니라
	// 현재 DB에 있는 모든 기업의 리스트를 들고와야 하므로
	// cnt는 필요하지 않음
	
	int Companycnt = list.size();
	// 기업이 총 몇개인지


%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>채용관</title>
    <link rel="stylesheet" href="../css/employment.css">
</head>
<body>
<!-- 헤더  -->
<header>
    <div class="headerWrap">
        <div class="logo">
            <a href="../jsp/main.jsp">
                <img src="../img/logo.png" alt="">
                <div>예일장애인박람회</div>
            </a>
        </div>
        <div class="navMenu">
            <ul>
                <li>온라인 채용관</a></li>
            </ul>
        </div>
        <label class="switch">
            <input type="checkbox">
            <span class="slider round"></span>
        </label>
        <script>
            var check = $("input[type='checkbox']");
            check.click(function(){
                $("p").toggle();
            });
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
        <% for(int i = 0; i < Cdaolist.size(); i++ ) { %>
            <div class="enterpriseCard">
                <a href="">
                    <img class="cardImg" src="" alt="카드1">
                    <div class="cardInfo">
                        <div>
                            <p><%=Cdaolist.get(i).getCompanyname() %></p><br>
                            <p>입사현황</p><br>
                        </div>
                        <div>
                            <p><%=Cdaolist.get(i).getAddress() %></p><br>
                            <p><%=Cdaolist.get(i).getRecrutype() %></p><br>
                        </div>
                        <div>
                            <p>지원기간</p>
                        </div>
                    </div> <!-- cardInfo -->
                </a>
            </div> <!-- enterpriseCard -->
            <% } %>
            
            <%-- <div class="enterpriseCard">
                <a href="">
                    <img class="cardImg" src="" alt="카드2">
                    <div class="cardInfo">
                        <div>
                            <span><%=Cdaolist.get(1).getCompanyname() %></span>
                            <span>입사현황</span>
                        </div>
                        <div>
                            <span><%=Cdaolist.get(1).getAddress() %></span>
                            <span><%=Cdaolist.get(1).getWorktype() %></span>
                        </div>
                        <div>
                            <span>지원기간</span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="enterpriseCard">
                <a href="">
                    <img class="cardImg" src="" alt="카드3">
                    <div class="cardInfo">
                        <div>
                            <span><%=Cdaolist.get(2).getCompanyname() %></span>
                            <span>입사현황</span>
                        </div>
                        <div>
                            <span><%=Cdaolist.get(2).getAddress() %></span>
                            <span><%=Cdaolist.get(2).getWorktype() %></span>
                        </div>
                        <div>
                            <span>지원기간</span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="enterpriseCard">
                <a href="">
                    <img class="cardImg" src="" alt="카드4">
                    <div class="cardInfo">
                        <div>
                            <span><%=Cdaolist.get(3).getCompanyname() %></span>
                            <span>입사현황</span>
                        </div>
                        <div>
                            <span><%=Cdaolist.get(3).getAddress() %></span>
                            <span><%=Cdaolist.get(3).getWorktype() %></span>
                        </div>
                        <div>
                            <span>지원기간</span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="enterpriseCard">
                <a href="">
                    <img class="cardImg" src="" alt="카드5">
                    <div class="cardInfo">
                        <div>
                            <span><%=Cdaolist.get(4).getCompanyname() %></span>
                            <span>입사현황</span>
                        </div>
                        <div>
                            <span><%=Cdaolist.get(4).getAddress() %></span>
                            <span><%=Cdaolist.get(4).getWorktype() %></span>
                        </div>
                        <div>
                            <span>지원기간</span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="enterpriseCard">
                <a href="">
                    <img class="cardImg" src="" alt="카드6">
                    <div class="cardInfo">
                        <div>
                            <span><%=Cdaolist.get(5).getCompanyname() %></span>
                            <span>입사현황</span>
                        </div>
                        <div>
                            <span><%=Cdaolist.get(5).getAddress() %></span>
                            <span><%=Cdaolist.get(5).getWorktype() %></span>
                        </div>
                        <div>
                            <span>지원기간</span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="enterpriseCard">
                <a href="">
                    <img class="cardImg" src="" alt="카드7">
                    <div class="cardInfo">
                        <div>
                            <span><%=Cdaolist.get(6).getCompanyname() %></span>
                            <span>입사현황</span>
                        </div>
                        <div>
                            <span><%=Cdaolist.get(6).getAddress() %></span>
                            <span><%=Cdaolist.get(6).getWorktype() %></span>
                        </div>
                        <div>
                            <span>지원기간</span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="enterpriseCard">
                <a href="">
                    <img class="cardImg" src="" alt="카드8">
                    <div class="cardInfo">
                        <div>
                            <span><%=Cdaolist.get(7).getCompanyname() %></span>
                            <span>입사현황</span>
                        </div>
                        <div>
                            <span><%=Cdaolist.get(7).getAddress() %></span>
                            <span><%=Cdaolist.get(7).getWorktype() %></span>
                        </div>
                        <div>
                            <span>지원기간</span>
                        </div>
                    </div>
                </a>
            </div> --%>
        </div>
    </section>
    <div class="searchWrap">
        <div>
            <input type="text" placeholder="기업명 입력">
            <button type="submit" class="search2">검색</button>
        </div>
    </div>
    
    
    
    
    
    
    
    <!-- 게시글 페이징 -->
	    <div id="page_control" style="text-align: center;">
			<%
    			// 전체 페이지 수 계산
    			int pageCnt = Companycnt/pageSize + (Companycnt%pageSize == 0 ? 0 : 1);
				// 한 페이지에 보여줄 게시글 개수
				
				// int Companycnt = list.size(); => 전체 기업의 수 => 20개
				// int pageSize = 10;
				// compantcnt 를 pageSize로 나눈 값이 0 이면 0이 반환되고
				// 0이 아니면 1이 반환된다.
		
				// 삼항 연산자, (A ? B : C)의 형태로 표시된다.
				// 첫번째 인덱스는 조건을 의미하고, 두번째 인덱스는 조건이 참일 경우 리턴되는 값이며
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
    
    
    
    
    
    
    
    

    <div class="list_number">
        <div class="list_n_menu">
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
        </div>
    </div>


    <footer>
        <div class="footerWrap">
            <div>copyright 2022. All RIGHT RESERVED.</div>
        </div>
    </footer>

</body>
</html>