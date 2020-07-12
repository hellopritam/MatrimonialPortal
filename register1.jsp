<%@include file="connect.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%
 	String email_id=request.getParameter("email_id");
	String pass=request.getParameter("pass");
	String gender=request.getParameter("gender");
	String fname=request.getParameter("fname");
	String dt=request.getParameter("db");
	String lname=request.getParameter("lname");
	String religion=request.getParameter("religion");
	String mtounge=request.getParameter("mtounge");
	String country=request.getParameter("country");

%>
<html>
<body>

<form  action="submit.jsp" methos=post>
<input type=hidden name=email_id value=<%=email_id%>>
<input type=hidden name=pass value=<%=pass%>>
<input type=hidden name=gender value=<%=gender%>>
<input type=hidden name=fname value=<%=fname%>>
<input type=hidden name=lname value=<%=lname%>>
<input type=hidden name=db value=<%=dt%>>
<input type=hidden name=religion value=<%=religion%>>
<input type=hidden name=mtounge value=<%=mtounge%>>
<input type=hidden name=country value=<%=country%>>
<fieldset>
		<legend>About You</legend>
		CITY<input type=text name=city><br><br>
		MARITAL STATUS<input type="text" name="mstatus"></br></br>
		EDUCATION<input type="text" name="education"></br></br>
		ANNUAL INCOME(INR)<input type="text" name="income"><br><br>
		DIET<input type="text" name="diet"><br><br>
		HEIGHT<input type="text" name="height"><br><br>
		BODY TYPE<select name="bodytype">
		<option value="slim">slim</option>
		<option value="athletic">athletic</option>
		<option value="average">average</option>
		<option value="heavy">heavy</option>
		</select><br><br>
		SKIN TONE<select name="skintone">
		<option value="veryfair">very fair</option>
		<option value="fair">fair</option>
		<option value="dark">dark</option>
		</select><br><br>
		MOBILE NUMBER<input type="text" name="mnumber">
</fieldset>
<br><input type="submit" value="SUBMIT">
</form>
</body>
</html>
