<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<jsp:useBean id="user" class="model.user.UserVO"/>
<% 
 String id = (String)session.getAttribute("id");
 user = udao.selectUserOne(id);
%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>MyPage</title>

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
<div class="container-fluid" style="padding-top: 50px; min-height: 480px;">
  <div class="row content" style="padding-right: 1%;"><!--  hidden-xs -->
    <div class="col-sm-3 sidenav hidden-xs"  style="width:15%; top: 50px;position: fixed;">
      <h2>MyPage</h2>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="/jsp/user/myinfo.jsp">MyInfo</a></li>
        <li ><a href="/jsp/user/myband.jsp">MyBand</a></li>
        <li><a href="/jsp/user/calendar.jsp">Calendar</a></li>
      </ul><br>
    </div>
    
     <div class="col-sm-3 sidenav visible-xs" >
      <h2>MyPage</h2>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="/jsp/user/myinfo.jsp">MyInfo</a></li>
        <li><a href="/jsp/user/myband.jsp">MyBand</a></li>
        <li><a href="/jsp/user/calendar.jsp">Calendar</a></li>
      </ul><br>
    </div>
    <br>
    
    <div class="col-sm-7 col-sm-offset-2"  style="border-right: 1px solid #eeeeee;">
    	<div class="container-fluid" >
		<div class="row">
		 <div class="col-md-12 col-md-offset-1">
		  <h1 class="text-primary">My Info</h1>
		 </div>
		</div>
		<br><br>
	    <div class="container-fluid">
	      <div class="row">
	      	<label class="col-sm-2 text-primary" style="text-align: right;" for="id">ID</label>
	      	<div class="col-sm-3 text-primary" id="id"><%=user.getId() %></div>
	      	<div class="col-sm-1">
		      <button type="button" class="btn btn-primary" id="mPw">비밀번호변경</button>
		    </div>
	      </div>
	      <hr>
	      <div class="row">
	      	<label class="col-sm-2 text-primary" style="text-align: right;" for="name">Name</label>
	      	<div class="col-sm-3 text-primary" id="name"><%=user.getU_name() %></div>
	      	<div class="col-sm-1">
		      <button type="button" class="btn btn-primary" id="mName">수정</button>
		    </div>
	      </div>
	      <hr>
	      <div class="row">
	      	<label class="col-sm-2 text-primary" style="text-align: right;" for="email">E-mail</label>
	      	<div class="col-sm-3 text-primary" id="email"><%=user.getEmail() %></div>
	      	<div class="col-sm-1">
		      <button type="button" class="btn btn-primary" id="mEmail">수정</button>
		    </div>
	      </div>
	      <hr>
	      <div class="row">
	      	<label class="col-sm-2 text-primary" style="text-align: right;" for="infoC">Information disclosure</label>
	      	<div class="col-sm-3 text-primary" id="infoC"><%=user.getU_infop() %></div>
	      	<div class="col-sm-1">
		      <button type="button" class="btn btn-primary" id="mInfoc">수정</button>
		    </div>
	      </div>
	      <!-- 
	      <hr>
	      <div class="row">
	      	<label class="col-sm-2 text-primary" style="text-align: right;margin-top: 5px;" for="band">RegiBand</label>
	      	<div class="col-sm-9 text-primary" id="band">
	      		<div class="row">
	      		<div class=" text-primary">
	      			<table class="table table-hover table-condensed">
				    <thead>
				      <tr>
				        <th>Name of BAND</th>
				        <th>Category</th>
				        <th>등급</th>
				        <th>Regi-Date</th>
				        <th>탈퇴</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td>여행가자</td>
				        <td>TRAVEL</td>
				        <td>General</td>
				        <td>2017-01-12</td>
				        <td><button type="button" class="btn btn-danger">탈퇴</button></td>
				      </tr>
				      <tr>
				        <td>공부하자</td>
				        <td>STUDY</td>
				        <td>Manager</td>
				        <td>2017-01-12</td>
				        <td><button type="button" class="btn btn-danger">탈퇴</button></td>
				      </tr>
				      <tr>
				        <td>운동하자</td>
				        <td>EXERCISE</td>
				        <td>General</td>
				        <td>2017-01-12</td>
				        <td><button type="button" class="btn btn-danger">탈퇴</button></td>
				      </tr>
				      <tr>
				        <td>여행가자</td>
				        <td>TRAVEL</td>
				        <td>General</td>
				        <td>2017-01-12</td>
				        <td><button type="button" class="btn btn-danger">탈퇴</button></td>
				      </tr>
				      <tr>
				        <td>공부하자</td>
				        <td>STUDY</td>
				        <td>Manager</td>
				        <td>2017-01-12</td>
				        <td><button type="button" class="btn btn-danger">탈퇴</button></td>
				      </tr>
				      <tr>
				        <td>운동하자</td>
				        <td>EXERCISE</td>
				        <td>General</td>
				        <td>2017-01-12</td>
				        <td><button type="button" class="btn btn-danger">탈퇴</button></td>
				      </tr>
				    </tbody>
				  </table>
			  </div>
			  </div>
	      	</div>
	      </div>
	       -->
	    </div>
    </div>
  </div>
  
   <div class="col-sm-3" >
   		<div class="container-fluid">
		<div class="row">
			<button class="btn btn-large btn-block btn-primary hidden-xs" type="button" id="signoutBtn" style="margin-top:30%; height: 100px;font-size: 30px;font-weight: bolder;">Sign-OUT</button>
			<button class="btn btn-large btn-block btn-primary visible-xs" type="button" id="signoutBtn" style="height: 100px;font-size: 30px;font-weight: bolder;">Sign-OUT</button>
		</div>
		<br>
		<br>
		<div class="row">
			<button class="btn btn-large btn-block btn-primary" type="button" id="crtBand2" style="height: 100px;font-size: 30px;font-weight: bolder;">Create BAND</button>
		</div>
		</div>
   </div>
