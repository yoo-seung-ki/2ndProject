<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                    <div>예일장애인박람회</div>
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
                <div class="enterpriseCard">
                    <a href="">
                        <img class="cardImg" src="" alt="카드1">
                        <div class="cardInfo">
                            <div>
                                <p>기업이름</p>
                                <p>입사현황</p>
                            </div>
                            <div>
                                <p>기업위치</p>
                                <p>직무</p>
                            </div>
                            <div>
                                <p>지원기간</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="enterpriseCard">
                    <a href="">
                        <img class="cardImg" src="" alt="카드2">
                        <div class="cardInfo">
                            <div>
                                <span>기업이름</span>
                                <span>입사현황</span>
                            </div>
                            <div>
                                <span>기업위치</span>
                                <span>직무</span>
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
                                <span>기업이름</span>
                                <span>입사현황</span>
                            </div>
                            <div>
                                <span>기업위치</span>
                                <span>직무</span>
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
                                <span>기업이름</span>
                                <span>입사현황</span>
                            </div>
                            <div>
                                <span>기업위치</span>
                                <span>직무</span>
                            </div>
                            <div>
                                <span>지원기간</span>
                            </div>
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