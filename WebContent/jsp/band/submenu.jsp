<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
	String bid = (String)request.getParameter("b_id");
	BandVO band = bdao.selectBandOne(bid);
	String site = request.getParameter("site");
%>
<h2>BAND</h2><h5>_<%=band.getB_title() %></h5>
<ul class="nav nav-pills nav-stacked">
  <li 
  <%if(site.equals("bandinfo")) out.print("class='active'"); %>
  ><a href="<%=root%>/jsp/band/bandInfo.jsp?b_id=<%=bid%>&site=bandinfo">BandInfo</a></li>
  <li
  <%if(site.equals("boardlist")) out.print("class='active'"); %>
  ><a href="<%=root%>/jsp/band/board_list.jsp?b_id=<%=bid%>&site=boardlist">Board List</a></li>
  <li
  <%if(site.equals("boardwrite")) out.print("class='active'"); %>
  ><a href="<%=root%>/jsp/band/board_write.jsp?b_id=<%=bid%>&site=boardwrite">Board Write</a></li>
</ul><br>