<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
String id = (String)session.getAttribute("id");
if(!id.equals("admin")){
Map map = new HashMap<>();
map.put("id", id);
map.put("pw", request.getParameter("pw"));
if(!udao.checkPW(map)){
%>
<script type="text/javascript">
alert("잘못된 비밀번호를 입력하였습니다.");
history.back();
</script>
<%
}else if(udao.deleteUser(map)){
	session.invalidate();
%>
<script type="text/javascript">
alert("회원정보 삭제를 완료하였습니다. \n지금까지 이용해 주셔서 감사합니다.");
var url = "<%=root%>/home.jsp";
location.href=url;
</script>
<%}else{ %>
<script type="text/javascript">
alert("회원정보 삭제를 실패 하였습니다.");
history.back();
</script>
<%}
}else{%>
<script type="text/javascript">
alert("관리자계정은 삭제 불가능 합니다.");
history.back();
</script>
<%}%>