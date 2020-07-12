<%@include file="connect.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%@ include file="11.jsp" %>
<%
try{
int uid=0;
int i=0;
int c=0;
String name1="";
String name2="";
String path1="";
int fid=0;
	uid=(Integer)session.getAttribute("usrid");
	PreparedStatement pst=con.prepareStatement("select * from pritam.friends where id2=? and fcon !=?" );
	pst.setInt(1,uid);
	pst.setInt(2,1);
	ResultSet rs=pst.executeQuery();
	while(rs.next())
	{
		 fid=rs.getInt("id1");
		PreparedStatement pst1=con.prepareStatement("select * from pritam.info where id="+fid);
		ResultSet rs1=pst1.executeQuery();
		if(rs1.next())
		{
			 name1=rs1.getString("fname");
			name2=rs1.getString("lname");
		}
		PreparedStatement pst2=con.prepareStatement("select * from pritam.image where id="+fid);
		ResultSet rs2=pst2.executeQuery();
		if(rs2.next())
		{
			 path1=rs2.getString("path");
		}
		c=c+1;
		 HttpSession ses=request.getSession();
		ses.setAttribute("friend",0);
		i=(Integer)session.getAttribute("friend");
		if(i==0)
		{
%>
<html>
<body>
<style>
body {
  background-image: url("img1\\uses\\marriage.jpg");
  background-color: #cccccc;
  background-size:cover;
}
</style>

<table>
<th>
Friends Request <%=c%>
</th>
<tr>
<td>
<img src=<%=path1%> height:200px; width=200px;>
</td>
<td>
<h3><%=name1%> <%=name2%><br></h3>
<form action="friends1.jsp" method=post>
		<input type=hidden name=fid value=<%=fid%>>
		<input type=submit name=submit value=confirm>
</form>
</td>
</tr>
</body>
</html>



<%
	}
	else
	{
		session.invalidate();
	}
	}
}
catch(Exception e)
{
	out.println(e);
}
%>
