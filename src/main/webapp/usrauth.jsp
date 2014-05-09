<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://monsoon.com/svnadmin/tags" prefix="sa" %>
<span style="color:green;font-weight:bold;">
<a href='<c:url value="/usr"/>'><sa:i18n id="usr.title">用户管理</sa:i18n></a>　|　
<sa:i18n id="usr.op.listauth">查看权限</sa:i18n>(<sa:param var="usr"/>)
</span><br><br>
<br>
<sa:i18n id="usr.op.listauth">查看权限</sa:i18n><br>
<table class="table table-striped table-bordered">
	<thead>
	<tr>
		<td><sa:i18n id="sys.lbl.no">NO.</sa:i18n></td>
		<td><sa:i18n id="pj.pj">项目</sa:i18n></td>
		<td><sa:i18n id="pj.des">描述</sa:i18n></td>
		<td><sa:i18n id="usr.usr">用户</sa:i18n></td>
		<td><sa:i18n id="pjauth.res">资源</sa:i18n></td>
		<td><sa:i18n id="pjauth.rw">权限</sa:i18n></td>
	</tr>
	</thead>
	<c:forEach items="${auths}" var="auth" varStatus="st" >
	<tr>
		<td><c:out value="${st.index+1}"/></td>
		<td><c:out value="${auth.pj}"/></td>
		<td><c:out value="${auth.des}"/></td>
		<td><c:out value="${auth.usr}"/></td>
		<td><c:out value="${auth.res}"/></td>
		<td>
		<c:choose>
			<c:when test="${auth.rw == 'r' }">
            	<sa:i18n id="pjauth.rw.r">可读</sa:i18n>
			</c:when>
			<c:when test="${auth.rw == 'rw' }">
            	<sa:i18n id="pjauth.rw.rw">可读可写</sa:i18n>
			</c:when>
			<c:otherwise>
            	<sa:i18n id="pjauth.rw.none">没有权限</sa:i18n>
			</c:otherwise>
		</c:choose>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="6" style="text-align: center;">
		<button class="btn btn-primary" onclick="history.go(-1);">返回</button>
		</td>
	</tr>
</table>
