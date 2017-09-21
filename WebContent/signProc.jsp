<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<jsp:useBean id="user" class="model.user.UserVO"/>
<jsp:setProperty property="*" name="user"/>


<%if(udao.joinUser(user)){%>
<script type="text/javascript">
alert("환영합니다 회원가입에 성공하였습니다.\n로그인 해주세요");
var url ="<%=root%>/home.jsp";
location.href=url;
</script>
<%}else{%>
<script type="text/javascript">
alert("회원가입에 실패하였습니다.");
history.back();
</script>
<%}%>