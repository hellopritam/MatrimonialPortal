<%@ include file="connect.jsp" %>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ include file="11.jsp" %>
<%
session.removeAttribute("usrid");
session.invalidate();
response.sendRedirect("index.jsp");
%>
