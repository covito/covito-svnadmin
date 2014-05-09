<%@page import="org.svnadmin.entity.Usr"%>
<%@page import="org.svnadmin.servlet.BaseServlet"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://monsoon.com/svnadmin/tags" prefix="sa" %>
<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="utf-8">
    	<title>SVNAdmin 配置管理服务器</title>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<script type="text/javascript" src="<c:url value='/Framework/Main.js' />"></script>
		<script src="<c:url value='/resources/sorttable.js' />"></script>
		<script src="<c:url value='/resources/svnadmin.js' />" ></script>
		<link rel="stylesheet" href="<c:url value='/resources/svnadmin.css' />" />
    	<style type="text/css">
	      body {
	        padding-top: 55px;
	        padding-bottom: 30px;
	      }
	      .sidebar-nav {
	        padding: 9px 0;
	      }
	    </style>
	    <script type="text/javascript">
		  	$(document).ready(function () {
		  		var menuId = $("#pageId").val();
				$("#" + menuId).addClass("active");
		  	});
		</script>
	    <decorator:head/>
	</head>
<%
Usr _usr = BaseServlet.getUsrFromSession(request);
if(_usr == null){%>
<script>
	alert("<sa:i18n id='sys.error.timeout'>超时或未登录</sa:i18n>");	
	top.location="login.jsp";
</script>
<%
	return;
}
%>
  	<body>
    	<div class="navbar navbar-fixed-top">
      		<div class="navbar-inner">
        		<div class="container-fluid">
          			<a class="brand" href="#">SVNAdmin 配置管理服务器</a>
          			<div class="pull-right" style="padding: 10px;">
          				<table>
          				<!-- 
          				<tr>
          					<td colspan="2" align="right"><%@include file="chagelang.jsp"%></td>
          				</tr>
          				 -->
          				<tr>
        				<td>
        					<a href="<c:url value="/usr" />"><sa:i18n id="main.link.user">用户</sa:i18n></a>
        					<span>　|　</span>
							<a href="<c:url value="/pj" />"><sa:i18n id="main.link.pj">项目</sa:i18n></a>
							<span>　|　</span>
							<%
								if(BaseServlet.hasAdminRight(request)){
							%>
							<a href="<c:url value="/i18n" />"><sa:i18n id="main.link.i18n">语言</sa:i18n></a> 
							<span>　|　</span>
							<%
								}
							%>
							<%=_usr.getName()==null?_usr.getUsr():_usr.getName()%>
							<span>　　</span>
        				</td>
        				<td>
          					<a class="btn" href='<c:url value="/login?act=logout" />'><sa:i18n id="main.link.logout">退出</sa:i18n></a>
        				</td>
          				</tr>
          				</table>
          			</div>
        		</div>
      		</div>
    	</div>
    	<div class="container-fluid">
      		<div class="row-fluid">
        		<div class="span12">
          			<div class="hero-unit" >
          				  <c:if test="${error != null}">
	                      	  <div class="alert alert-error clearfix" style="margin-bottom: 5px;width: 195px; padding: 2px 15px 2px 10px;">
	  							${error}
							  </div>
						  </c:if>
          				<decorator:body></decorator:body>
          			</div>
        		</div><!--/span-->
      		</div><!--/row-->
    	</div>
  	</body>
</html>
