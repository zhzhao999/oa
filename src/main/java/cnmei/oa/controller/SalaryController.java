package cnmei.oa.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cnmei.oa.bean.SalaryVO;
import cnmei.oa.service.SalaryService;

@Controller
@RequestMapping("/salary")
public class SalaryController extends BaseController{
	
	@Autowired
	private SalaryService salaryService;
	
	@RequestMapping("/showList")
	public String showSalaryList(){
		return "decorators/salary/salaryList";
	}
	
	@RequestMapping("/showListByPage")
	@ResponseBody
	public PageInfo<SalaryVO> showListByPage(String pageNum,String pageSize,String name){
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("name", name);
		
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
        List<SalaryVO> searchList = salaryService.findSearch(params);
        PageInfo<SalaryVO> pageInfo = new PageInfo<SalaryVO>(searchList);  
		return pageInfo;
	}
	
	
	
}
