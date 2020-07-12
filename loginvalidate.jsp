<%@ include file="connect.jsp" %>
<%
String uid=(String)request.getParameter("more");
String pass=(String)request.getParameter("pass");
try{
PreparedStatement pst=con.prepareStatement("select * from pritam.mlogin where email_id=? and pass=?");
pst.setString(1,uid);
pst.setString(2,pass);
ResultSet rs=pst.executeQuery();

if(rs.next())
	{
		int n=rs.getInt("id");
		session.setAttribute("usrid",n);
		response.sendRedirect("loginsuccess.html");
	}
	else
	{

%>
<html><body><center>login failed</center></body></html>
<%@include file="login.html"%>
<%
	}
  }
	catch(Exception e){
	out.println(e);
	}
	con.close();


%>
