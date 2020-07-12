<%@ include file="connect.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File"%>
<%@ include file="11.jsp" %>

<%
try{
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
	int uid=(Integer)session.getAttribute("usrid");
	PreparedStatement pst2=con.prepareStatement("select * from pritam.image where id="+uid);
	ResultSet rs2=pst2.executeQuery();
	if(rs2.next())
	{
		path1=rs2.getString("path");
	}
	PreparedStatement pst=con.prepareStatement("select * from pritam.info where id="+uid);
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
	PreparedStatement pst1=con.prepareStatement("select * from pritam.dinfo where id="+uid);
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
<head>


<style>
.background{
  padding:40px 0 10px 0;
  background-image: url("images/back3.jpg");
  background-size: 100%;
  height:500px;
  filter:opacity(0.9);
  z-index: 10;
  position: ;

}
.table{
	transform: translate(10px,-1050px);
	z-index: 20;
}
.table1{
	display:inline-block;
	float:left;
	transform: translate(15px,0px);
	font-size:100%;
	font-weight:bold;
	font-style:italic;
	height:350px;
	margin-top:-14px;
	width:auto;
	border-radius:10%;
  border: 1px solid #662900;
	background-color: #e9c163;
	box-shadow: 10px 10px 15px #330026;
	filter:opacity(0.7);
	padding:10px;
	margin-left:70px;
	}
#pic_design{
	height:350px;
	width:300px;
	border-radius:10%;
  border: 1px solid #662900;
	box-shadow: 10px 10px 15px #330026;
}
#text_design{

}
</style>
</head>

<body>
<div class="background"></div>
<div class="background"></div>
<div class="table">
<table>
<tr>
<td>
<img id="pic_design" src=<%=path1%> height:250px width=250px>
</td>
<td>
<table class="table1">
<th>
	<h3><i>YOUR'S ACCOUNT DETAIL</i></h3>
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
<td>
<table class="table1">
<th>
	<i><h3>MORE DETAIL ABOUT YOU</i></h3>
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
</td>
</tr>
</table>
</div>
</body>
</html>
<%
}
catch(Exception e){
		out.println(e);
	}
%>
