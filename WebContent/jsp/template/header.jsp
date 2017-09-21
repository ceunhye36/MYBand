<%@ page contentType="text/html; charset=UTF-8" %> 
 <!-- - 화면 상단 출력용  -->
<%  
String root = request.getContextPath();  
%>
 
<html>
<head>

<style type="text/css">
/* scroll top */
	#remoCon {
		position: fixed;
		width: 30px;
		height: 30px;
		padding:1%;
		right: 15px;
		bottom: 15px;
		display: none;
 } 
 </style>
</head>
<body>
<!-- 상단 메뉴 -->

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/home.jsp"><span class="glyphicon glyphicon-home"></span> HOME</a></li>
<!--         <li><a href="#band">BAND</a></li> -->
<%
	boolean log = session.getAttribute("id")!=null;
	
	if(log){
%>
		<li><a href="<%=root%>/jsp/user/myinfo.jsp"><span class="glyphicon glyphicon-asterisk"></span> MyPage</a></li>
        <li><a href="<%=root%>/jsp/user/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        <li><a><span class="glyphicon glyphicon-user"></span> <%=(String)session.getAttribute("id") %></a></li>
<%	}else{ %>
		<li><a href="<%=root%>/agreement.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#Login" id="loginBtn"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        
<%	} %>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
          <%if(log){ %>
            <li><a href="#" id="crtBand">Create Band</a></li>
          <%} %>
            <li><a href="#Service center">Service center</a></li>
<!--             <li><a href="#">Media</a></li>  -->
          </ul>
        </li>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>

  
        <!-- Modal -->
        
        <!--      login-------------------------------------------------------------------------- -->
  <div class="modal fade" id="loginM" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 50%; min-width: 250px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Log-in</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form class="form" 
          		id="frm_login"
          		method="post"
                action="/login.jsp">
			  <div class="form-group">
			    <label class="text-primary" style="text-align: left;" for="id">ID</label>
			    <div >
			      <input class="form-control" id="id" name="id"type="text">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="text-primary" style="text-align: left;" for="pw">Password Check</label>
			    <div >
			      <input class="form-control" id="pw"name="pw" type="password">
			    </div>
			  </div>
			  <div class="form-group">
			  	  <div>
			        <input type="checkbox" id="cookieLog" name="cookieLog">
			        <label class="text-primary" style="text-align: left;" for="cookieLog">로그인 유지</label>
			      </div>
			  </div>
			</form>
        </div>
        <div class="modal-footer">
          <button type="button" onclick="incheckL()" class="btn btn-default">Login</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- -------create band------------------------------------------------------------------------ -->
  <div class="modal fade" id=crtBandM role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 90%; min-width: 100px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Create BAND</h4>
        </div>
        <div class="modal-body" style="padding:20px 25px;">
          <form class="form"
          		id="frm_crtBand"
          		method="post"
                action="<%=root%>/jsp/band/crtBand.jsp">
			  <div class="form-group" >
			    <label class=" text-primary" style="text-align: right;" for="bname">BAND NAME</label>
			    <div class="">
			      <input type="text" class="form-control" name="b_title" onchange="crtBnamecheck()">
			    </div>
			    <div class="" style="height: 36px;padding-top: 8px;">
			      <span id="crtBnameH" class="help-inline text-primary" >밴드이름을 입력하여 주세요  </span><!-- / 아이디 중복체크 해주세요 / 사용가능한 아이디 입니다 -->
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="text-primary" style="text-align: right;" for="category">Category</label>
			    <div class="" >
			      <select class="form-control" name="b_category" onchange="crtBcategorycheck()">
			      	<option value="">Selected Category</option>
			      	<option value="Study">Study</option>
			      	<option value="Sports">Sports</option>
			      	<option value="Travel">Travel</option>
			      	<option value="Food">Food</option>
			      	<option value="Hobby">Hobby</option>
			      </select>
			    </div>
			    <div class="" style="height: 36px;padding-top: 8px;">
			      <span id="crtBcategoryH" class="help-inline text-primary" >카테고리를 선택하여주세요 </span>
			    </div>
			  </div>
			  
			  <div class="form-group" >
			    <label class=" text-primary" style="text-align: right;" for="bexp">BAND EXPLANATION</label>
			    <div class="">
			      <textarea class="form-control " rows="3"  name="b_exp"  onchange="crtBexpcheck()"></textarea>
			    </div>
			    <div class="" style="height: 36px;padding-top: 8px;">
			      <span id="crtBexpH" class="help-inline text-primary" >밴드에 관한 설명을 입력하여 주세요  </span><!-- / 아이디 중복체크 해주세요 / 사용가능한 아이디 입니다 -->
			    </div>
			  </div>
			  <!-- file은 카테고리별 기본이미지로 자동 입력한다/ 이미지 수정은 manager 권한으로 밴드 home에서 가능하다 -->
			  <div class="form-group">
			    <label class="text-primary" style="text-align: right;" for="inputInfoC">Information disclosure</label>
			    <div class=""style="padding-left: 0px;">
				    <div class="">
				       <input class="" name="b_infop" type="radio" value="Public"  onchange="crtBinfopcheck()"> 
			 	       <label  style="text-align: right;" for="inputInfoCy">공개</label>
				    </div>
				    <div class="">
				      <input class="" name="b_infop" type="radio" value="Private"  onchange="crtBinfopcheck()"> 
					  <label style="text-align: right;" for="inputInfoCn">비공개</label>
				    </div>
			    </div>
			    <div class="" style="height: 36px;padding-top: 8px;">
			      <span id="crtBinfopH" class="help-inline text-primary" >밴드공개 여부를 선택하여주세요</span>
			    </div>
			  </div>
			</form>
        </div>
        <div class="modal-footer">
          <button type="button" onclick="crtBsubmit()" class="btn btn-default">Create</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<!-- 상단 메뉴 끝 -->
