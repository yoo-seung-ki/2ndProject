<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/login.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
</head>
<body>
 <header>
        <div class="headerWrap">
            <div class="logo">
                <a href="./main.jsp">
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
                    $(".title-text").css("color","#fff");


                }else{
                    $("body").css("background-color","#fff");
                    $("body").css("color","#000");                    
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
        <div class="mode-btn">
        <button type="button" id="user-login" >참여자 로그인</button>
        <button type="button" id="mg-login">관리자 로그인</button>
        <div id="user-login-page">
            <p class="user-login">참여자 로그인</p>
             <form class="logform1">
                <div class="info-insert">
                성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;  <input class="info-name" type="text" placeholder="성명을 입력해주세요."><br>
                 연&nbsp;락&nbsp;처&nbsp;  <input class="info-num" type="text" placeholder="연락처를 입력해주세요."><br>
                </div>
                <div style="display:flex;">
                <div class="login-btn1">
                 <a class="submit">로그인</a>
                </div>
                <div class="login-btn2">
                    <a class="submit" href="./register.jsp">회원가입</a>
                </div>
            </div>
             </form>
         </div> <!-- class= user-login-page-->
         <div id="mg-login-page">
            <p class="mg-login">관리자 로그인</p>
             <form class="logform1">
                <div class="info-insert">
                아&nbsp;이&nbsp;디&nbsp;  <input class="info-name" type="text" placeholder="아이디를 입력해주세요."><br>
                 패스워드  <input class="info-num" type="text" placeholder="패스워드를 입력해주세요."><br>
                </div>
                <div class="login-btn">
                 <a class="submit">로그인</a>
                </div>
             </form>
         </div> <!-- id= mg-login-page-->
        </div> <!--mode-btn-->
</main>
<footer>
    <div class="footerWrap">
        <div>copyright 2022. All RIGHT RESERVED.</div>
    </div>
</footer>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="../js/loginmode.js"></script>
</html>