<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
 <link rel="stylesheet" href="../css/register.css">
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
 <script defer src="../js/registerChk.js">

 </script>
</head>
<body>
    <header>
        <div class="headerWrap">
            <div class="logo">
                <a href="home.jsp">
                    <img src="../img/logo.png" alt="">
                    <div class="title-text">예일장애인박람회</div>
                </a>
            </div>
            <div class="navMenu">
                <ul>
                    <li>회원가입</li>
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
                    $(".title-text").css("color","#fff");
                    $(".menu").css("color","#fff");
                }else{
                    $("body").css("background-color","#fff");
                    $("body").css("color","#000");                    
                    $(".title-text").css("color","#000");
                    $(".menu").css("color","#000");
                    
                    
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
    
    <main>
        <div id="user-register-page">
            <p class="user-regi">참여자 정보 입력</p>
             <form class="logform2" name="regiFrm">
                <div class="info-insert">
                성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명 <input type="text" class="insert-info" name="reginame" placeholder="성명을 입력해주세요."><br>
                주민번호 <input type="number" placeholder="주민번호 앞자리" maxlength="6" class="ssn" name="ssnf" oninput="numberMaxLength(this);" > - <input type="number" placeholder="주민번호 뒷자리" maxlength="7" class="ssn" name="ssnb" oninput="numberMaxLength(this);"/><br>
                <script>
                    function numberMaxLength(e){
                        if(e.value.length > e.maxLength){
                            e.value = e.value.slice(0,e.maxLength);
                        }
                    }
                </script>
                거주지역 <select class="insert-info" name="address">
                        <option value="구분">구분</option>
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
                        <option value="other">기타(직접 입력)</option>
                </select><br>
                전화번호 <input type="text" class="insert-info" name="Pnum" maxlength="11" placeholder="연락처를 입력해주세요.">
                <p class="warn">연락처 숫자만 입력해주세요. '-' 제외</p>
                장애유형 <select class="insert-info" name="type">
                	<option value="구분">구분</option>
                    <option value="지체장애">지체장애</option>
                    <option value="뇌병변장애">뇌병변장애</option>
                    <option value="시각장애">시각장애</option>
                    <option value="청각장애">청각장애</option>
                    <option value="언어장애">언어장애</option>
                    <option value="안면장애">안면장애</option>
                    <option value="신장장애">신장장애</option>
                    <option value="심장장애">심장장애</option>
                    <option value="호흡기장애">호흡기장애</option>
                    <option value="간장애">간장애</option>
                    <option value="장루+요루장애">장루+요루장애</option>
                    <option value="뇌전증장애">뇌전증장애</option>
                    <option value="지적장애">지적장애</option>
                    <option value="자폐성장애">자폐성장애</option>
                    <option value="정신장애">정신장애</option>
                    <option value="기타">기타</option>
                </select><br>
                장애정도 <select class="insert-info" name="degree">
                    <option value="구분">구분</option>
                    <option value="심한 정도">심한 정도</option>
                    <option value="심하지 않은 정도">심하지 않은 정도</option>
                </select>
            <label class="insert-check">
                <input type="checkbox" class="check-box"  id="agree" onclick="btnable(this)"><span class="on"></span><p class="agree">개인정보 수집 및 활용에 동의</p><br>
            </label>
                    <p class="agree2">(개인정보는 취업지원 및 취업박람회<br>
                    통계자료로 활용됩니다.)</p>
                
                </div>
                <div class="regi-btn">
                 <button id="submit" name="regibtn" onclick="regiChk()" disabled>회원가입</button>
                 
                </div>
             </form>
        </div> <!--user-register-page-->
    </main>
    <footer>
        <div class="footerWrap">
            <div>copyright 2022. All RIGHT RESERVED.</div>
        </div>
    </footer>
</body>
</html>