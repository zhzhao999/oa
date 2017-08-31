<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/jslib.jsp" %>
<html>
<head>
	<title>字典管理</title>
	
	<script src="${ctx}/static/legacy/js/bootstrap-validation/validate.js" type="text/javascript"></script>
  	<script src="${ctx}/static/legacy/js/bootstrap-validation/messages_zh.js" type="text/javascript"></script>

</head>

<body>
<script type="text/javascript" src="${ctx}/static/legacy/js/jquery/jquery-ztree/js/jquery.ztree.all-3.5.min.js"></script>

<div class="panel panel-default">

  <div class="panel-heading"><!-- 右侧标题 -->
    <ul class="breadcrumb">
        <li><span class="glyphicon glyphicon-home"></span> 系统管理</li>
        <li class="active">字典管理</li>
    </ul>
  </div><!-- / 右侧标题 -->
  
  
  <div class="panel-body"><!-- 右侧主体内容 -->
    <div class="row">
    
			<div class="col-md-6"><!-- 字典类别 -->
				<div class="form-group form-inline">
					<div class="btn-group btn-group-sm">
						<button type="button" id="new-dic-btn" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span> 新字典</button>
						<button type="button" id="mod-dic-btn" class="btn btn-default"><span class="glyphicon glyphicon-edit"></span> 修改</button>
						<button type="button" id="del-dic-btn" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> 删除</button>
					</div>
					<!-- <input type="text" class="form-control" id="searchDicTree" placeholder="查找字典类别"/> -->
				</div>
				
				<div class="tree-container">
				   <ul id="dicTree" class="ztree"></ul>
				</div>
			</div><!-- 字典类别  end-->
			
			<div class="col-md-6"><!-- 字典项 -->
				<div class="form-group form-inline">
					
				</div>
				
				<div class="tree-container">
				  <ul id="dicItemTree" class="ztree"></ul>
				</div>
			</div><!-- /字典项  end-->
		
		</div>
	</div>

</div>


<script type="text/javascript">
$(function() {
	//左侧菜单高亮显示
	menu.active('#dic-man');
	
	initMyZtree(); 
});
  
var zNodes="";  
var setting = {  
    view: {  
    	showLine: true, 
        selectedMulti: false,
        dblClickExpand: false
    },  
    async: {  
        enable: true,  
        url:"${ctx}/dict/tree",  
        autoParam:["id"]  
    },
    data: {  
        simpleData: {  
            enable: true,  
            idKey:"id",  
            pIdKey:"pId",
            rootPId:0
        }
    },
    callback: {  
        beforeClick: beforeClickZtree  
    }  
};  

function initMyZtree(){  
    $.ajax({                 
        type: "POST",                 
        dataType: "json",                 
        url: '${ctx}/dict/tree',     
        success: function(data) {     
            zNodes=data;  
            $.fn.zTree.init($("#dicTree"), setting, zNodes);  
        }     
    });    
      
}  
  
//单击事件  
function beforeClickZtree(treeId, treeNode){  
    alert(treeNode.id+","+treeNode.name);  
}  
  
</script>
	
</body>
</html>
