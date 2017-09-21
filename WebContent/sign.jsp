<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->

<!DOCTYPE html>
<html lang="ko">
<head>

<title>HOME</title>

<meta content="charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- IE최신 표준 모드로 렌더링해라 -->
<meta name="viewport" content="width=device-width, initial-scale=1"><!-- 반응형으로 디자인하기 위해 viewport 설정 -->

<link rel="stylesheet" href="/css/bootstrap.min.css"><!-- bootstrap.css를 연결 bootstrap.min.css는 bootstrap.css를 축소(minify)한것 -->

<!-- bootstrap CDN 이용하기 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->

<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]--> <!-- IE9미만 버전으로 접속 했을때 HTML5와 Media Query지원을 위해 스크립트를 연결 -->


<style>
    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<jsp:include page="/jsp/template/header.jsp" />

<!-- 내용 시작 -->
<div class="container-fluid" style="padding-top: 100px;">
<div class="row">
 <div class="col-md-5 col-md-offset-2">
  <h1 class="text-primary">Sign Up_User Info</h1>
 </div>
</div>
<hr><br><br>
<!-- 아이디, 이메일 중복체크와 같은 경우 나중에 ajax,json을 이용하여 변경 Spring... -->
<form class="form-horizontal" 
	  id="frm_sign"
	  name="frm_sign"
	  method="post"
	  autocomplete="off" 
	  action="./signProc.jsp">

  <div class="form-group" >
    <label class="col-sm-4 text-primary" style="text-align: right;" for="sign_id">ID</label>
    <div class="col-sm-2">
      <input type="text" onchange="idcheck1()" class="form-control" id="sign_id" name="id" data-toggle="tooltip" data-trigger="hover" data-placement="bottom" data-original-title="Please ID Check">
    </div>
    <div class="col-sm-1">
      <button type="button" class="btn btn-primary" id="sign_id_cbtn" name="sign_id_cbtn" onclick="idcheck2()">Check</button>
      <input type="hidden" id="chID" name="chID" value="n">
    </div>
    <div class="col-sm-5" style="height: 36px;padding-top: 8px;">
      <span id="id_span" class="help-inline text-primary" >아이디를 입력하여 주세요  </span><!-- / 아이디 중복체크 해주세요 / 사용가능한 아이디 입니다 -->
    </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-4 text-primary" style="text-align: right;" for="sign_pw">Password</label>
    <div class="col-sm-3" >
      <input class="form-control" id="sign_pw" name="pw" type="password"onchange="pwcheck1()" >
    </div>
    <div class="col-sm-5" style="height: 36px;padding-top: 8px;">
      <span id="pw_span" class="help-inline text-primary" >비밀번호를 입력하여주세요 </span>
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 text-primary" style="text-align: right;" for="sign_pwc">Password Check</label>
    <div class="col-sm-3">
      <input class="form-control" id="sign_pwc" name="pwc" type="password" onchange="pwcheck2()">
    </div>
    <div class="col-sm-5" style="height: 36px;padding-top: 8px;">
      <span id="pwc_span" class="help-inline text-primary" >비밀번호를 동일하게 입력하여주세요 </span>
    </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-4 text-primary" style="text-align: right;" for="sign_u_name">Name</label>
    <div class="col-sm-3" style="padding-left: 0px;">
      <div class="col-sm-8">
       <input class="form-control" id="sign_u_name" name="u_name" type="text"onchange="nameheck()">
      </div>
    </div>
    <div class="col-sm-5" style="height: 36px;padding-top: 8px;">
      <span id="u_name_span" class="help-inline text-primary" >이름을 입력하여주세요 </span>
    </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-4 text-primary" style="text-align: right;" for="sign_email">E-MAIL</label>
    <div class="col-sm-2" >
       <input class="form-control" id="sign_email" name="email" type="email" onchange="emailcheck1()">
    </div>
    <div class="col-sm-1">
      <button type="button" class="btn btn-primary" id="sign_id_cbtn" onclick="emailcheck2()">Check</button>
      <input type="hidden" id="chEMAIL" name="chEMAIL" value="n">
    </div>
    <div class="col-sm-5" style="height: 36px;padding-top: 8px;">
      <span id="email_span" class="help-inline text-primary" >이메일을 입력하여주세요 </span>
    </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-4 text-primary" style="text-align: right;" for="sign_u_infop">Information disclosure</label>
    <div class="col-sm-3"style="padding-left: 0px;">
	    <div class="col-sm-4">
 	       <label  style="text-align: right;" for="inputInfoCy">Public</label>
	       <input class="" name="u_infop"id="sign_u_infop" type="radio" value="Public" onchange="infocheck()"> 
	    </div>
	    <div class="col-sm-4">
		  <label style="text-align: right;" for="inputInfoCn">Private</label>
	      <input class="" name="u_infop"id="sign_u_infop2" type="radio" value="Private" onchange="infocheck()"> 
	    </div>
    </div>
    <div class="col-sm-5" style="height: 36px;padding-top: 8px;">
      <span id="u_infop_span" class="help-inline text-primary" >정보공개 여부를 선택하여주세요</span>
    </div>
  </div>
  <br><br>
  <div class="form-group">
    <div class="col-sm-6 col-sm-offset-6">
    	<button type="button" onclick="submitInfo()" class="btn btn-primary" id="signBtn">Sign Up</button>
    </div>
  </div>
