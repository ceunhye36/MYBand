<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
Map map = new HashMap();
map.put("id", request.getParameter("id"));
map.put("pw", request.getParameter("pw"));
if(udao.checkPW(map)){
	session.setAttribute("id", request.getParameter("id"));
	session.setAttribute("grade", udao.getUGRADE(request.getParameter("id")));
	session.setMaxInactiveInterval(60*60*60); //세션 최대 유지 시간 설정

// 	cookie 저장, checkbox는 선택하지 않으면 null

// 	Cookie cookie = null; //보안을 위해서 1. MD5 암호화 클래스 ( SecurityUtil.java ) 2. Base64 인코딩 클래스 ( Base64Util.java ) 구현

// 	String cookieLog = request.getParameter("cookieLog"); // Y,아이디 저장여부
	
// 	if(cookieLog!=null&& cookieLog.equals("on")){ //check한 상태인 checkbox는 "on"문자열을 request객체에 담는다.
		
// 		cookie = new Cookie("cookieLog", "Y"); // 아이디 저장 여부 쿠키
// 		cookie.setMaxAge(2592000);    // 한달간 저장(최대 자동로그인 기간은 한달)
// 		response.addCookie(cookie); // 쿠키 기록
		
// 		cookie = new Cookie("id", request.getParameter("id")); // 아이디 저장 여부 쿠키
// 		cookie.setMaxAge(2592000);    // 한달간 저장(최대 자동로그인 기간은 한달)
// 		response.addCookie(cookie); // 쿠키 기록

// 		cookie = new Cookie("pw",request.getParameter("pw") ); // 아이디 값 저장 쿠키
// 		cookie.setMaxAge(2592000);    // 한달간 저장(최대 자동로그인 기간은 한달)
// 		response.addCookie(cookie); // 쿠키 기록
// 	}else{
// 		cookie = new Cookie("id", ""); // 쿠키 삭제
// 		cookie.setMaxAge(0);
// 		response.addCookie(cookie);
		
// 		cookie = new Cookie("cookieLog", ""); // 쿠키 삭제
// 		cookie.setMaxAge(0);
// 		response.addCookie(cookie);

// 		cookie = new Cookie("pw", ""); // 쿠키삭제
// 		cookie.setMaxAge(0);
// 		response.addCookie(cookie);
// 	}

%>
<script type="text/javascript">
alert("환영합니다 <%=request.getParameter("id")%>님");
var url = "<%=root%>/home.jsp";
location.href=url;
</script>
<%}else{ %>
<script type="text/javascript">
alert("로그인에 실패하였습니다. \n정확한 아이디/비밀번호를 입력하여주세요");
history.back();
</script>
<%} %>
