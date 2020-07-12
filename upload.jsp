<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@include file="connect.jsp" %>
<%
		try{
		String name="";
		Cookie a[]=request.getCookies();
		String index="";
		if(a !=null)
		{
			for(int i=0;i<a.length;i++)
			{
				if(a[i].getName().equals("frist"))
				{
						index=a[i].getValue();
				}
			}

		}
		File stdir=new File("webapps\\m2\\img1\\"+index);
		stdir.mkdirs();
		ServletContext sc=getServletContext();
		String path="img1\\"+index;
		PreparedStatement pst=con.prepareStatement("select * from pritam.info where id=? ");
		pst.setInt(1,Integer.parseInt(index));
		ResultSet rs=pst.executeQuery();
		if(rs.next())
		{
			name=rs.getString("fname");
		}
		String path2="C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\m2\\"+path;
		MultipartRequest m=new MultipartRequest(request,path2);
		String f_name=m.getOriginalFileName("nm1");
		String path1=path+"\\"+f_name;
		PreparedStatement pst1=con.prepareStatement("insert into pritam.image values(?,?,?)");
		pst1.setInt(1,Integer.parseInt(index));
		pst1.setString(2,path1);
		pst1.setInt(3,1);
		int t=pst1.executeUpdate();
		if(t>0)
			{
%>
<html>
<head>
<style>
a{
                text-decoration: none;
                color:orange;
                font-size:30px;
            }

</style>
</head>
<body>
<fieldset>
<legend>Status</legend>
<h2>Profile Picture Properly Uploaded</h2>
</fieldset><br>
<h2><a href="login.html">Welcome <%=name%> to @Saadhi</a></h2>
</body>
</html>
<%
	}
}


		catch(Exception e)
		{
		out.println(e);
		}
%>