</form>


</div><br>
<!-- 내용 끝 -->

<jsp:include page="/jsp/template/footer.jsp" />

<script type="text/javascript">
function idcheck1() {
	var f = document.getElementById("frm_sign");
	if(f.id.value != "" && f.chID.value=='y'){
		document.getElementById("id_span").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else if(f.id.value != "" && f.chID.value=='n'){
		document.getElementById("id_span").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;아이디 중복확인이 필요합니다.</p>";
	}else{
		document.getElementById("id_span").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;아이디를 입력하여 주세요</p>";
	}
}
/* 일반 팝업 */
function idcheck2() {
	document.getElementById('chID').value='n';
	if(document.getElementById('sign_id').value==""){
		 alert("아이디를 입력하여 주세요");
		 document.getElementById('sign_id').focus();
		 return false;
	 }else{
		var site='./idcheck.jsp';
		site+='?id='+document.getElementById('sign_id').value;
		var style='width=450, height=350'; //팝업창크키
		
		var winHeight = document.body.clientHeight;	// 현재창의 높이
		var winWidth = document.body.clientWidth;	// 현재창의 너비
		var winX = window.screenLeft;	// 현재창의 x좌표
		var winY = window.screenTop;	// 현재창의 y좌표
	
		var popX = winX + (winWidth - 450)/2;
		var popY = winY + (winHeight - 350)/2;
		
		style+=',left='+popX+',top='+popY;// 팝업창 위치 설정
		
		window.open(site, 'ID Check', style);
		idcheck1();
	 }
}


function pwcheck1() {
	var f = document.getElementById("frm_sign");
	if(f.pw.value != ""){
		document.getElementById("pw_span").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("pw_span").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;비밀번호를 입력하여주세요</p>";
	}
	pwcheck2();
}
function pwcheck2() {
	var f = document.getElementById("frm_sign");
	
	if(f.pw.value == ""){
		document.getElementById("pwc_span").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-alert'></span>&ensp;비밀번호 재확인이 필요합니다.</p>";
	}else if(f.pw.value == f.pwc.value){
		document.getElementById("pwc_span").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("pwc_span").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;동일한 비밀번호를 입력하여주세요</p>";
	}
}

function nameheck() {
	var f = document.getElementById("frm_sign");
	if(f.u_name.value !=""){
		document.getElementById("u_name_span").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("u_name_span").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;이름을 입력하여주세요</p>";
	}
}

function emailcheck1() {
	var f = document.getElementById("frm_sign");
	if(f.email.value != "" && f.chEMAIL.value=='y'){
		document.getElementById("email_span").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else if(f.email.value != "" && f.chEMAIL.value=='n'){
		document.getElementById("email_span").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;이메일 중복확인이 필요합니다.</p>";
	}else{
		document.getElementById("email_span").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;이메일을 입력하여 주세요</p>";
	}
}
/* 일반 팝업 */
function emailcheck2() {
	document.getElementById('chEMAIL').value='n';
	if(document.getElementById('sign_email').value==""){
		 alert("이메일을 입력하여 주세요");
		 document.getElementById('sign_email').focus();
		 return false;
	 }else{
		var site='./emailcheck.jsp';
		site+='?email='+document.getElementById('sign_email').value;
		var style='width=450, height=350'; //팝업창크키
		
		var winHeight = document.body.clientHeight;	// 현재창의 높이
		var winWidth = document.body.clientWidth;	// 현재창의 너비
		var winX = window.screenLeft;	// 현재창의 x좌표
		var winY = window.screenTop;	// 현재창의 y좌표
	
		var popX = winX + (winWidth - 450)/2;
		var popY = winY + (winHeight - 350)/2;
		
		style+=',left='+popX+',top='+popY;// 팝업창 위치 설정
		
		window.open(site, 'EMAIL Check', style);
		emailcheck1();
	 }
}

function infocheck() {
	var f = document.getElementById("frm_sign");
	if(f.u_infop[0].checked==false && f.u_infop[1].checked==false){
		document.getElementById("u_infop_span").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;정보공개 여부를 선택하여주세요</p>";
	}else{
		document.getElementById("u_infop_span").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}
}

function submitInfo() {
	var f = document.getElementById("frm_sign");
	if(f.id.value==""){
		alert("아이디를 입력 해주세요");
		f.id.focus();
		return false;
	}else if(f.chID.value=="n"){
		alert("아이디를 중복확인 해주세요");
		f.id_cbtn.focus();
		return false;
	}else if(f.pw.value==""){
		alert("비밀번호를 입력 해주세요");
		f.pw.focus();
		return false;
	}else if(f.pwc.value != f.pw.value){
		alert("비밀번호 재확인을 해주세요");
		f.pwc.focus();
		return false;
	}else if(f.u_name.value==""){
		alert("이름을 입력 해주세요");
		f.u_name.focus();
		return false;
	}else if(f.email.value==""){
		alert("이메일을 입력 해주세요");
		f.email.focus();
		return false;
	}else if(f.chEMAIL.value=="n"){
		alert("이메일을 중복확인 해주세요");
		f.email_cbtn.focus();
		return false;
	}else if(f.u_infop[0].checked==false && f.u_infop[1].checked==false){
		alert("정보공개 여부를 선택하여 주세요");
		f.u_infop[0].focus();
		return false;
	}
	
	f.submit();
}

/* 모달팝업 */
/* window.showModalDialog():: IE,firefox,safari에서는 가능 but 크롬에서 not working */
/* 
function idcheck() {
	
	 if(document.getElementById('id').value==""){
		 alert("아이디를 입력하여 주세요");
		 document.getElementById('id').focus();
		 return false;
	 }else{
		 var args = new Array();
		 args['id'] =document.getElementById('id').value;
		 
		 var site='./idcheck.jsp';
	 	 var style='dialogWidth:300px; dialogHeight:350px';
	
		 var winHeight = document.body.clientHeight;	// 현재창의 높이
		 var winWidth = document.body.clientWidth;	// 현재창의 너비
		 var winX = window.screenLeft;	// 현재창의 x좌표
		 var winY = window.screenTop;	// 현재창의 y좌표
	
		 var popX = winX + (winWidth - 300)/2;
		 var popY = winY + (winHeight - 350)/2;
		
		 style+='dialogLeft='+popX+',dialogTop='+popY;// 팝업창 위치 설정
		 var dialogID= window.showModalDialog(site,args, style);
		 
		 return dialogID;
	 }
 }
 */
 </script>
</body>
</html>