<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
	String bid = (String)request.getParameter("b_id");
	BandVO band = bdao.selectBandOne(bid);
	List<UBVO> joinulist = bdao.joinUserList(bid);
	boolean joinB=false;
	String grade="U";
	if(session.getAttribute("id").equals(band.getUb_uid())) grade="M";
%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>Band</title>

<meta content="charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- IE최신 표준 모드로 렌더링해라 -->
<meta name="viewport" content="width=device-whidth, initial-scale=1"><!-- 반응형으로 디자인하기 위해 viewport 설정 -->

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
/* 
    .content div{
    	border: 1px solid;
    }
 */
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<jsp:include page="/jsp/template/header.jsp" />

<!-- 내용 시작 -->
<div class="container-fluid" style="padding-top: 50px; min-height: 480px;">
  <div class="row" style="padding-right: 1%;"><!--  hidden-xs -->
    <div class="col-sm-3 sidenav hidden-xs"  style="width:15%; top: 50px;position: fixed;">
		<jsp:include page="./submenu.jsp"/>      
    </div>
    
     <div class="col-sm-3 sidenav visible-xs" >
      	<jsp:include page="./submenu.jsp"/>   
    </div>
    <br>
    
    <div class="content">
    <div class="col-sm-10 col-sm-offset-2" style="padding:20px 40px;"><h1>Band Information</h1><hr></div>
    <div class="col-sm-9 col-sm-offset-2" style="padding-left: 18px;">
    	<div class="row">
		 <div class="col-sm-8">
		  <div class="row">
		   <div class="hidden-xs"><br><br></div>
		   <div class="col-sm-5" style="margin: 0 auto;">
		    <div class="hidden-xs"><br><br><br></div>
		    <img src="<%=root %>/images/storage/<%=band.getB_fname() %>" style="height: 230px;" class="img-rounded" alt="BandImg" width="100%" height="236">
		   <%if(session.getAttribute("id").equals(band.getUb_uid())){ %>
		    <h5 class="text-warning visible-xs">사진수정은 모바일에서 불가능합니다.</h5><!-- manager 권한 -->
		    <button type="button" style="margin-top: 106px" class="btn btn-block btn-warning hidden-xs" id="mimg">Image 수정</button><!-- manager 권한 -->
		   <%} %>
		   </div>
		   <div class="col-sm-7" style="padding-left: 20px;">
		    <div class="row">
		     <div><br><br></div>
		      <label class="col-sm-3 text-primary" style="text-align: left;margin-top: 2px; padding-left: 0px;" for="band">&emsp;BandName</label>
	      	  <div class="col-sm-9 text-primary" style="padding-left: 0px;" id="band"><h2><%=band.getB_title() %></h2></div>  
		    </div>
		    
		  <div class="row">
		   <div>
			 <label class="col-sm-1 text-primary" style="text-align: left;margin-top: 2px;" for="band">BandManager</label>
	      	 <div class="col-sm-11 text-primary" style="height: 72px;" id="band"><h4><br>&emsp;<%=band.getUb_uid() %></h4></div>
		   </div>
		  </div>
		    
		  <div class="row">
		   <div>
			 <label class="col-sm-1 text-primary" style="text-align: left;margin-top: 2px;" for="band">Explanation</label>
	      	 <div class="col-sm-11 text-primary" style="height: 72px;" id="band"><h4><br>&emsp;<%=band.getB_exp() %></h4></div>
		   </div>
		  </div>
		  
		  <div class="row">
		   <div class="col-sm-6" style="padding-left: 0px;">
		    <label class="col-sm-2 text-primary" style="text-align: right;margin-top: 2px;" for="band">Category</label>
	      	<div class="col-sm-10 text-primary" style="padding-top: 2px;" id="band"><h2>&emsp;<%=band.getB_category() %></h2></div>
		   </div>
		  </div>
		  <div class="row">
		   <div class="col-sm-6">
			<label class="col-sm-2 text-primary" style="text-align: left;margin-top: 2px;padding-left: 1px;" for="band">Status</label>
	      	<div class="col-sm-10 text-primary" style="padding-top: 2px;" id="band"><h2>&ensp;<%=band.getB_infop() %></h2></div>
		   </div>
		  </div>
			
	   </div>
	    <%if(session.getAttribute("id").equals(band.getUb_uid())){ %>
	   <div class="col-sm-6"><!-- manager 권한 -->
	   	<h5 class="text-warning visible-xs">정보수정은 모바일에서 불가능합니다.</h5>
	    <button type="button" style="margin-top: 19px" class="btn btn-block btn-warning hidden-xs" id="minfo">Information 수정</button>
	   </div>
	   <%} %>
	  </div>
 </div>
		 
		 <div class="col-sm-4">
		  <div class="row">
		   <div><br><br><br></div>
		   <div  >
		    <label class="text-primary" style="text-align: right;margin-top: 5px;" for="band">Member of Band</label>
	      	<div class="col-sm-12 text-primary" id="band">
	      		<div class="row">
	      		<div class="text-primary">
	      			<table class="table table-hover table-condensed">
				    <thead>
				      <tr>
				        <th>ID</th>
				        <th>등급</th><!-- G=general M=manager -->
				        <th>Board</th>
				        <th>Reply</th>
				         <%if(session.getAttribute("id").equals(band.getUb_uid())){ %>
				        <th></th>
				        <%} %>
				      </tr>
				    </thead>
				    <tbody>
				      <%for(UBVO ub:joinulist){ if(session.getAttribute("id").equals(ub.getUb_uid())) joinB=true; %>
				      <tr>
				        <td><%=ub.getUb_uid() %></td>
				        <td><%=ub.getGrade() %></td>
				        <td>12</td>
				        <td>30</td>
				         <%if(session.getAttribute("id").equals(band.getUb_uid()) && ub.getGrade().equals("U")){ %>
				        <td><button type="button" class="btn btn-danger" onclick="quitB('<%=ub.getUb_uid()%>')">회원탈퇴</button></td><!-- manager권한 -->
				        <%}else{ %>
				        <td></td>
				        <%} %>
				      </tr>
				      <%} %>
				      
				    </tbody>
				  </table>
			  </div>
			  </div>
	      	</div>
		   </div>
		  </div>
		
		 <%if(session.getAttribute("id").equals(band.getUb_uid())){ %>
		  <div class="row">
		   <div class="" ><!-- manager 권한 -->
			 <button onclick="dropB()" class="btn btn-large btn-block btn-danger" type="button" style="margin-top:76px; height: 50px;font-size: 30px;font-weight: bolder;">Drop Band</button>
			</div></div>
		<%}else if(!joinB){ %>
			<div class="row">
		   <div class="" ><!-- manager 권한 -->
			 <button onclick="joinB()" class="btn btn-large btn-block btn-success" type="button" style="margin-top:76px; height: 50px;font-size: 30px;font-weight: bolder;">Join Band</button>
			</div></div>
		<%}else{ %>
			<div class="row">
		   <div class="" ><!-- manager 권한 -->
			 <button onclick="quitB('<%=session.getAttribute("id") %>')" class="btn btn-large btn-block btn-warning" type="button" style="margin-top:76px; height: 50px;font-size: 30px;font-weight: bolder;">Quit Band</button>
			</div></div>
		<%} %>
		   </div>
		  </div>
		 </div>
		</div>
    </div>
    <br>
    </div>
  
  <!---------------------------------------------------------------- Modal -->
 <div class="modal fade" id="mimgm" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  style="width:90%; min-width: 100px;"><!--  style="width: 70%; min-width: 20px;" -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modify File</h4>
        </div>
        <div class="modal-body" style="padding:40px 100px;">
          <form class="form-horizontal"
          		enctype="multipart/form-data"
          		id="frm_upfileBand"
          		name="frm_upfileBand"
          		method="post"
                action="./upfileBand.jsp">
		  
		  	  <input type="hidden" name="b_id" value="<%=band.getB_id()%>">
		  	  <input type="hidden" name="b_oldfname" value="<%=band.getB_fname()%>">
		  	  
			  <div class="form-group" >
			    <label class=" text-primary" style="text-align: right;" for="bimg">BAND IMAGE 수정</label>
			    <div class="">
			      <input id="upBimg" name="upBimg" onchange="upBfilecheck()" type="file" multiple class="file-loading" accept=".jpg,.png,.gif,.jpeg" style="background-color: #338fd0;color: white;">
			    </div>
			    <div class="" style="height: 36px;padding-top: 8px;">
			      <span id="upBfileH" class="help-inline text-primary" >이미지 파일만 업로드 가능합니다.(.jpg,.png,.gif,.jpeg)  </span>
			    </div>
			  </div>
			  
		</form>
        </div>
        <div class="modal-footer">
          <button type="button" onclick="upBfilesubmit()" class="btn btn-default">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ------------------------------------------------------------------------------------------------------------------ -->
  <div class="modal fade" id="minfom" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content"  style="width:90%; min-width: 100px;"><!--  style="width: 70%; min-width: 20px;" -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modify BAND</h4>
        </div>
        <div class="modal-body" style="padding:40px 25px;">
          <form class="form"
          		id="frm_upBand"
          		name="frm_upBand"
          		method="post"
                action="./upBand.jsp">
                <input type="hidden" name="b_id" value="<%=band.getB_id()%>">
			  <div class="form-group" >
			    <label class=" text-primary" style="text-align: right;" for="bname">BAND NAME</label>
			    <div class="">
			      <input type="text" class="form-control" name="b_title" onchange="upBnamecheck()" value="<%=band.getB_title()%>">
			    </div>
			    <div class="" style="height: 36px;padding-top: 8px;">
			      <span id="upBnameH" class="help-inline text-primary" >밴드이름을 입력하여 주세요  </span><!-- / 아이디 중복체크 해주세요 / 사용가능한 아이디 입니다 -->
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="text-primary" style="text-align: right;" for="category">Category</label>
			    <div class="" >
			      <select class="form-control" name="b_category" onchange="upBcategorycheck()">
			      	<option value="">Selected Category</option>
			      	<option value="Study">Study</option>
			      	<option value="Sports">Sports</option>
			      	<option value="Travel">Travel</option>
			      	<option value="Food">Food</option>
			      	<option value="Hobby">Hobby</option>
			      </select>
			      <script type="text/javascript">
					document.frm_upBand.b_category.value='<%=band.getB_category()%>'
				  </script>
			    </div>
			    <div class="" style="height: 36px;padding-top: 8px;">
			      <span id="upBcategoryH" class="help-inline text-primary" >카테고리를 선택하여주세요 </span>
			    </div>
			  </div>
			  
			  <div class="form-group" >
			    <label class=" text-primary" style="text-align: right;" for="bexp">BAND EXPLANATION</label>
			    <div class="">
			      <textarea class="form-control " rows="3"  name="b_exp"  onchange="upBexpcheck()"><%=band.getB_exp() %></textarea>
			    </div>
			    <div class="" style="height: 36px;padding-top: 8px;">
			      <span id="upBexpH" class="help-inline text-primary" >밴드에 관한 설명을 입력하여 주세요  </span><!-- / 아이디 중복체크 해주세요 / 사용가능한 아이디 입니다 -->
			    </div>
			  </div>
			  <!-- file은 카테고리별 기본이미지로 자동 입력한다/ 이미지 수정은 manager 권한으로 밴드 home에서 가능하다 -->
			  <div class="form-group">
			    <label class="text-primary" style="text-align: right;" for="inputInfoC">Information disclosure</label>
			    <div class=""style="padding-left: 0px;">
				    <div class="">
				       <input class="" name="b_infop" type="radio" value="Public"  onchange="upBinfopcheck()"
				       <%if(band.getB_infop().equals("Public"))out.print("checked='checked'"); %>
				       > 
			 	       <label  style="text-align: right;" for="inputInfoCy">공개</label>
				    </div>
				    <div class="">
				      <input class="" name="b_infop" type="radio" value="Private"  onchange="upBinfopcheck()"
				      <%if(band.getB_infop().equals("Private"))out.print("checked='checked'"); %>
				      > 
					  <label style="text-align: right;" for="inputInfoCn">비공개</label>
				    </div>
			    </div>
			    <div class="" style="height: 36px;padding-top: 8px;">
			      <span id="upBinfopH" class="help-inline text-primary" >밴드공개 여부를 선택하여주세요</span>
			    </div>
			  </div>
			</form>
        </div>
        <div class="modal-footer">
          <button type="button" onclick="upBsubmit()" class="btn btn-default">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
