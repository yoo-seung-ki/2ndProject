<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 회원가입</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../css/company.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
    <script>
    	function submitfunc() {
    		if(confirm("정말 신청하시겠습니까?") == true) {
    			document.getElementById("profrm").submit();
    		} else {
    			return event.preventDefault();
    		}
    	}
    </script>
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
        </div> <!-- logo -->
        
        <div class="navMenu">
            <ul>
                <li>기업 회원가입</li>
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
                    $(".good").css("filter","invert(100%)");
                    $(".bannerTitle").css("color","#000");
                    $(".companybanner").css("filter","invert(100%)");
                    $("th").css("color","#000");
                    $("td").css("color","#fff");
                }else{
                    $("body").css("background-color","#fff");
                    $("body").css("color","#000");
                    $(".title-text").css("color","#000");
                    $(".good").css("filter","invert(0%)");
                    $(".companybanner").css("filter","invert(0%)");
                    $("td").css("color","#000");
                    
                    
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
            <h1>기업 회원가입</h1>
        </div>
    </div>
    <main>
    <!-- 회사배너 -->
   	
    <div class="companyWrap">
        <div class="companybanner">
            <img src="" class="uploadimage" width="350" alt="회사배너">
        </div>
    </div>
  <!--회사 정보? -->
  	<div class="company-info">
  		<form name = "imageFrm" method="post" enctype="multipart/form-data" action="companyinfo.jsp">
			<div>
			    <img src="../img/good1.png" class="good"  width="45" height="45">기업정보 
			   		<input type="file" id="file" name="file"  accept="image/*" onchange="changeValue(this)"/>
			   		<button type="button" id="btn-upload" style="float:right;">이미지업로드</button>
			
				<script>
				    $(function () {
				    	$('#btn-upload').click(function (e) {
				    		e.preventDefault();
				    		$('#file').click();
				    		});
				    	}); 
				     function changeValue(obj){
						alert(obj.value);
					}
				
				</script>
			</div>
	  	</form>
	  <form id="profrm" action="comregisterproc.jsp">
		<table style="width:1200px; height:120px;">
			<tr>
		        <th>아&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;디</th>
		        <td colspan="3"> <input name="companyid" type="text"  placeholder="아 이 디"></td>
		        <th>비 밀 번 호</th>
		        <td colspan="3"> <input name="companypassword" type="password"  placeholder="비 밀 번 호	"></td>
		    </tr>
		    <tr>
		        <th>기&nbsp;&nbsp;&nbsp;업&nbsp;&nbsp;&nbsp;명</th>
		        <td colspan="3"> <input name="companyname" type="text"  placeholder="기 업 명"></td>
		        <th>홈 페 이 지</th>
		        <td colspan="3"> <input name="homepage" type="text"  placeholder="홈 페 이 지"></td>
		    </tr>
		    <tr>
		        <th>대&nbsp;&nbsp;&nbsp;표&nbsp;&nbsp;&nbsp;자</th>
		        <td colspan="3"> <input name="ceo" type="text"  placeholder="대 표 자"></td>
		        <th>업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</th>
		        <td colspan="3"> <input name="companytype" type="text"  placeholder="업 종"></td>
		    </tr>
		    <tr>
		        <th>설 립 시 기</th>
		        <td colspan="3"> <input name="createyear" type="text"  placeholder="설 립 시 기"></td>
		        <th>사 업 내 용</th>
		        <td colspan="3"> <input name="companycontent" type="text"  placeholder="사 업 내 용"></td>
		    </tr>
		    <tr>
		        <th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
		        <td colspan="3"> <input name="address" type="text"  placeholder="주 소"></td>
		        <th>규&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모</th>
		        <td colspan="3"> <input name="companysize" type="text"  placeholder="규 모"></td>
		    </tr>
		</table>
		
	</div><!-- companyinfo -->
	
		<div style="float:right">
		    <button type="button" onclick="submitfunc()" class="regist">기업 회원가입</button>
		    <button type="button" onclick="history.back()" class="back">취소</button>
		</div>
	</form>

</main>
    <footer>
        <div class="footerWrap">
            <div>copyright 2022. All RIGHT RESERVED.</div>
        </div>
    </footer>
<script src="../js/chart.js"></script>
</body>
</html>