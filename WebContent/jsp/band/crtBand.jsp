<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi.jsp" %>
<jsp:useBean id="band" class="model.band.BandVO"/>
<jsp:setProperty property="*" name="band"/>
<%
if(!bdao.createBand(band)){
	%>
	<script type="text/javascript">
	alert("밴드생성에 실패하였습니다.");
	history.back();
	</script>
	<%
}else{
	String str = bdao.crtBandUser((String)session.getAttribute("id"));
	if(str.equals("false")){
		%>
		<script type="text/javascript">
		alert("밴드장 입력이 실패하였습니다.");
		history.back();
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("밴드 개설이 성공하였습니다.");
		var url = "./bandInfo.jsp?b_id=<%=str%>&site=bandinfo";
		location.href=url;
		</script>
		<%
	}
}
%>
