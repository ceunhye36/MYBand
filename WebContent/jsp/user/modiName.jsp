<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
	String pw = request.getParameter("pw");
	String u_name = request.getParameter("u_name");
	
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
		map.put("u_name",u_name);
		if(udao.updateNAME(map)){
%>
<script type="text/javascript">
alert("이름 수정이 완료 되었습니다.");
var url ="./myinfo.jsp";
location.href=url;
</script>
<% 
		}else{
%>
<script type="text/javascript">
alert("이름 수정이 실패하였습니다. 고객센터에 문의해주세요");
history.back();
</script>
<%}}%>