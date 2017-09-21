<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi.jsp" %>
<jsp:useBean id="band" class="model.band.BandVO"/>
<jsp:setProperty property="*" name="band"/>
<%
UploadSave upload = new UploadSave(request, -1, -1, tempDir);
String b_id = upload.getParameter("b_id");
String b_oldfname = UploadSave.encode(upload.getParameter("b_oldfname"));//삭제할파일

FileItem fileItem = upload.getFileItem("upBimg");//실제 파일컬럼
int size = (int)fileItem.getSize();
String filename = null;
	if(size>0){
		if(b_oldfname != null && !b_oldfname.endsWith("Basic.jpg")){
			upload.deleteFile(upDir, b_oldfname);
		}
		filename = upload.saveFile(fileItem, upDir);
	}


Map map = new HashMap();
map.put("b_id", b_id);
map.put("b_fname", filename);



if(!bdao.updateFileBand(map)){
	%>
	<script type="text/javascript">
	alert("밴드사진수정에 실패하였습니다.");
	history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("밴드 사진 수정이 성공하였습니다.");
	var url = "./bandInfo.jsp?b_id=<%=b_id%>&site=bandinfo";
	location.href=url;
	</script>
	<%
}
%>
