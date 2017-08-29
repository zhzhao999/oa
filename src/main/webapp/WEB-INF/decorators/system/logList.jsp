<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>操作日志</title>
<link href="${ctx }/static/legacy/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
<link href="${ctx }/css/pager.css" rel="stylesheet" type="text/css">
<script src="${ctx }/static/legacy/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="${ctx }/js/page.js" type="text/javascript"></script>
</head>
<body>

<div class="panel panel-default">
	<div class="panel-heading">
		<ul class="breadcrumb">
			<li><span class="glyphicon glyphicon-home"></span> 系统管理</li>
			<li class="active">操作日志</li>
		</ul>
	</div>
	<div class="panel-body">
		<div class="topwrap">
			<form class="form-inline">
					<div class="form-group">
				          <input type="text" class="form-control input-sm" id="name" placeholder="操作人"/>
			        </div>
			        <div class="form-group">
				          <input type="text" class="form-control input-sm" id="module" placeholder="操作模块"/>
			        </div>
			        <div class="form-group form-group-sm"> 
                        <label>操作时间</label>
                        <div class="input-group">
                        <input type="text" class="form-control Wdate" id="startTime" onFocus="WdatePicker({lang:'zh-cn'})">
                        <div class="input-group-addon">至</div>
                        <input type="text" class="form-control Wdate"  id="endTime" onFocus="WdatePicker({lang:'zh-cn'})">
                        </div>
                    </div> 
			        <div class="form-group">
					<input id="submit" class="btn btn-primary btn-sm" type="button" value="查询">
					</div>
				</form>

		</div>
		<table class="table table-bordered table-condensed table-hover" style="table-layout:fixed;word-wrap:break-word;word-break:break-all">
			<thead>
			        <tr class="thead">
		                <th>编号</th>
		                <th>操作人</th>
		                <th>操作模块</th>
			            <th>操作内容</th>
			            <th>操作时间</th>
			        </tr>
			    </thead>
			    <tbody id="contList"></tbody>
			</table>
			<div class="page_number clearfix myPager" id="myPager">
		        <a class="PageButton prev fl" data-val="prev"><i class="icon-iconfont-zuosanjiao"></i>上一页</a>
		        <ul>
		        </ul>
		        <a class="PageButton next fr" data-val="next">下一页<i class="icon-iconfont-yousanjiao"></i></a>
		        <div class="count fr" id="count">共<em>0</em>条</div>
		     </div>
	</div>
</div>

<script type="text/javascript">
menu.active('#use-log');
$(function(){
	//查询
	var name = '';
	var module = '';
	var startTime = '';
	var endTime = '';
	$('#submit').on('click',function(){
		name = $('#name').val();
		module =  $('#module').val();
		startTime = $('#startTime').val();
		endTime = $('#endTime').val();
		getList();
	});
	// 初始化分页,获取添加分页的节点
    var myPager = new Pager($('#myPager'));
	//  获取容器
    var dataList = $('#contList');
	// 默认分页为1
    var page = 1;
	//请求数据
    function getList() {
        $.ajax({
            url: '${ctx }/log/findAll',
            type: 'POST',
            dataType: 'json',
            data: {
            	name: name,
            	module:module,
            	startTime: startTime,
            	endTime: endTime,
                pageNum: page,
                pageSize: 10
            },
            success: function (data) {
            	//console.log(data);
                //传入两个参数 ，1当前页 ，2分页总数
                myPager.paint(page, data.pages);
                //总条数
                $('#count em').text(data.total);
                //清空上一页数据
                dataList.empty();
                //插入数据
                $(createTab(data.list)).appendTo($(dataList));
                $("#contList li:nth-child(4n)").css("marginRight", "0px");
                if(data.total > 1){
                	//显示分页
                	$('#myPager').show();
                } 
            }
        });
    }
	//返回、加载列表
    function createTab(list) {
        var data = list;
        var html = '';
        for (var i = 0, len = data.length; i < len; i++) {
            html += '<tr>' +
            	'<td>' + data[i].id + '</td>' +
            	'<td>' + data[i].user_name + '</td>' +
            	'<td>' + data[i].ope_module + '</td>' +
            	'<td>' + data[i].ope_context + '</td>' +
            	'<td>' + formatDate(data[i].ope_date) + '</td>' +
            	'</tr>';
        }
        return html;
    }
    
	// 监听页面切换
    myPager.on('page', function (data) {

        //获取当前点击页数,赋值给page
        page = data.page;
        // 更新数据
        getList();
     // 删除层
    });
	//调用列表
    getList();
	// 时间戳
	function formatDate(data){
		if(!data){
			return '-';
		}
		var da = new Date(data);
	    var year = da.getFullYear()+'-';
	    var month = da.getMonth()+1+'-';
	    var date = da.getDate()+' ';
	    var hour = da.getHours()+':';
        var min = da.getMinutes()+':';
        var seconds = da.getSeconds();
	    return [year,month,date,hour,min,seconds].join('');
	}
});
</script>
</body>
</html>