<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi.jsp" %>
<jsp:useBean id="band" class="model.band.BandVO"/>
<jsp:setProperty property="*" name="band"/>
<%
if(!bdao.updateBand(band)){
	%>
	<script type="text/javascript">
	alert("밴드수정에 실패하였습니다.");
	history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("밴드 수정이 성공하였습니다.");
	var url = "./bandInfo.jsp?b_id=<%=band.getB_id()%>&site=bandinfo";
	location.href=url;
	</script>
	<%
}
%>
