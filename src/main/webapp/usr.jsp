<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://monsoon.com/svnadmin/tags" prefix="sa" %>
<%@page import="org.svnadmin.Constants"%>
<%@page import="org.svnadmin.util.I18N"%>
<%@include file="header.jsp"%>
<span style="color:green;font-weight:bold;"><%=I18N.getLbl(request,"usr.title","用户管理") %></span><br><br>
<%
boolean hasAdminRight = (Boolean)request.getAttribute("hasAdminRight");
%>

<%
org.svnadmin.entity.Usr entity = (org.svnadmin.entity.Usr)request.getAttribute("entity");
if(entity==null)entity=new org.svnadmin.entity.Usr();
%>
<script>
function checkForm(f){
	if(f.elements["usr"].value==""){
		alert("<%=I18N.getLbl(request,"usr.error.usr","用户不可以为空") %>");
		f.elements["usr"].focus();
		return false;
	}
	if(f.elements["psw"].value==""  && f.elements["newPsw"]!=null && f.elements["newPsw"].value==""){
		alert("<%=I18N.getLbl(request,"usr.error.psw","密码不可以为空") %>");
		f.elements["psw"].focus();
		return false;
	}
	return true;
}
</script>
<form name="usr" action="<%=ctx%>/usr" method="post" onsubmit="return checkForm(this);">
	<input type="hidden" name="act" value="save">
	<table class="table table-striped table-bordered">
		<tr>
			<td class="lbl"><%=I18N.getLbl(request,"usr.usr","用户") %></td>
			<td>
				<%if(hasAdminRight){ %>
					<input type="text" name="usr" value="<%=entity.getUsr()==null?"":entity.getUsr()%>" 
					onkeyup="value=value.replace(/[^._\-A-Za-z0-9*]/g,'')">
					<span style="color:red;">*</span>
				<%}else{ %>
				   	<input type="hidden" name="usr" value="<%=entity.getUsr()==null?"":entity.getUsr()%>" >
				   	<%=entity.getUsr()==null?"":entity.getUsr()%>
				<%} %>				
			</td>
			
			<td class="lbl"><%=I18N.getLbl(request,"usr.name","姓名") %></td>
			<td>
				<input type="text" name="name" value="<%=entity.getName()==null?"":entity.getName()%>">
			</td>
			
			<td class="lbl"><%=I18N.getLbl(request,"usr.psw","密码") %></td>
			<td>
			<input type="password" name="newPsw" value="">
			<input type="hidden" name="psw" value="<%=entity.getPsw()==null?"":entity.getPsw()%>">
			</td>
			
			<%if(hasAdminRight){ %>
			<td class="lbl"><%=I18N.getLbl(request,"usr.role","角色") %></td>
			<td>
				<select name="role">
					<option value=""><%=I18N.getLbl(request,"usr.role.select","选择角色") %></option>
					<option value="<%=Constants.USR_ROLE_ADMIN%>" <%=Constants.USR_ROLE_ADMIN.equals(entity.getRole())?"selected='selected'":""%>>admin</option>
				</select>
			</td>
			<%} %>
			<td>
				<input type="submit" class="btn btn-primary" value="<%=I18N.getLbl(request,"usr.op.submit","提交") %>">
			</td>
		</tr>
	</table>
</form>

<%if(hasAdminRight){ %>

<table class="table table-striped table-bordered">
	<thead>
		<tr>
		<td><sa:i18n id="sys.lbl.no">NO.</sa:i18n></td>
		<td><sa:i18n id="usr.usr">用户</sa:i18n></td>
		<td><sa:i18n id="usr.name">姓名</sa:i18n></td>
		<td><sa:i18n id="usr.psw">密码</sa:i18n></td>
		<td><sa:i18n id="usr.role">角色</sa:i18n></td>
		<td><sa:i18n id="usr.op.delete">删除</sa:i18n></td>
		<td><sa:i18n id="usr.op.listauth">查看权限</sa:i18n></td>
		</tr>
	</thead>
	<c:forEach items="${list}" var="usr" varStatus="st" >
	<c:if test="${usr.usr != '*' }">
	<tr>
		<td><c:out value="${st.index+1}"/></td>
		<td>
			<a href="<%=ctx%>/usr?act=get&usr=<c:out value="${usr.usr}"/>"><c:out value="${usr.usr}"/></a>
		</td>
		<td><c:out value="${usr.name}"/></td>
		<td><c:out value="${usr.psw}"/></td>
		<td><c:out value="${usr.role}"/></td>
		<td><a href="javascript:if(confirm('<sa:i18n id="usr.op.delete.confirm">确认删除?</sa:i18n>')){del('<%=ctx%>/usr?usr=<c:out value="${usr.usr}"/>')}"><sa:i18n id="usr.op.delete">删除</sa:i18n></a></td>
		<td><a href="<%=ctx%>/usrauth?usr=<c:out value="${usr.usr}"/>" ><sa:i18n id="usr.op.listauth">查看权限</sa:i18n></a></td>
	</tr>
	</c:if>
	</c:forEach>
</table>
<%} %>
