<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>

<!doctype html>
<html>
<head>
    <title>员工管理</title>
</head>
<body>
    <div class="panel panel-default">                    
        <div class="panel-heading">
            <ul class="breadcrumb">
              <li><span class="glyphicon glyphicon-home"></span> 员工管理</li>
              <li class="active">员工列表</li>
            </ul>
        </div>
		
		<div class="panel-body">
            <div class="subtt appearance-style">
            	<div class="col-md-10 mt10 text-left">
				<form class="form-inline" >
					<div class="form-group">
				          <input type="text" class="form-control input-sm" id="name" name="search_LIKE_name" placeholder="按名称查询" value=""/>
			        </div>
			        <div class="form-group form-group-sm"> 
                        <label>入职时间</label>
                        <div class="input-group">
                        <input type="text" class="form-control" id="search_GTE_createTime" name="search_GTE_createTime" value="${param.search_GTE_createTime }" 
                            onfocus="WdatePicker({lang:'zh-cn'})">
                        <div class="input-group-addon">至</div>
                        <input type="text" class="form-control" id="search_LTE_createTime" name="search_LTE_createTime" value="${param.search_LTE_createTime }" 
                            onfocus="WdatePicker({lang:'zh-cn'})">
                        </div>
                    </div> 
			        <div class="form-group">
					<button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i> 查询</button>
					</div>
				</form>
				</div>
                <div class="btn-group-sm mt10">
	                  <a class="btn btn-primary" href="${ctx }/employee/showAddEm"><i class="fa fa-plus"></i>新增员工</a>
                </div>
            </div>
            <table class="table table-bordered table-condensed table-hover" style="table-layout:fixed;word-wrap:break-word;word-break:break-all">
			<thead>
			        <tr class="thead">
		                <th>名称</th>
			            <th>学校</th>
			            <th>日期</th>
		                <th>操作</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items="${emList}" var="em">
			        <tr>
			            <td>${em.name }</td>
			            <td>${em.school}</td>
			           	<td><fmt:formatDate value="${em.birthday }" pattern="yyyy-MM-dd"/></td>
		                <td>
							<div class="btn-group" role="group" aria-label="...">
								<a id="look" href="${ctx }/employee/emDetail/${em.id }" class="btn btn-default btn-sm">查看</a>
									<a href="javascript:if(confirm('确实要删除该员工吗?'))location='${ctx }/employee/deleteEm/${item.id}'" class="btn btn-default btn-sm">删除</a>
							</div>
		                </td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>
        </div>
	</div>

<script type="text/javascript">
$(function() {
    menu.active('#package-manage');
});
</script>        
</body>
</html>
