<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	
	Map map = new HashMap();
	map.put("id", session.getAttribute("id"));
	map.put("pw", pw);
	if(!udao.checkPW(map)){
%>
<script type="text/javascript">
alert("비밀번호가 틀렸습니다.");
history.back();
</script>
<%
	}else{
		map.put("email",email);
		if(udao.updateEMAIL(map)){
%>
<script type="text/javascript">
alert("이메일 수정이 완료 되었습니다.");
var url ="./myinfo.jsp";
location.href=url;
</script>
<% 
		}else{
%>
<script type="text/javascript">
alert("이메일 수정이 실패하였습니다. 고객센터에 문의해주세요");
history.back();
</script>
<%}}%>