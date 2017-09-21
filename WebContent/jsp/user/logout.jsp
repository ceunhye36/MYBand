<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%session.invalidate();%>
<script type="text/javascript">
alert("로그아웃이 완료되었습니다.");
var url ="<%=application.getContextPath()%>/home.jsp";
location.href = url;
</script>
