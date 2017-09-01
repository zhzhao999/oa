package cnmei.oa.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.bean.SalaryVO;
import cnmei.oa.pojo.Employee;
import cnmei.oa.pojo.Log;
import cnmei.oa.pojo.SalaryPostLevel;
import cnmei.oa.service.SalaryPostLevelService;

@Controller
@RequestMapping("/salary/dict/postLevel")
public class SalaryPostLevelController extends BaseController{
	
	@Autowired
	private SalaryPostLevelService postLevelService;
	
	@RequestMapping("/showList")
	public String showSalaryList(){
		return "decorators/salary/salaryPostLevelList";
	}
	
	@RequestMapping("/type")
	@ResponseBody
	public ResultBean findAllType(){
		List<SalaryPostLevel> list = postLevelService.findAllType();
		return ResultBean.build(list);
	}
	
	@RequestMapping("/showListByPage")
	@ResponseBody
	public PageInfo<SalaryPostLevel> showListByPage(String pageNum,String pageSize,String type_name){
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("type_name", type_name);
		
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
        List<SalaryPostLevel> searchList = postLevelService.findSearch(params);
        PageInfo<SalaryPostLevel> pageInfo = new PageInfo<SalaryPostLevel>(searchList);  
		return pageInfo;
	}
	
	@RequestMapping(value="/showUpdate/{id}")
	public String showUpdate(Model model,@PathVariable String id){
		SalaryPostLevel postLevel = postLevelService.findById(id);
		model.addAttribute("level", postLevel);
		return "decorators/salary/updatePost";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateLevel(SalaryPostLevel level){
		postLevelService.updateById(level);
		return "redirect:/salary/dict/postLevel/showList";
	}
}
