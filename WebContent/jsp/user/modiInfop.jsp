<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
	String pw = request.getParameter("pw");
	String u_infop = request.getParameter("u_infop");
	
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
		map.put("u_infop",u_infop);
		if(udao.updateINFOP(map)){
%>
<script type="text/javascript">
alert("정보공개여부 수정이 완료 되었습니다.");
var url ="./myinfo.jsp";
location.href=url;
</script>
<% 
		}else{
%>
<script type="text/javascript">
alert("정보공개여부 수정이 실패하였습니다. 고객센터에 문의해주세요");
history.back();
</script>
<%}}%>