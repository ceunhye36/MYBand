<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
String b_id = request.getParameter("b_id");
%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>Band</title>

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
    .content tbody tr:HOVER{
    	cursor: pointer;
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
  <div class="col-sm-10 col-sm-offset-2" style="padding:20px 40px;"><h1>Board List</h1><hr></div>
    <div class="col-sm-6 col-sm-offset-3" style="padding:20px 30px;">
    	<div class="row">
		 <table class="table table-hover table-condensed">
			    <thead>
			      <tr class="text-primary">
			      	<th style="text-align: center;">NUM</th>
			        <th style="text-align: center;">Title</th>
			        <th style="text-align: center;">작성자</th>
			        <th style="text-align: center;">조회수</th>
			        <th style="text-align: center;">댓글수</th>
			        <th style="text-align: center;">W-Date</th>
			        <th style="text-align: center;">File</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr onclick="location.href='/jsp/band/board_read.jsp?b_id=<%=b_id %>&site=boardread'">
			      	<td align="center">1</td>
			        <td align="center">안녕하세요</td>
			        <td align="center">test1</td>
			        <td align="center">2</td>
			        <td align="center">1</td>
			        <td align="center">2017-01-12</td>
			        <td align="center"  onclick="event.cancelBubble = true;"><a><span class="glyphicon glyphicon-download" style="font-size: 18px;"></span></a></td>
			      </tr>
			      <tr onclick="location.href='/jsp/band/board_read.jsp?b_id=<%=b_id %>&site=boardread'">
			      	<td align="center">2</td>
			        <td align="center">안녕하세요</td>
			        <td align="center">test1</td>
			        <td align="center">2</td>
			        <td align="center">1</td>
			        <td align="center">2017-01-12</td>
			        <td align="center"></td>
			      </tr>
			      <tr onclick="location.href='/jsp/band/board_read.jsp?b_id=<%=b_id %>&site=boardread'">
			      	<td align="center">3</td>
			        <td align="center">안녕하세요</td>
			        <td align="center">test1</td>
			        <td align="center">2</td>
			        <td align="center">1</td>
			        <td align="center">2017-01-12</td>
			        <td align="center" onclick="event.cancelBubble = true;"><a><span class="glyphicon glyphicon-download" style="font-size: 18px;"></span></a></td>
			      </tr>
			      <tr onclick="location.href='/jsp/band/board_read.jsp?b_id=<%=b_id %>&site=boardread'">
			      	<td align="center">4</td>
			        <td align="center">안녕하세요</td>
			        <td align="center">test1</td>
			        <td align="center">2</td>
			        <td align="center">1</td>
			        <td align="center">2017-01-12</td>
			        <td align="center" onclick="event.cancelBubble = true;"><a><span class="glyphicon glyphicon-download" style="font-size: 18px;"></span></a></td>
			      </tr>
			      <tr onclick="location.href='/jsp/band/board_read.jsp?b_id=<%=b_id %>&site=boardread'">
			      	<td align="center">5</td>
			        <td align="center">안녕하세요</td>
			        <td align="center">test1</td>
			        <td align="center">2</td>
			        <td align="center">1</td>
			        <td align="center">2017-01-12</td>
			        <td align="center" onclick="event.cancelBubble = true;"><a><span class="glyphicon glyphicon-download" style="font-size: 18px;"></span></a></td>
			      </tr>
			      <tr onclick="location.href='/jsp/band/board_read.jsp?b_id=<%=b_id %>&site=boardread'">
			      	<td align="center">6</td>
			        <td align="center">안녕하세요</td>
			        <td align="center">test1</td>
			        <td align="center">2</td>
			        <td align="center">1</td>
			        <td align="center">2017-01-12</td>
			        <td align="center" onclick="event.cancelBubble = true;"><a><span class="glyphicon glyphicon-download" style="font-size: 18px;"></span></a></td>
			      </tr>
			      <tr onclick="location.href='/jsp/band/board_read.jsp?b_id=<%=b_id %>&site=boardread'">
			      	<td align="center">7</td>
			        <td align="center">안녕하세요</td>
			        <td align="center">test1</td>
			        <td align="center">2</td>
			        <td align="center">1</td>
			        <td align="center">2017-01-12</td>
			        <td align="center" onclick="event.cancelBubble = true;"><a><span class="glyphicon glyphicon-download" style="font-size: 18px;"></span></a></td>
			      </tr>
			      <tr onclick="location.href='/jsp/band/board_read.jsp?b_id=<%=b_id %>&site=boardread'">
			      	<td align="center">8</td>
			        <td align="center">안녕하세요</td>
			        <td align="center">test1</td>
			        <td align="center">2</td>
			        <td align="center">1</td>
			        <td align="center">2017-01-12</td>
			        <td align="center" onclick="event.cancelBubble = true;"><a><span class="glyphicon glyphicon-download" style="font-size: 18px;"></span></a></td>
			      </tr>
			      <tr onclick="location.href='/jsp/band/board_read.jsp?b_id=<%=b_id %>&site=boardread'">
			      	<td align="center">9</td>
			        <td align="center">안녕하세요</td>
			        <td align="center">test1</td>
			        <td align="center">2</td>
			        <td align="center">1</td>
			        <td align="center">2017-01-12</td>
			        <td align="center" onclick="event.cancelBubble = true;"><a><span class="glyphicon glyphicon-download" style="font-size: 18px;"></span></a></td>
			      </tr>
			      <tr onclick="location.href='/jsp/band/board_read.jsp?b_id=<%=b_id %>&site=boardread'">
			      	<td align="center">10</td>
			        <td align="center">안녕하세요</td>
			        <td align="center">test1</td>
			        <td align="center">2</td>
			        <td align="center">1</td>
			        <td align="center">2017-01-12</td>
			        <td align="center" onclick="event.cancelBubble = true;"><a><span class="glyphicon glyphicon-download" style="font-size: 18px;"></span></a></td>
			      </tr>
			    </tbody>
			  </table>
		  </div>
		 </div>
		</div>
    </div>
    <br><br>
    </div>
    
<!-- 내용 끝 -->

<jsp:include page="/jsp/template/footer.jsp" />

</body>
</html>