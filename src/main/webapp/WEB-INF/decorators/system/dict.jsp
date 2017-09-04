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
<script type="text/javascript" src="${ctx}/static/legacy/js/jquery.ztree.helper.js"></script>
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
						<!-- <button type="button" id="new-dic-btn" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span> 新增</button> -->
						<button type="button" id="mod-dic-btn" class="btn btn-default"><span class="glyphicon glyphicon-edit"></span> 修改</button>
						<!-- <button type="button" id="del-dic-btn" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span> 删除</button> -->
					</div>
				</div>
				
				<div class="tree-container">
				   <ul id="dicTree" class="ztree"></ul>
				</div>
			</div><!-- 字典类别  end-->
		
		</div>
	</div>
	
	
	
	<div class="modal fade" id="updateDicModel" tabindex="-1" role="dialog" aria-labelledby="dictModalLabel">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="dictModalLabel">修改字典项</h4>
                 </div>
                  <div class="modal-body">
  
                     <div class="form-group">
                         <label for="txt_departmentname">字段名称</label>
                         <input type="text" name="item_name" class="form-control" id="item_name" placeholder="">
                     </div>
                     <div class="form-group">
                         <label for="txt_parentdepartment">字段码</label>
                         <input type="text" name="item_code" class="form-control" id="item_code" disabled="disabled" placeholder="">
                     </div>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                     <button type="button" id="btn_update" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                 </div>
             </div>
         </div>
     </div>
</div>


<script type="text/javascript">
$(function() {
	//左侧菜单高亮显示
	menu.active('#dict-list');
	
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
function beforeClickZtree(treeId, treeNode){ } 

//新建字典项
$('#new-dic-btn').click(function() {
	var node = zTree.getSelectedTreeNode('dicTree');
	if (node) {
		alert(node.id + "   " +node.name);
		common.log(node);
	}else{
		alert("请先选择要操作的节点")
	}
});

//修改字典项
$('#mod-dic-btn').click(function() {
	var node = zTree.getSelectedTreeNode('dicTree');
	if (node) {
		common.log(node);
		if (node.pId == 22 || node.pId == 23) {
			$('#item_code').attr("disabled",false); 
			$('#item_name').val(node.name);
			$('#item_code').val(node.item_code); 
		}else{
			$('#item_code').attr("disabled",true); 
			$('#item_name').val(node.name);
			$('#item_code').val(node.item_code);
		}
		$('#updateDicModel').modal();
		update(node.id);
	}else{
		alert("请先选择要操作的节点")
	}
});

//删除字典项
$('#del-dic-btn').click(function() {
	var node = zTree.getSelectedTreeNode('dicTree');
	if (node) {
		if (node.pId == 0) {
			alert("系统保留字段 无法删除")
		}else{
			alert(node.id + "   " +node.name);
			common.log(node);
		}
	}else{
		alert("请先选择要操作的节点")
	}
});

// 更新字典
function update(id) {
	
	var itemName = "";
	var itemCode = "";
	$('#btn_update').on('click',function(){
		itemName = $('#item_name').val();
		itemCode = $('#item_code').val();
		
		$.ajax({
	        url: '${ctx }/dict/update',
	        type: 'POST',
	        dataType: 'json',
	        data: {
	        	id: id,
	        	item_name: itemName,
	        	item_code: itemCode,
	        },
	        success: function (data) {
	        	if (data.code == 1) {
	        		//重新加载树结构
	        		initMyZtree();
				}else{
					alert(data.message);
				}
	        }
	    });
	});
}

</script>
	
</body>
</html>