</div></div>

  <!---------------------------------------------------------------- Modal -->
  <div class="modal fade" id="mPwM" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  style="width:90%; min-width: 100px;"><!--  style="width: 70%; min-width: 20px;" -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="font-weight: bold;" class="modal-title">비밀번호 변경</h4>
        </div>
        <div class="modal-body" style="padding:40px 25px;">
          <form class="form-horizontal"
          		id="frm_modipw"
          		name="frm_modipw"
          		method="post"
          		action="./modiPw.jsp">
		  <div class="form-group">
		    <label class="col-sm-5 text-primary" style="text-align: right;" for="inputPW">Original Password</label>
		    <div class="col-sm-6" >
		      <input class="form-control" id="orgpw" name="orgpw" type="password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-5 text-primary" style="text-align: right;" for="inputPW">Change Password</label>
		    <div class="col-sm-6" >
		      <input class="form-control" id="chpw" name="chpw" type="password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-5 text-primary" style="text-align: right;" for="inputPWC">Change Password Check</label>
		    <div class="col-sm-6">
		      <input class="form-control" id="chpwc" name="chpwc" type="password">
		    </div>
		  </div>
		</form>
        </div>
        <div class="modal-footer">
          <button type="button" onclick="modipwf()" class="btn btn-default">비밀번호 변경</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ------------------------------------------------------------------------------------------------------------------ -->
  <div class="modal fade" id="mNameM" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  style="width:90%; min-width: 100px;"><!--  style="width: 70%; min-width: 20px;" -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modify Name</h4>
        </div>
        <div class="modal-body" style="padding:40px 25px;">
          <form class="form-horizontal"
				id="frm_modiname"
          		name="frm_modiname"
          		method="post"
          		action="./modiName.jsp">
		  <div class="form-group">
		    <label class="col-sm-4 text-primary" style="text-align: right;" for="inputPW">Password</label>
		    <div class="col-sm-6" >
		      <input class="form-control" name="pw" type="password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-4 text-primary" style="text-align: right;" for="inputName">Change Name</label>
		    <div class="col-sm-6">
		      <input class="form-control" name="u_name" type="text" value="<%=user.getU_name()%>">
		    </div>
		  </div>
		</form>
        </div>
        <div class="modal-footer">
          <button type="submit" onclick="modinamef()" class="btn btn-default">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ------------------------------------------------------------------------------------------------------------------ -->
  <div class="modal fade" id="mEmailM" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  style="width:90%; min-width: 100px;"><!--  style="width: 70%; min-width: 20px;" -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modify E-Mail</h4>
        </div>
        <div class="modal-body" style="padding:40px 25px;">
          <form class="form-horizontal"
				id="frm_modiemail"
          		name="frm_modiemail"
          		method="post"
          		action="./modiEmail.jsp">
		  <div class="form-group">
		    <label class="col-sm-4 text-primary" style="text-align: right;" for="inputPW">Password</label>
		    <div class="col-sm-7" >
		      <input class="form-control" name="pw" type="password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-4 text-primary" style="text-align: right;" for="inputEmail">Change E-Mail</label>
		    <div class="col-sm-5">
		      <input class="form-control" name="email" type="text" value="<%=user.getEmail()%>">
		    </div>
		    <div class="col-sm-1">
		      <button type="button" class="btn btn-primary"  onclick="emailcheck2()">Check</button>
		      <input type="hidden" id="chEMAIL" name="chEMAIL" value="n">
		    </div>
		  </div>
		</form>
        </div>
        <div class="modal-footer">
          <button type="submit" onclick="modiemailf()" class="btn btn-default">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ------------------------------------------------------------------------------------------------------------------ -->
  <div class="modal fade" id="mInfocM" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  style="width:90%; min-width: 100px;"><!--  style="width: 70%; min-width: 20px;" -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modify Information Disclosure</h4>
        </div>
        <div class="modal-body" style="padding:40px 25px;">
          <form class="form-horizontal"
				id="frm_modiinfop"
          		name="frm_modiinfop"
          		method="post"
          		action="./modiInfop.jsp">
		  <div class="form-group">
		    <label class="col-sm-5 text-primary" style="text-align: right;" for="inputPW">Password</label>
		    <div class="col-sm-6" >
		      <input class="form-control" name="pw" type="password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-5 text-primary" style="text-align: right;" for="inputPW">Change Password</label>
		    <div class="col-sm-6"style="padding-left: 0px;">
		    <div class="col-sm-4">
		       <input class="" name="u_infop" type="radio" value="Public" 
		       <%if(user.getU_infop().equals("Public")) out.print("checked='checked'"); %>
		       > 
	 	       <label  style="text-align: right;" for="inputInfoCy">Public</label>
		    </div>
		    <div class="col-sm-4">
		      <input class="" name="u_infop" type="radio" value="Private"
		      <%if(user.getU_infop().equals("Private")) out.print("checked='checked'"); %>
		      > 
			  <label style="text-align: right;" for="inputInfoCn">Private</label>
		    </div>
	    </div>
		  </div>
		</form>
        </div>
        <div class="modal-footer">
          <button type="button" onclick="modiinfopf()" class="btn btn-default">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- ------------------------------------------------------------------------------------------------------------------ -->
  <div class="modal fade" id="dUserM" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  style="width:90%; min-width: 100px;"><!--  style="width: 70%; min-width: 20px;" -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Drop User Information</h4>
        </div>
        <div class="modal-body" style="padding:40px 80px;">
          <form class="form-horizontal"
          		method="post"
          		id="frm_delinfo"
          		name="frm_delinfo"
          		action="./signout.jsp">
          <div class="form-group">
		    <div class="col-sm-12 text-danger" align="left">
		      회원정보 삭제를 원하시면 비밀번호 입력 후 삭제버튼을 클릭해주세요. 삭제된 회원정보는 복구가 어렵습니다. 
		    </div>
		  </div><br>
		  <div class="form-group" align="center">
		  <div class="row">
		    <label class="col-sm-2 col-sm-offset-2 text-primary" style="text-align: right;" for="inputPW">Password</label>
		    <div class="col-sm-6" >
		      <input class="form-control" id="inputPW" name="pw"type="password">
		    </div>
		    </div>
		  </div>
		</form>
        </div>
        <div class="modal-footer">
          <button type="button" onclick="if(document.getElementById('frm_delinfo').pw.value==''){alert('비밀번호를 입력하세요');this.pw.focus();return false;}document.getElementById('frm_delinfo').submit(); " class="btn btn-default">삭제</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