<!-- 내용 끝 -->

<jsp:include page="/jsp/template/footer.jsp" />

<script>
$(document).ready(function(){
    $("#mimg").click(function(){
        $("#mimgm").modal('show').css({ 
			'margin-top':function(){//vertical
				return -($(this).height()-$(this).height()/100*102);
			},        	
        	'margin-left':function(){//horizontal
        		return -($(this).width()-$(this).width()/100*105);
        	}
        });
    });
    $("#minfo").click(function(){
        $("#minfom").modal('show').css({ 
        	'margin-top':function(){//vertical
				return -($(this).height()-$(this).height()/100*99);
			},        	
        	'margin-left':function(){//horizontal
        		return -($(this).width()-$(this).width()/100*105);
        	}
        });
    });
});

//update BAND
function upBnamecheck(){
	var frm = document.getElementById("frm_upBand");
	if(frm.b_title.value != ""){
		document.getElementById("upBnameH").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("upBnameH").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;밴드이름을 입력하여주세요</p>";
	}
}
function upBcategorycheck() {
	var frm = document.getElementById("frm_upBand");
	if(frm.b_category.value != ""){
		document.getElementById("upBcategoryH").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("upBcategoryH").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;카테고리를 선택하여주세요</p>";
	}
}
function upBexpcheck() {
	var frm = document.getElementById("frm_upBand");
	if(frm.b_exp.value != ""){
		document.getElementById("upBexpH").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("upBexpH").innerHTML = "<p class='text-primary'><span class='glyphicon glyphicon-alert'></span>&ensp;밴드에 대한 설명을 입력하여주세요</p>";
	}
}
function upBinfopcheck() {
	var frm = document.getElementById("frm_upBand");
	if(frm.b_infop.value != ""){
		document.getElementById("upBinfopH").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("upBinfopH").innerHTML = "<p class='text-primary'><span class='glyphicon glyphicon-alert'></span>&ensp;밴드공개 여부를 선택하여주세요</p>";
	}
}
function upBsubmit() {
	var frm = document.getElementById("frm_upBand");
	if(frm.b_title.value == ""){
		alert("이름을 입력하세요");
		frm.b_name.focus();
		return false;
	}else if(frm.b_category.value == ""){
		alert("카테고리를 선택하세요");
		frm.b_category.focus();
		return false;
	}else if(frm.b_infop.value == ""){
		alert("정보공개여부를 선택해주세요");
		frm.b_infop.focus();
		return false;
	}
	
	frm.submit();
}

