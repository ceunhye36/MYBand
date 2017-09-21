<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ page import="java.util.*" %>
<%@ page import="model.user.*" %>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="java.util.*" %>
<%@ page import="model.band.*" %>
<%@ page import="utility.*" %>
<jsp:useBean id="bdao" class="model.band.BandDAO"/>
<jsp:useBean id="udao" class="model.user.UserDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	String root = application.getContextPath();
	String tempDir = application.getRealPath("/images/temp");
	String upDir = application.getRealPath("/images/storage");
%>

