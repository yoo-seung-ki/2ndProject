<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String loginmobile = (String)session.getAttribute("loginmobile"); %>
<% String adid = (String)session.getAttribute("adid"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/login.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
    <script defer src="../js/loginchk.js"></script>
    <script defer src="../js/link.js"></script>
</head>
<body>
  <header>
        <div class="headerWrap">
            <div class="logo">
                <a href="../html/main.html">
                    <img src="../img/logo.png" alt="">
                    <div class="main-title-text">예일장애인박람회</div>
                </a>
            </div>
            <div class="navMenu">
                <ul>
                  <li><a class="menu" href="">팀원소개</a></li>
                  <li><a class="menu" href="">온라인 채용관</a></li>
                  <li><a class="menu" href="">취업 컨텐츠</a></li>
                  <li><a class="menu" href="">내 정보 관리</a></li>
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
                    $(".main-title-text").css("color","#fff");
                    $(".title").css("color","#000");
                    $(".signup-link").css("color","#000");
                    $(".menu").css("color","#fff");
                }else{
                    $("body").css("background-color","#fff");
                    $("body").css("color","#000");                    
                    $(".main-title-text").css("color","#000");
                    $(".menu").css("color","#000");

              
                    
                    
                }
            
                });
            });
            </script>

        </div>
    </header>

<main>
  <div class="wrapper">
      <div clas="title-text">
        <div class="title login">유저 로그인</div>
        <div class="title company-login">기업 로그인</div>
        <div class="title manage-login">관리자 로그인</div>
      </div>
      <div class="select-mode">
        <button id="userlogin">유저 로그인</button>
        <button id="comlogin">기업 로그인</button>
        <button id="mglogin">관리자 로그인</button>
      </div>
      <form action="loginok.jsp" class="ulogin" method="post" name="dislogin">
        <div class="field">
          <input type="text" placeholder="이름을 입력해주세요." name="loginname" required >
        </div>
        <div class="field">
          <input type="text" placeholder="연락처를 입력해주세요." name="loginmobile" maxlength="11" required >
        </div>
        <div class="field">
          <input type="submit" value="로그인" class="loginbtn">
        </div>
        <div class="signup-link">회원이 아니신가요? <a href="./register.jsp">회원가입</a></div>
      </form>
      <form action="loginok.jsp" class="clogin" method="post" name="dislogin">
        <div class="field">
          <input type="text" placeholder="기업명을 입력해주세요." name="cid" required >
        </div>
        <div class="field">
          <input type="password" placeholder="패스워드를 입력해주세요." name="cpw" maxlength="11" required >
        </div>
        <div class="field">
          <input type="submit" value="로그인" class="loginbtn">
        </div>
        <div class="signup-link">회원이 아니신가요? <a href="./register.jsp">회원가입</a></div>
      </form>
      <form action="adminloginok.jsp" class="mlogin" method="post" name="dislogin">
        <div class="field">
          <input type="text" placeholder="아이디를 입력해주세요." name="loginname" required >
        </div>
        <div class="field">
          <input type="password" placeholder="패스워드를 입력해주세요." name="loginmobile" maxlength="11" required >
        </div>
        <div class="field">
          <input type="submit" value="로그인" class="loginbtn">
        </div>
      </form>
  </div>
</main>
<footer>
    <div class="footerWrap">
        <div>copyright 2022. All RIGHT RESERVED.</div>
    </div>
</footer>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="../js/loginmode.js">
 </script>
</html>