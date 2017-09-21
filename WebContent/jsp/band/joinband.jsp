<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi.jsp" %>
<%
UBVO ub = new UBVO();
ub.setUb_bid(request.getParameter("b_id"));
ub.setUb_uid((String)session.getAttribute("id"));
if(!bdao.joinBandUser(ub)){
	%>
	<script type="text/javascript">
	alert("밴드가입에 실패하였습니다.");
	history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("밴드 가입이 성공하였습니다.");
	var url = "./bandInfo.jsp?b_id=<%=ub.getUb_bid()%>&site=bandinfo";
	location.href=url;
	</script>
	<%
}
%>
