<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<form class="well form-inline" action="./../admin/config">
	<label class="control-label">group:</label>
	<input type="text" class="input-medium" value="${group}" name="group">
	<label class="control-label">dataId:</label>
	<input type="text" class="input-medium" value="${dataId}" name="dataId">
  	<button class="btn btn-primary" type="submit">查询</button>
  	<button class="btn" type="reset">重置</button>
</form>

<c:if test="${sessionScope.message != null}">
	<div class="alert alert-error clearfix" style="margin-bottom: 5px;width: 195px; padding: 2px 15px 2px 10px;">
		${sessionScope.message}
	</div>
</c:if>

<table class="table table-striped table-bordered">
  	<thead>
    	<tr>
      		<th width="100px">group</th>
      		<th width="100px">dataId</th>
      		<th width="100px">所属用户</th>
      		<th>描述</th>
      		<th width="200px">操作</th>
    	</tr>
  	</thead>
  	<tbody>
    	<c:forEach items="${page.pageItems}" var="configInfo">
			<tr>
              	<td>
                  	<c:out value="${configInfo.group}" escapeXml="false"/>
               	</td>
               	<td>
              		<c:out value="${configInfo.dataId}"/>
               	</td>
               	<td>
              		<c:out value="${configInfo.userName}"/>
               	</td>
               	<td>
              		<c:out value="${configInfo.description}"/>
               	</td>
              	<c:url var="getConfigInfoUrl" value="/admin/detailConfig" >
                  	<c:param name="group" value="${configInfo.group}" />
                  	<c:param name="dataId" value="${configInfo.dataId}" />
              	</c:url>
               	<c:url var="deleteConfigInfoUrl" value="/admin/delete" >
                  	<c:param name="id" value="${configInfo.id}" />
              	</c:url>
               	<c:url var="saveToDiskUrl" value="/notify" >
                   	<c:param name="group" value="${configInfo.group}" />
                  	<c:param name="dataId" value="${configInfo.dataId}" />
              	</c:url>
              	<c:url var="previewUrl" value="/config" >
                  	<c:param name="group" value="${configInfo.group}" />
                  	<c:param name="dataId" value="${configInfo.dataId}" />
              	</c:url>
              	<td>
              		<c:if test="${sessionScope.user ==  configInfo.userName }">
                 		<a href="${getConfigInfoUrl}">编辑</a>&nbsp;&nbsp;&nbsp;
                 		<a href="${deleteConfigInfoUrl}" class="deleteConfig">删除</a>&nbsp;&nbsp;&nbsp;
                 		<a href="${saveToDiskUrl}" target="_blank">保存磁盘</a>&nbsp;&nbsp;&nbsp;
                 	</c:if>
                 	<a href="${previewUrl}" target="_blank">预览</a>
              	</td>
            </tr>
		</c:forEach>
	</tbody>
</table>

<c:url var="nextPage" value="/admin/config" >
      <c:param name="group" value="${group}" />
      <c:param name="dataId" value="${dataId}" />
      <c:param name="pageNo" value="${page.pageNumber+1}" />
      <c:param name="pageSize" value="10" />
</c:url>
<c:url var="prevPage" value="/admin/config" >
      <c:param name="group" value="${group}" />
      <c:param name="dataId" value="${dataId}" />
      <c:param name="pageNo" value="${page.pageNumber-1}" />
      <c:param name="pageSize" value="10" />
</c:url>
<c:url var="firstPage" value="/admin/config" >
      <c:param name="group" value="${group}" />
      <c:param name="dataId" value="${dataId}" />
      <c:param name="pageNo" value="1" />
      <c:param name="pageSize" value="10" />
</c:url>
<c:url var="lastPage" value="/admin/config" >
      <c:param name="group" value="${group}" />
      <c:param name="dataId" value="${dataId}" />
      <c:param name="pageNo" value="${page.pagesAvailable}" />
      <c:param name="pageSize" value="10" />
</c:url>
<ul class="pager">
	<button class="btn btn-primary" onclick="window.location.href = './../admin/confignew'">添加配置信息</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	总页数:<c:out value="${page.pagesAvailable}"/>&nbsp;&nbsp;当前页:<c:out value="${page.pageNumber}"/>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="${firstPage}">首页</a>&nbsp;&nbsp; 
	<c:choose>
       <c:when  test="${page.pageNumber==1 && page.pagesAvailable>1}">
         	<li><a href="${nextPage}">下一页</a></li>  &nbsp; &nbsp;
       </c:when>
       <c:when  test="${page.pageNumber>1 && page.pagesAvailable==page.pageNumber}">
         	<li><a href="${prevPage}">上一页</a></li>  &nbsp; &nbsp;
       </c:when>
       <c:when  test="${page.pageNumber==1 && page.pagesAvailable==1}">
       </c:when>
       <c:otherwise>
          <li><a href="${prevPage}">上一页</a></li>  &nbsp; &nbsp;
          <li><a href="${nextPage}">下一页</a></li>  
       </c:otherwise>
    </c:choose>
	<li><a href="${lastPage}">末页</a></li>&nbsp;&nbsp;
</ul>

<script type="text/javascript">

$(document).ready(function () {
	$("a.deleteConfig").click(function(e) {
	    e.preventDefault();
	    bootbox.confirm("确定删除配置信息，删除之后不可恢复！", function(confirmed) {
	    	if(confirmed)
	    		window.location.href = e.target.href;
	    });
	    
	    return false;
	});
});
</script>