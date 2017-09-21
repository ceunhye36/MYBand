<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
	String id = (String)session.getAttribute("id");
	List<BandVO> crtlist = bdao.crtBList(id);
	List<BandVO> joinlist = bdao.joinBList(id);
	
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
      <h2>MyPage</h2>
      <ul class="nav nav-pills nav-stacked">
        <li><a href="/jsp/user/myinfo.jsp">MyInfo</a></li>
        <li class="active"><a href="/jsp/user/myband.jsp">MyBand</a></li>
        <li><a href="/jsp/user/calendar.jsp">Calendar</a></li>
      </ul><br>
    </div>
    
     <div class="col-sm-3 sidenav visible-xs" >
      <h2>MyPage</h2>
      <ul class="nav nav-pills nav-stacked">
        <li><a href="/jsp/user/myinfo.jsp">MyInfo</a></li>
        <li class="active"><a href="/jsp/user/myboard.jsp">MyBoard</a></li>
        <li><a href="/jsp/user/calendar.jsp">Calendar</a></li>
      </ul><br>
    </div>
    <br>
    
    <div class="content">
    <div class="col-sm-9 col-sm-offset-2">
    	<div class="row">
    		<div class="col-sm-6" style="padding-left: 20px;">
    			<div class="row">
    				<div>
    					<label class="text-primary" style="text-align: right;margin-top: 5px;" for="band">Create BAND</label>
				      	<div class="col-sm-12 text-primary" id="band">
				      		<div class="row">
				      		<div class="text-primary">
				      			<table class="table table-hover table-condensed">
							    <thead>
							      <tr>
							        <th>Name of BAND</th>
							        <th>Category</th>
							        <th>Status</th>
							        <th>Total Board</th>
							        <th>Total Reply</th>
							        <th>Create-Date</th>
							        <th></th>
							      </tr>
							    </thead>
							    <tbody>
							    <%
							    if(crtlist.size()==0){
							    	out.println("<tr><td colspan='7' align='center'>목록이 존재하지 않습니다.</td></tr>");
							    }else{
							    	for(BandVO band : crtlist){ %>
							      <tr onclick="location.href='/jsp/band/bandInfo.jsp?b_id=<%=band.getB_id()%>&site=bandinfo'">
							        <td><%=band.getB_title() %></td>
							        <td><%=band.getB_category() %></td>
							        <td><%=band.getB_infop() %></td>
							        <td>100</td>
							        <td>1000</td>
							        <td><%=band.getB_date() %></td>
							        <td onclick="event.cancelBubble = true;"><button type="button" class="btn btn-danger"onclick="dropB('<%=band.getB_id() %>')" >삭제</button></td>
							      </tr>
							      <%}} %>
							    </tbody>
							  </table>
						  </div>
						  </div>
				      	</div>
    					<br><br>
    				</div>
    			</div>
    		</div>
    		<div class="col-sm-6" style="padding-left: 20px;">
    			<div class="row">
    				<div>
	    				<label class="text-primary" style="text-align: right;margin-top: 5px;" for="band">Join BAND</label>
					      	<div class="col-sm-12 text-primary" id="band">
					      		<div class="row">
					      		<div class=" text-primary">
					      			<table class="table table-hover table-condensed">
								    <thead>
								      <tr>
								        <th>Name of BAND</th>
								        <th>Category</th>
								        <th>Status</th>
								        <th>Total Board</th>
							        	<th>Total Reply</th>
								        <th>Join-Date</th>
								        <th></th>
								      </tr>
								    </thead>
								    <tbody>
								    <%if(joinlist.size()==0){
										out.println("<tr><td colspan='7' align='center'>목록이 존재하지 않습니다.</td></tr>");
								    }else{
								    	for(BandVO band:joinlist){
								    	%>
								      <tr onclick="location.href='/jsp/band/bandInfo.jsp?b_id=<%=band.getB_id()%>&site=bandinfo'">
								        <td><%=band.getB_title() %></td>
								        <td><%=band.getB_category() %></td>
								        <td><%=band.getB_infop() %></td>
								        <td>100</td>
							        	<td>1000</td>
								        <td><%=band.getB_date() %></td>
								        <td onclick="event.cancelBubble = true;"><button type="button" class="btn btn-danger"onclick="quitB('<%=band.getB_id() %>')">탈퇴</button></td>
								      </tr>
								      <%}} %>
								    </tbody>
								  </table>
							  </div>
							  </div>
					      	</div>
					      	
    					<br><br>
    				</div>
    			</div>
    		</div>
    	</div>
    	
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
    				<div>
	    				<label class="text-primary" style="text-align: right;margin-top: 5px;" for="band">Band New Board (Recently.20)</label>
					      	<div class="col-sm-12 text-primary" id="band">
					      		<div class="row">
					      		<div class="col-sm-6 text-primary">
					      			<table class="table table-hover table-condensed">
								    <thead>
								      <tr>
								      	<th>NUM</th>
										<th>BAND NAME</th>
								        <th>Title</th>
								        <th>작성자</th>
								        <th>조회수</th>
								        <th>댓글수</th>
								        <th>W-Date</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								      	<td>1</td>
								        <td>여행가자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>2</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>3</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>4</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>5</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>6</td>
								        <td>여행가자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>7</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>8</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>9</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>10</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								    </tbody>
								  </table>
							  </div>
							  
							  <div class="col-sm-6 text-primary">
					      			<table class="table table-hover table-condensed">
								    <thead>
								      <tr>
								      	<th>NUM</th>
										<th>BAND NAME</th>
								        <th>Title</th>
								        <th>작성자</th>
								        <th>조회수</th>
								        <th>댓글수</th>
								        <th>W-Date</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								      	<td>11</td>
								        <td>여행가자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>12</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>13</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>14</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>15</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>16</td>
								        <td>여행가자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>17</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>18</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>19</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>20</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>test1</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								    </tbody>
								  </table>
							  </div>
							  </div>
					      	</div>
    					<br><br>
    				</div>
    			</div>
				<br><br>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div class="row">
    				<div>
	    				<label class="text-primary" style="text-align: right;margin-top: 5px;" for="band">MY Board</label>
					      	<div class="col-sm-12 text-primary" id="band">
					      		<div class="row">
					      		<div class=" text-primary">
					      			<table class="table table-hover table-condensed">
								    <thead>
								      <tr>
								      	<th>NUM</th>
										<th>BAND NAME</th>
								        <th>Title</th>
								        <th>조회수</th>
								        <th>댓글수</th>
								        <th>W-Date</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								      	<td>1</td>
								        <td>여행가자</td>
								        <td>안녕하세요</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>2</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>3</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>4</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>5</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>6</td>
								        <td>여행가자</td>
								        <td>안녕하세요</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>7</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>8</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>9</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>10</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>2</td>
								        <td>1</td>
								        <td>2017-01-12</td>
								      </tr>
								    </tbody>
								  </table>
							  </div>
							  </div>
					      	</div>
    					<br><br>
    				</div>
    			</div>
				<br><br>
			</div>
			<div class="col-sm-6">
				<div class="row">
    				<div>
	    				<label class="text-primary" style="text-align: right;margin-top: 5px;" for="band">MY Reply</label>
					      	<div class="col-sm-12 text-primary" id="band">
					      		<div class="row">
					      		<div class=" text-primary">
					      			<table class="table table-hover table-condensed">
								    <thead>
								      <tr>
								      	<th>NUM</th>
										<th>BAND NAME</th>
								        <th>Board Title</th>
								        <th>댓글내용</th>
								        <th>W-Date</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								      	<td>1</td>
								        <td>여행가자</td>
								        <td>안녕하세요</td>
								        <td>반가워요~~~옛다댓글</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>2</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>반가워요~~~옛다댓글</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>3</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>반가워요~~~옛다댓글</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>4</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>반가워요~~~옛다댓글</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>5</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>반가워요~~~옛다댓글</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>6</td>
								        <td>여행가자</td>
								        <td>안녕하세요</td>
								        <td>반가워요~~~옛다댓글</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>7</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>반가워요~~~옛다댓글</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>8</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>반가워요~~~옛다댓글</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>9</td>
								        <td>공부하자</td>
								        <td>안녕하세요</td>
								        <td>반가워요~~~옛다댓글</td>
								        <td>2017-01-12</td>
								      </tr>
								      <tr>
								      	<td>10</td>
								        <td>운동하자</td>
								        <td>안녕하세요</td>
								        <td>반가워요~~~옛다댓글</td>
								        <td>2017-01-12</td>
								      </tr>
								    </tbody>
								  </table>
							  </div>
							  </div>
					      	</div>
    					<br><br>
    				</div>
    			</div>
				<br><br>
			</div>
		</div>    	
    </div>
    </div>
  </div>
</div>
<!-- 내용 끝 -->

<jsp:include page="/jsp/template/footer.jsp" />

<script type="text/javascript">
function dropB(b_id) {
	if(confirm("밴드를 삭제하시겠습니까?\n삭제시 복구하지 못합니다.")){
		var url = "../band/dropband.jsp?b_id="+b_id;
		location.href=url;
	}
}
function quitB(b_id) {
	if(confirm("탈퇴하시겠습니까?")){
		var url = "/jsp/band/quitband.jsp?b_id="+b_id+"&u_id=<%=session.getAttribute("id")%>&grade=U";
		location.href=url;
	}
}
</script>
</body>
</html>