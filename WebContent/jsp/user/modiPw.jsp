<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
	String orgpw = request.getParameter("orgpw");
	String chpw = request.getParameter("chpw");
	
	Map map = new HashMap();
	map.put("id", session.getAttribute("id"));
	map.put("pw", orgpw);
	if(!udao.checkPW(map)){
%>
<script type="text/javascript">
alert("기존비밀번호가 틀렸습니다.");
history.back();
</script>
<%
	}else{
		map.put("pw",chpw);
		if(udao.updatePW(map)){
			session.invalidate();
%>
<script type="text/javascript">
alert("비밀번호 수정이 완료 되었습니다. 다시 로그인 부탁드려요");
var url ="<%=root%>/home.jsp";
location.href=url;
</script>
<% 
		}else{
%>
<script type="text/javascript">
alert("비밀번호 수정에 실패하였습니다. 고객센터에 문의해주세요");
history.back();
</script>
<%}}%>