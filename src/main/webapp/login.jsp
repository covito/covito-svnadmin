<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://monsoon.com/svnadmin/tags" prefix="sa" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SVNAdmin 配置管理服务器</title>
    <script type="text/javascript" src='<c:url value="/Framework/Main.js" />'></script>
    <style type="text/css">
      /* Override some defaults */
      html, body {
        background-color: #eee;
      }
      body {
        padding-top: 40px; 
      }
      .container {
        width: 300px;
      }

      /* The white background content wrapper */
      .container > .content {
        background-color: #fff;
        padding: 20px;
        margin: 0 -20px; 
        -webkit-border-radius: 10px 10px 10px 10px;
           -moz-border-radius: 10px 10px 10px 10px;
                border-radius: 10px 10px 10px 10px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
      }

    .login-form {
      margin-left: 65px;
    }
  
    legend {
      margin-right: -50px;
      font-weight: bold;
      color: #404040;
    }

    </style>

</head>
<body>
  <div class="container">
      <div class="content">
          <div class="row">
              <div class="login-form">
                  <h2>SVN Login</h2>
                  <form action='<c:url value="/login" />' method="post" autocomplete="off" >
                      <fieldset>
                      	  <c:if test="${error != null}">
	                      	  <div class="alert alert-error clearfix" style="margin-bottom: 5px;width: 195px; padding: 2px 15px 2px 10px;">
	  							${error}
							  </div>
						  </c:if>
						  
                          <div class="clearfix">
                              <input type="text" placeholder='<sa:i18n id="usr.usr">用户名</sa:i18n>' name="usr" value='<sa:param var="usr"/>'/>
                          </div>
                          
                          <div class="clearfix">
                              <input type="password" placeholder='<sa:i18n id="usr.psw">密码</sa:i18n>' name="psw" value="<sa:param var="psw"/>"/>
                          </div>
                          <button class="btn btn-primary" type="submit"><sa:i18n id="login.btn.login">登 录</sa:i18n></button>
                          <button class="btn" type="reset"><sa:i18n id="login.btn.reset">重 置</sa:i18n></button>
                      </fieldset>
                  </form>
              </div>
          </div>
      </div>
  </div> <!-- /container -->
</body>
</html>