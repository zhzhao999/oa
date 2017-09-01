package cnmei.oa.controller;

import java.util.HashMap;
import java.util.List;

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
import cnmei.oa.pojo.SalaryLevel;
import cnmei.oa.pojo.SalaryPostLevel;
import cnmei.oa.service.SalaryLevelService;

@Controller
@RequestMapping("/salary/dict/level")
public class SalaryLevelController extends BaseController{
	
	@Autowired
	private SalaryLevelService levelService;
	
	@RequestMapping("/showList")
	public String showSalaryList(){
		return "decorators/salary/salaryLevelList";
	}
	
	@RequestMapping("/type")
	@ResponseBody
	public ResultBean findAllType(){
		List<SalaryLevel> list = levelService.findAllType();
		return ResultBean.build(list);
	}
	
	@RequestMapping("/showListByPage")
	@ResponseBody
	public PageInfo<SalaryLevel> showListByPage(String pageNum,String pageSize,String type_name){
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
        List<SalaryLevel> searchList = levelService.findSearch(params);
        PageInfo<SalaryLevel> pageInfo = new PageInfo<SalaryLevel>(searchList);  
		return pageInfo;
	}
	
	@RequestMapping(value="/showUpdate/{id}")
	public String showUpdate(Model model,@PathVariable String id){
		SalaryLevel postLevel = levelService.findById(id);
		model.addAttribute("level", postLevel);
		return "decorators/salary/updateLevel";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateLevel(SalaryLevel level){
		levelService.updateById(level);
		return "redirect:/salary/dict/level/showList";
	}
}