function upBfilecheck() {
	var frm = document.getElementById("frm_upfileBand");
	var ext = $('#upBimg').val().split('.').pop().toLowerCase();
	if(frm.upBimg.value != ""&& $.inArray(ext, ['gif','png','jpg','jpeg']) != -1){
		document.getElementById("upBfileH").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("upBfileH").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;이미지 파일만 업로드 가능합니다.(.jpg,.png,.gif,.jpeg)</p>";
	}
}

function upBfilesubmit() {
	var frm = document.getElementById("frm_upfileBand");
	var ext = $('#upBimg').val().split('.').pop().toLowerCase();
	if(frm.upBimg.value != ""&& $.inArray(ext, ['gif','png','jpg','jpeg']) != -1){
		document.getElementById("upBfileH").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		alert("이미지파일만 업로드 가능합니다. 다시 확인하여주세요");
		frm.upBimg.focus();
		return false;
	}
	
	frm.submit();
}

function dropB() {
	if(confirm("밴드를 삭제하시겠습니까?\n삭제시 복구하지 못합니다.")){
		var url = "./dropband.jsp?b_id=<%=band.getB_id()%>";
		location.href=url;
	}
}
function joinB() {
	if(confirm("가입하시겠습니까?")){
		var url = "./joinband.jsp?b_id=<%=band.getB_id()%>";
		location.href=url;
	}
}
function quitB(uid) {
	if(confirm("탈퇴하시겠습니까?")){
		var url = "./quitband.jsp?b_id=<%=band.getB_id()%>&u_id="+uid+"&grade=<%=grade%>";
		location.href=url;
	}
}
</script>

</body>
</html>