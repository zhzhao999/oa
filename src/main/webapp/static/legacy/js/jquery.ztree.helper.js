
var zTree = {}

//冻结根节点
zTree.lockRootNode = function(treeId, treeNode) {
	return treeNode.level > 0;
}

//禁止选中根节点
zTree.disableSelectRootNode = function(treeId, treeNode, clickFlag) {
	return treeNode.level != 0;
}

//返回第一个被选中的节点或者null
zTree.getSelectedTreeNode = function(treeId) {
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
	var nodes = treeObj.getSelectedNodes();
	if (nodes.length > 0)
		return nodes[0];
	else
		return null;
}

zTree.getZTreeObj = $.fn.zTree.getZTreeObj;