<!-- 내용 끝 -->

<jsp:include page="/jsp/template/footer.jsp" />

<script>
$(document).ready(function(){
    $("#mPw").click(function(){
        $("#mPwM").modal('show').css({ 
			'margin-top':function(){//vertical
				return -($(this).height()-$(this).height()/100*102);
			},        	
        	'margin-left':function(){//horizontal
        		return -($(this).width()-$(this).width()/100*105);
        	}
        });
    });
    $("#mName").click(function(){
        $("#mNameM").modal('show').css({ 
			'margin-top':function(){//vertical
				return -($(this).height()-$(this).height()/100*102);
			},        	
        	'margin-left':function(){//horizontal
        		return -($(this).width()-$(this).width()/100*105);
        	}
        });
    });
    $("#mEmail").click(function(){
        $("#mEmailM").modal('show').css({ 
			'margin-top':function(){//vertical
				return -($(this).height()-$(this).height()/100*102);
			},        	
        	'margin-left':function(){//horizontal
        		return -($(this).width()-$(this).width()/100*105);
        	}
        });
    });
    $("#mInfoc").click(function(){
        $("#mInfocM").modal('show').css({ 
			'margin-top':function(){//vertical
				return -($(this).height()-$(this).height()/100*102);
			},        	
        	'margin-left':function(){//horizontal
        		return -($(this).width()-$(this).width()/100*105);
        	}
        });
    });
    $("#crtBand2").click(function(){
        $("#crtBandM").modal('show').css({ 
        	'margin-top':function(){//vertical
				return -($(this).height()-$(this).height()/100*99);
			},        	
        	'margin-left':function(){//horizontal
        		return -($(this).width()-$(this).width()/100*105);
        	}
        });
    });
    $("#signoutBtn").click(function(){
        $("#dUserM").modal('show').css({ 
        	'margin-top':function(){//vertical
				return -($(this).height()-$(this).height()/100*99);
			},        	
        	'margin-left':function(){//horizontal
        		return -($(this).width()-$(this).width()/100*105);
        	}
        });
    });
});

