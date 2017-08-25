<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp"%>

<!doctype html>
<html>
<head>
    <title>员工管理</title>
    <script src="${ctx }/static/legacy/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<link href="${ctx }/static/legacy/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
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
				<form class="form-inline" action="${ctx }/employee/showSearchList" >
					<div class="form-group">
				          <input type="text" class="form-control input-sm" name="name" placeholder="按名称查询" value="${param.name }"/>
			        </div>
			        <div class="form-group form-group-sm"> 
                        <label>入职时间</label>
                        <div class="input-group">
                        <input type="text" class="form-control Wdate" name="startTime" value="${param.startTime }" 
                            onFocus="WdatePicker({lang:'zh-cn'})">
                        <div class="input-group-addon">至</div>
                        <input type="text" class="form-control Wdate"  name="endTime" value="${param.endTime }" 
                            onFocus="WdatePicker({lang:'zh-cn'})">
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
								<a id="look" href="${ctx }/employee/showDetail/${em.id }" class="btn btn-default btn-sm">查看</a>
								<a id="look" href="${ctx }/employee/showUpdate/${em.id }" class="btn btn-default btn-sm">修改</a>
								<a href="javascript:if(confirm('确实要删除该员工吗?'))location='${ctx }/employee/deleteEm/${em.id}'" class="btn btn-default btn-sm">删除</a>
							</div>
		                </td>
			        </tr>
			        </c:forEach>
			        
			    </tbody>
			</table>
			<!-- <div class="row"><ul class="page" maxshowpageitem="5" pagelistcount="10"  id="page"></ul></div> -->
			    <script type="text/javascript">
				    var GG = {
				        "kk":function(mm){
				            //alert(mm);
				        }
				    }
				    $("#page").initPage(100,1,GG.kk);
				</script>
        </div>
	</div>

</body>
</html>
