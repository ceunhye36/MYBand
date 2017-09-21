<!--      - 화면 하단 출력용   -->

<%@ page contentType="text/html; charset=UTF-8" %> 
 
<style>
/* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
</style>
 
 
<!-- 하단 메뉴 시작 -->
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
<!-- 하단 메뉴 끝 -->

<!-- scroll top -->
      
<button type="button" class="btn btn-default btn-sm hidden-md hidden-lg"  id="remoCon">
    <span class="glyphicon glyphicon-eject" style="text-align: center;"></span>
</button>  


<!-- 스크립트는 브라우저 로딩이 오래걸림 그러므로 밑에 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script><!-- bootstrap의 스크립트는 jQuery를 이용하므로 -->
<script type="text/javascript" src="/js/jquery.jrumble.1.3.js"></script> <!-- 떨림 현상 --><!-- jquery v1.7.2 이상만 사용할수 있다 -->
<script src="/js/bootstrap.min.js"></script><!-- bootstrap.js연결 -->

<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
$(document).ready(function(){
    $("#loginBtn").click(function(){
        $("#loginM").modal('show').css({ 
			'margin-top':function(){//vertical
				return -($(this).height()-$(this).height()/100*103);
			},        	
        	'margin-left':function(){//horizontal
        		return ($(this).width()/5);
        	}
        });
    });
    $("#crtBand").click(function(){
        $("#crtBandM").modal('show').css({ 
        	'margin-top':function(){//vertical
				return -($(this).height()-$(this).height()/100*99);
			},        	
        	'margin-left':function(){//horizontal
        		return -($(this).width()-$(this).width()/100*105);
        	}
        });
    });
});

//modal close 시 form reset
$('.modal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
  $(this).find('form')[0].reset()
});
// scroll top  
$(document).scroll(function(){
	var con = $("#remoCon");
	var position = $(window).scrollTop();

	if(position > 250){ con.fadeIn(500); }
	else if(position < 250){ con.fadeOut(500); }
 });

 $("#remoCon").click(function(){
	$("html, body").animate({scrollTop: 0}, 1000);
 });

 function incheckL(){
	 var f = document.getElementById("frm_login");
	if(f.id.value==""){
		alert("아이디를 입력하세요");
		f.id.focus();
		return false;
	}else if(f.pw.value==""){
		alert("비밀번호를 입력하세요");
		f.pw.focus();
		return false;
	}
	f.submit();
}
 
//  create BAND
 function crtBnamecheck(){
	var frm = document.getElementById("frm_crtBand");
	if(frm.b_title.value != ""){
		document.getElementById("crtBnameH").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("crtBnameH").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;밴드이름을 입력하여주세요</p>";
	}
}
function crtBcategorycheck() {
	var frm = document.getElementById("frm_crtBand");
	if(frm.b_category.value != ""){
		document.getElementById("crtBcategoryH").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("crtBcategoryH").innerHTML = "<p class='text-danger'><span class='glyphicon glyphicon-alert'></span>&ensp;카테고리를 선택하여주세요</p>";
	}
}
function crtBexpcheck() {
	var frm = document.getElementById("frm_crtBand");
	if(frm.b_exp.value != ""){
		document.getElementById("crtBexpH").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("crtBexpH").innerHTML = "<p class='text-primary'><span class='glyphicon glyphicon-alert'></span>&ensp;밴드에 대한 설명을 입력하여주세요</p>";
	}
}
function crtBinfopcheck() {
	var frm = document.getElementById("frm_crtBand");
	if(frm.b_infop.value != ""){
		document.getElementById("crtBinfopH").innerHTML = "<p class='text-success'><span class='glyphicon glyphicon-ok'></span></p>";
	}else{
		document.getElementById("crtBinfopH").innerHTML = "<p class='text-primary'><span class='glyphicon glyphicon-alert'></span>&ensp;밴드공개 여부를 선택하여주세요</p>";
	}
}
function crtBsubmit() {
	var frm = document.getElementById("frm_crtBand");
	if(frm.b_title.value == ""){
		alert("이름을 입력하세요");
		frm.b_name.focus();
    	demoStart();
		return false;
	}else if(frm.b_category.value == ""){
		alert("카테고리를 선택하세요");
		frm.b_category.focus();
    	demoStart();
		return false;
	}else if(frm.b_infop.value == ""){
		alert("정보공개여부를 선택해주세요");
		frm.b_infop.focus();
    	demoStart();
		return false;
	}
	
	frm.submit();
}
var demoStart = function(){
	$('#crtBandM').jrumble();
	$('#crtBandM').trigger('startRumble');
	setTimeout(demoStop, 500);
};
var demoStop = function(){
	$('#crtBandM').trigger('stopRumble');
};

</script>
