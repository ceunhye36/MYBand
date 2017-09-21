<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi.jsp" %>
<%
Map map = new HashMap();
map.put("b_id", request.getParameter("b_id"));
if(request.getParameter("u_id")==null){
map.put("u_id",(String)session.getAttribute("id"));
}else{map.put("u_id",request.getParameter("u_id"));}
if(!bdao.quitBandUser(map)){
	%>
	<script type="text/javascript">
	alert("밴드탈퇴에 실패하였습니다.");
	history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("밴드 탈퇴를 성공하였습니다.");
	<% if(request.getParameter("grade").equals("M")) out.println("var url = './bandInfo.jsp?b_id="+request.getParameter("b_id")+"&site=bandinfo';");
	else out.println("var url = '/jsp/user/myband.jsp';");%>
	
	location.href=url;
	</script>
	<%
}
%>