function modipwf() {
	var frm = document.getElementById("frm_modipw");
	
	if(frm.orgpw.value==""){
		alert("기존 비밀번호를 입력하세요");
		frm.orgpw.focus();
		return false;
	}else if(frm.chpw.value==""){
		alert("변경 비밀번호를 입력하세요");
		frm.chpw.focus();
		return false;
	}else if(frm.chpwc.value=="" || frm.chpwc.value !=frm.chpw.value){
		alert("변경비밀번호를 확인해주세요_위와 동일하게 입력하셔야 합니다.");
		frm.chpwc.focus();
		return false;
	}
	
	frm.submit();
}
function modinamef() {
	var frm = document.getElementById("frm_modiname");
	
	if(frm.pw.value==""){
		alert("비밀번호를 입력해주세요");
		frm.pw.focus();
		return false;
	}else if(frm.u_name.value==""){
		alert("변경할 이름을 입력하여주세요");
		frm.u_name.focus();
		return false;
	}
	frm.submit();
}

function emailcheck2() {
	document.getElementById('chEMAIL').value='n';
	var frm= document.getElementById('frm_modiemail');
	if(frm.email.value==""){
		 alert("이메일을 입력하여 주세요");
		 frm.email.focus();
		 return false;
	 }else{
		var site='./emailcheck.jsp';
		site+='?email='+frm.email.value;
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
function modiemailf() {
var frm = document.getElementById("frm_modiemail");
	
	if(frm.pw.value==""){
		alert("비밀번호를 입력해주세요");
		frm.pw.focus();
		return false;
	}else if(frm.email.value==""){
		alert("변경할 이메일을 입력하여주세요");
		frm.u_name.focus();
		return false;
	}else if(frm.chEMAIL.value=='n'){
		alert("이메일 중복확인 부탁드립니다.");
		frm.email.focus();
		return false;
	}
	frm.submit();
}
function modiinfopf() {
var frm = document.getElementById("frm_modiinfop");
	
	if(frm.pw.value==""){
		alert("비밀번호를 입력해주세요");
		frm.pw.focus();
		return false;
	}else if(frm.u_infop[0].checked==false && frm.u_infop[1].checked==false){
		alert("정보공개 여부를 선택하여 주세요");
		frm.u_infop[0].focus();
		return false;
	}
	frm.submit();
}
</script>
</body>
</html>