<%@ include file="connect.jsp" %>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ include file="11.jsp" %>
<%
try{
int a[]=new int[50];
String path1="";
String fname="";
String lname="";
String gender="";
String mtounge="";
String country="";
String religion="";
String gn="";
String reli="";
String language="";
int age_from=0;
int age_to=0;
int uid=0;
int idn=0;
int age=0;
int i=0;
	gn=request.getParameter("gender");
	age_from=Integer.parseInt(request.getParameter("age_from"));
	age_to=Integer.parseInt(request.getParameter("age_to"));
	reli=request.getParameter("religion");
	language=request.getParameter("language");
	uid=(Integer)session.getAttribute("usrid");

	PreparedStatement pst4=con.prepareStatement("select * from pritam.friends where id1=? and freq=?");
	pst4.setInt(1,uid);
	pst4.setInt(2,1);
	ResultSet rs4=pst4.executeQuery();
	while(rs4.next())
	{
		a[i++]=rs4.getInt("id2");
	}
	PreparedStatement pst5=con.prepareStatement("select * from pritam.friends where id2=? and freq=?");
	pst5.setInt(1,uid);
	pst5.setInt(2,1);
	ResultSet rs5=pst5.executeQuery();
	while(rs5.next())
	{
		a[i++]=rs5.getInt("id1");

	}
	PreparedStatement pst3=con.prepareStatement("select * from pritam.info where gender=? and  age>=? and age<=? and religion=?  and mtounge=?");
	pst3.setString(1,gn);
	pst3.setInt(2,age_from);
	pst3.setInt(3,age_to);
	pst3.setString(4,reli);
	pst3.setString(5,language);
	ResultSet rs=pst3.executeQuery();

	while(rs.next())
	{
		 idn=rs.getInt("id");
		if(uid!=idn)
		{
			PreparedStatement pst2=con.prepareStatement("select * from pritam.image where id="+idn);
			ResultSet rs2=pst2.executeQuery();
			if(rs2.next())
			{
				path1=rs2.getString("path");
			}
			PreparedStatement pst=con.prepareStatement("select * from pritam.info where id="+idn);
			ResultSet rs1=pst.executeQuery();
			if(rs1.next())
			{
			 gender=rs1.getString("gender");
			 fname=rs1.getString("fname");
			 lname=rs1.getString("lname");
		 	age=rs1.getInt("age");
			religion=rs1.getString("religion");
			mtounge=rs1.getString("mtounge");
			country=rs1.getString("country");
			}

%>
<html>
<style>
a{
                text-decoration: none;
               font-size:30px;
            }

</style>
</head>
<body>
<style>
body {
  background-image: url("img1\\uses\\marriage.jpg");
  background-color: #cccccc;
  background-size:cover;
}
</style>

<body>
<br>
<table>
<tr>
<td>
<img src=<%=path1%> height:200px; width=200px;>
</td>
<td>
<table>
<th>
	<h3><i>About <%=fname%> <%=lname%></i></h3>
</th>
<tr>
	<td>
		NAME
	</td>
	<td>
		<%=fname%> <%=lname%>
	</td>
</tr><br>
<tr>
	<td>
		GENDER
	</td>
	<td>
		<%=gender%>
	</td>
</tr>
<tr>
	<td>
		AGE
	</td>
	<td>
		<%=age%>
	</td>
</tr>
<tr>
	<td>
		RELIGION
	</td>
	<td>
		<%=religion%>
	</td>
</tr>
<tr>
	<td>
		MOTHER TOUNGE
	</td>
	<td>
		<%=mtounge%>
	</td>
</tr>
<tr>
	<td>
		COUNTRY
	</td>
	<td>
		<%=country%>
	</td>

</tr>
<%
	int f=0;
	for(int j=0;j<a.length;j++)
	{
		if(a[j]==idn)
		{
			f=1;
			break;
		}
	}
	if(f!=1)
	{
%>

	<tr>
	<td><br>
		<form action="search2.jsp" method=post>
		<input type=hidden name=gender value=<%=gn%>>
		<input type=hidden name=age_from value=<%=age_from%>>
		<input type=hidden name=age_to value=<%=age_to%>>
		<input type=hidden name=religion value=<%=reli%>>
		<input type=hidden name=language value=<%=language%>>


		<input type=hidden name=id value=<%=idn%>>
		<input type=submit name=submit value=INVITE>
	</form>
	</td>

</tr>
<%
	}
%>
</table>

</td>
</tr>

<%
		}

	}

}
catch(Exception e){
		out.println(e);
	}
%>
