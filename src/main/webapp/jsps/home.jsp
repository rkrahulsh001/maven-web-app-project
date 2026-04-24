<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KaniTechnologies- Home Page</title>
<link href="images/kani-logo.jpg" rel="icon">
</head>
</head>
<body>
<h1 align="center">Welcome to Devops Learning</h1>
<h1 align="center">Phone Number: +91 9773819218</h1>
<h1 align="center">We are Learning AWS DevOps, Jenkins, Docker, Kubernetes, GitOps, ArgoCD, Terraform and Amazon Web Services</h1>

<h1 align="center">Trainer Name: Kanimozhi Viswanathan</h1>

<hr>
<br>
	<h1><h3> Server Side IP Address </h3><br>

<% 
String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Server Host Name :: "+inetAddress.getHostName()); 
%>
<br>
<%out.println("Server IP Address  :: "+ip);%>
</h1>
<br>
<h1><h3> Client Side IP Address </h3><br>
<%out.print( "Client IP Address  :: "+request.getRemoteAddr()); %><br>
<%out.print( "Client Name Host :: "+request.getRemoteHost() );%><br></h1>
<hr>
<div style="text-align: center;">
	<span>
		<img src="images/kani-logo.jpg" alt="" width="100">
	</span>
	<span style="font-weight: bold;">
		Kanimozhi, DEVOPS Engineer, Opstree solutions Pvt ltd.
		<br>
		
	</span>
</div>

<hr>
<p align=center>Kanimozhi Devops Engineer.</p>
<p align=center><small>Copyrights 2026 by Kanimozhi </small></p>

</body>
</html>
