<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<html>
<head>
<title>错误</title>
</head>
<body>
<div>
发生错误，请联系管理员<br><br>
<%
StringWriter sWriter = new StringWriter();
PrintWriter pWriter = new PrintWriter(sWriter);
exception.printStackTrace(pWriter);
%>
<code style="color:red;">
<%=sWriter.toString()%>
</code>
</div>
</body>
</html>