<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi.jsp" %>
<%
String b_id = request.getParameter("b_id");
String site = request.getParameter("site");
if(!bdao.delUBinfo(b_id)){
	%>
	<script type="text/javascript">
	alert("밴드삭제를 실패하였습니다.");
	history.back();
	</script>
	<%
}else{
	if(!bdao.delBand(b_id)){
		%>
		<script type="text/javascript">
		alert("밴드삭제를 실패하였습니다.");
		history.back();
		</script>
		<%
	}else{
	%>
	<script type="text/javascript">
	alert("밴드 삭제가 완료하였습니다.");
	var url = '../user/myband.jsp';	
	location.href=url;
	</script>
	<%
}}
%>
