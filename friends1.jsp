<%@include file="connect.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%
try{
int uid=0;
int ffid=0;
	uid=(Integer)session.getAttribute("usrid");
	ffid=Integer.parseInt(request.getParameter("fid"));
	PreparedStatement pst=con.prepareStatement("update pritam.friends set fcon=? where id1=? and id2=? ");
	pst.setInt(1,1);
	pst.setInt(2,ffid);
	pst.setInt(3,uid);
	int t=pst.executeUpdate();
	if(t>0)
	{
		session.setAttribute("friend",1);
		response.sendRedirect("friends.jsp");
	}


}
catch(Exception e)
{
out.println(e);
}
%>
