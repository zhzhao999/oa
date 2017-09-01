package cnmei.oa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.bean.TreeNode;
import cnmei.oa.pojo.Dict;
import cnmei.oa.service.DictService;

@Controller
@RequestMapping("/dict")
public class DictController extends BaseController{
	
	@Autowired
	private DictService dictService;
	
	@RequestMapping("/show")
	public String show(){
		return "decorators/system/dict";
	}
	
	@RequestMapping("/getItem/{typeCode}")
	@ResponseBody
	private ResultBean getItemByTypeCode(@PathVariable String typeCode){
		List<Dict> list = dictService.getDictByTypeCode(typeCode);
		return ResultBean.build(list);
	}
	
	@RequestMapping("/findAllType")
	@ResponseBody
	public PageInfo<Dict> findAllType(String pageNum,String pageSize) {
		
		int num = 1;  
        int size = 10;  
        if (pageNum != null && !"".equals(pageNum)) {  
            num = Integer.parseInt(pageNum);  
        }  
        if (pageSize != null && !"".equals(pageSize)) {  
            size = Integer.parseInt(pageSize);  
        }  
        // pageHelper分页查询对象  
        PageHelper.startPage(num, size);  
        List<Dict> list = dictService.findAllType();
        PageInfo<Dict> pageInfo = new PageInfo<Dict>(list);  
		return pageInfo;
	}
	
	@RequestMapping("/showTree")
	public String showTree(){
		return "decorators/system/dict2";
	}
	
	@RequestMapping("/tree")
	@ResponseBody
	public ArrayList<TreeNode> findTree() {
		ArrayList<TreeNode> reList = new ArrayList<TreeNode>();
		List<Dict> list = dictService.findAll();
		/*reList.add(new TreeNode(0,null,"字典管理"));*/
		for (Dict dict : list) {
			TreeNode treeNode = new TreeNode(dict.getId(),dict.getParent_id(),dict.getItem_name());
			reList.add(treeNode);
		}
		return reList;
	}
}
