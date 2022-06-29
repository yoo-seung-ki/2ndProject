<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/login.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
    <script defer src="../js/loginchk.js"></script>
</head>
<body>
 <header>
         <header>
        <div class="headerWrap">
            <div class="logo">
                <a href="./main.jsp">
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
            <div class="changeBtn">고대비
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
            <div class="signin-signup">
				<button class="signin1" onclick="location.href='./login.jsp';">로그인</button>
                <button class="signup1" onclick="location.href='./register.jsp';">회원가입</button>
            </div>
        </div>
    </header>

<main>
  <div class="wrapper">
    <div class="title-text">
      <div class="title login">유저 로그인</div>
      <div class="title signup">관리자 로그인</div>
    </div>
    <div class="form-container">
      <div class="slide-controls">
        <input type="radio" name="slide" id="login" checked>
        <input type="radio" name="slide" id="signup">
        <label for="login" class="slide login">유저 로그인</label>
        <label for="signup" class="slide signup">관리자 로그인</label>
        <div class="slider-tab"></div>
      </div>
      <div class="form-inner">
        <form action="loginok.jsp" class="login" method="post" name="dislogin">
          <div class="field">
            <input type="text" placeholder="이름을 입력해주세요." name="loginname" required >
          </div>
          <div class="field">
            <input type="text" placeholder="연락처를 입력해주세요." name="loginmobile" maxlength="11" required >
          </div>
          <div class="field btn">
            <div class="btn-layer"></div>
            <input type="submit" value="로그인" onclick="loginChk()">
          </div>
          <div class="signup-link">회원이 아니신가요? <a href="./register.jsp">회원가입</a></div>
        </form>
        <form action="#" class="login" name="managelogin">
          <div class="field">
            <input type="text" placeholder="아이디를 입력해주세요." name="manageid" required>
          </div>
          <div class="field">
            <input type="password" placeholder="패스워드를 입력해주세요." name="managepw" required>
          </div>
          <div class="field btn">
            <div class="btn-layer"></div>
            <input type="submit" value="로그인" onclick="manageloginChk()">
          </div>
        </form>
      </div>
    </div>
  </div>
</main>
<footer>
    <div class="footerWrap">
        <div>copyright 2022. All RIGHT RESERVED.</div>
    </div>
</footer>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
      const loginText = document.querySelector(".login-title-text .login");
      const loginForm = document.querySelector("form.login");
      const loginBtn = document.querySelector("label.login");
      const signupBtn = document.querySelector("label.signup");
      signupBtn.onclick = (()=>{
        loginForm.style.marginLeft = "-50%";
        loginText.style.marginLeft = "-50%";
      });
      loginBtn.onclick = (()=>{
        loginForm.style.marginLeft = "0%";
        loginText.style.marginLeft = "0%";
      });
      signupLink.onclick = (()=>{
        signupBtn.click();
        return false;
      });
 </script>
</html>