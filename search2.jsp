<%@include file="connect.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%
try{
	String gn="";
	String reli="";
	String language="";
	String fname="";
	String lname="";
	int age_from=0;
	int age_to=0;
	gn=request.getParameter("gender");
	age_from=Integer.parseInt(request.getParameter("age_from"));
	age_to=Integer.parseInt(request.getParameter("age_to"));
	reli=request.getParameter("religion");
	language=request.getParameter("language");

	int id1=0;
	int uid=0;
	id1=Integer.parseInt(request.getParameter("id"));
	uid=(Integer)session.getAttribute("usrid");
	PreparedStatement pst=con.prepareStatement("insert into pritam.friends values(?,?,?,?)");
	pst.setInt(1,uid);
	pst.setInt(2,id1);
	pst.setInt(3,1);
	pst.setInt(4,0);
	int t=pst.executeUpdate();
	PreparedStatement pst1=con.prepareStatement("select * from pritam.info where id=?");
	pst1.setInt(1,id1);
	ResultSet rs1=pst1.executeQuery();
	if(rs1.next())
	{
		fname=rs1.getString("fname");
		lname=rs1.getString("lname");
	}

	if(t>0)
	{
%>
	<body>
	<style>
	background-color: aqua;
	</style>
	<form action="search1.jsp" method=post>
		<input type=hidden name=gender value=<%=gn%>>
		<input type=hidden name=age_from value=<%=age_from%>>
		<input type=hidden name=age_to value=<%=age_to%>>
		<input type=hidden name=religion value=<%=reli%>>
		<input type=hidden name=language value=<%=language%>><br><br>
		<h1><b>Friend Request Successfully Sent to <%=fname%> <%=lname%></b></h1>
		<input type=submit name=submit value=OK>
	</form>
	</body>
<%

	}

}
catch(Exception e)
{
	out.println(e);
}
%>
