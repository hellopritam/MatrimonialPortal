<%@include file="connect.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%

try{
	String idn=" ";
 	String pass=request.getParameter("pass");
	String gender=request.getParameter("gender");
	String fname=request.getParameter("fname");
	String dt=request.getParameter("db");
	String lname=request.getParameter("lname");
	String religion=request.getParameter("religion");
	String mtounge=request.getParameter("mtounge");
	String country=request.getParameter("country");
	String city=request.getParameter("city");
	String mstatus=request.getParameter("mstatus");
	String education=request.getParameter("education");
	int  income=Integer.parseInt(request.getParameter("income"));
	String diet=request.getParameter("diet");
	String height=request.getParameter("height");
	String bodytype=request.getParameter("bodytype");
	String skintone=request.getParameter("skintone");
	long mnumber=Long.parseLong(request.getParameter("mnumber"));
	String email_id=request.getParameter("email_id");
	String st=email_id;
	int dm=0;
	int dy=0;
	String ag[]=dt.split("-");
	int yy=Integer.parseInt(ag[0]);
	int mm=Integer.parseInt(ag[1]);
	java.util.Date d=new java.util.Date();
	SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	String dt1= formatter.format(d);
	String ag1[]=dt1.split("-");
	int yy1=Integer.parseInt(ag1[2]);
	int mm1=Integer.parseInt(ag1[1]);

	if(mm1<mm)
	{
	mm1=mm1+12;
	yy=yy+1;
	}
	dm=mm1-mm;
	dy=yy1-yy;

PreparedStatement pst=con.prepareStatement("insert into pritam.mlogin values(?,?,id.nextval)");
pst.setString(1,email_id);
pst.setString(2,pass);
int t=pst.executeUpdate();

PreparedStatement pst1=con.prepareStatement("insert into pritam.info values(id1.nextval,?,?,?,?,?,?,?)");
pst1.setString(1,gender);
pst1.setString(2,fname);
pst1.setString(3,lname);
pst1.setInt(4,dy);
pst1.setString(5,religion);
pst1.setString(6,mtounge);
pst1.setString(7,country);
int t1=pst1.executeUpdate();

PreparedStatement pst2=con.prepareStatement("insert into pritam.dinfo values(id2.nextval,?,?,?,?,?,?,?,?,?)");
pst2.setString(1,city);
pst2.setString(2,mstatus);
pst2.setString(3,education);
pst2.setInt(4,income);
pst2.setString(5,diet);
pst2.setString(6,height);
pst2.setString(7,bodytype);
pst2.setString(8,skintone);
pst2.setLong(9,mnumber);
int t2=pst2.executeUpdate();


PreparedStatement pst3=con.prepareStatement("select * from pritam.mlogin where email_id=? and pass=?");
pst3.setString(1,email_id);
pst3.setString(2,pass);
ResultSet rs=pst3.executeQuery();
if(rs.next())
	{
		idn=rs.getString("id");
	}
Cookie ob1=new Cookie("frist",idn);
response.addCookie(ob1);
if(t>0 && t1>0 && t2>0)
{
	%>
<html>
<body>
<form enctype="multipart/form-data" action="upload.jsp" method=post>
<fieldset>
	<legend>Status</legend>
<h1>Account Created Successfully<h1><br>
<h2>user id: <h2><%=email_id%><br>
<h2>password: <h2><%=pass%>
</fieldset>
<fieldset>
	<legend>Upload Your's profile picture</legend>
	<input type=file name=nm1><br>
	<i>save your's image fristname.jpg format<i>

</fieldset><br>
<input type=submit>

</form>
</body>
</html>
<%
	}
}
catch(Exception e)
{out.println(e);}
%>
