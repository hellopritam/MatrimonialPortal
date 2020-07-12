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
String nm="";
String path1="";
String fname="";
String lname="";
String gender="";
String religion="";
String mtounge="";
String country="";
String city="";
String mstatus="";
String education="";
int income=0;
String diet="";
String height="";
String bodytype="";
String skintone="";
long mnumber=0;
int age=0;
int index=0;
int index1=0;
int index2=0;
int uid=0;

int i1=0;

	uid=(Integer)session.getAttribute("usrid");
	PreparedStatement ps=con.prepareStatement("select * from pritam.friends where (id1=? or id2=?) and fcon=? ");
	ps.setInt(1,uid);
	ps.setInt(2,uid);
	ps.setInt(3,1);

	ResultSet rs3=ps.executeQuery();
	while(rs3.next())
	{
		int f=0;
		index=rs3.getInt("id1");
		index1=rs3.getInt("id2");
		if(index==uid)
		index2=index1;
		else
		index2=index;
		for(int i=0;i<50;i++)
		{
			if(a[i]==index2)
			{
			f=1;
			break;
			}
		}

		if(f==0)
		{
		a[i1++]=index2;
		PreparedStatement pst2=con.prepareStatement("select * from pritam.image where id="+index2);
		ResultSet rs2=pst2.executeQuery();
		if(rs2.next())
		{
			path1=rs2.getString("path");
		}
		PreparedStatement pst=con.prepareStatement("select * from pritam.info where id="+index2);
		ResultSet rs=pst.executeQuery();
		if(rs.next())
		{
			 gender=rs.getString("gender");
			 fname=rs.getString("fname");
		 	lname=rs.getString("lname");
			 age=rs.getInt("age");
			religion=rs.getString("religion");
			mtounge=rs.getString("mtounge");
			country=rs.getString("country");
		}
		PreparedStatement pst1=con.prepareStatement("select * from pritam.dinfo where id="+index2);
		ResultSet rs1=pst1.executeQuery();
		if(rs1.next())
		{
			city=rs1.getString("city");
			mstatus=rs1.getString("mstatus");
			education=rs1.getString("education");
			income=rs1.getInt("income");
			diet=rs1.getString("diet");
			height=rs1.getString("height");
			bodytype=rs1.getString("bodytype");
			skintone=rs1.getString("skintone");
			mnumber=rs1.getLong("mnumber");
		}

%>
<html>
<style>
a{
                text-decoration: none;
                color:white;
                font-size:30px;
            }

</style>
</head>
<body>
<style>
body {
  //background-image: url("img1\\uses\\marriage.jpg");
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
	<h3><i>About <%=fname%></i></h3>
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
</table>

</td>
</tr>
<tr>
<table>
<th>
	<i><h3>More Detail About <%=fname%></i></h3>
</th>
<tr>
	<td>
		CITY
	</td>
	<td>
		<%=city%>
	</td>
</tr><br>
<tr>
	<td>
		MARITAL STATUS
	</td>
	<td>
		<%=mstatus%>
	</td>
</tr>
<tr>
	<td>
		EDUCATION
	</td>
	<td>
		<%=education%>
	</td>
</tr>
<tr>
	<td>
		INCOME PER YEAR(INR)
	</td>
	<td>
		<%=income%>
	</td>
</tr>
<tr>
	<td>
		DIET
	</td>
	<td>
		<%=diet%>
	</td>
</tr>
<tr>
	<td>
		HEIGHT
	</td>
	<td>
		<%=height%>
	</td>
</tr>

<tr>
	<td>
		BODY TYPE
	</td>
	<td>
		<%=bodytype%>
	</td>
</tr>

<tr>
	<td>
		SKIN TONE
	</td>
	<td>
		<%=skintone%>
	</td>
</tr>

<tr>
	<td>
		MOBILE NUMBER
	</td>
	<td>
		<%=mnumber%>
	</td>
</tr>
</tr>
</table>
</tr>
</table>
</body>
</html>
<%
		}
	}
}
catch(Exception e){
		out.println(e);
	}
%>
