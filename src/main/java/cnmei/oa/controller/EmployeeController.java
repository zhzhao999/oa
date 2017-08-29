package cnmei.oa.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cnmei.oa.pojo.Employee;
import cnmei.oa.pojo.Log;
import cnmei.oa.service.EmployeeService;
import cnmei.oa.service.LogService;
import cnmei.oa.utils.ExcelUtils;

@Controller
@RequestMapping("/employee")
public class EmployeeController extends BaseController{
	
	@Autowired
	private EmployeeService employeeService;
	@Autowired 
	private LogService logService;
	
	@RequestMapping("/showAddEm")
	public String showAddEm(){
		return "decorators/employee/createEm";
	}
	
	@RequestMapping(value="/saveEmployee")
	public String saveEmployee(Employee em,HttpServletRequest request){
		//添加员工
		employeeService.addEmployee(em);
		//写日志
		Log log = new Log();
		log.setUser_name(getCurrentUser(request).getName());
		log.setOpe_module("员工模块");
		log.setOpe_context("增加员工,员工编号："+em.getEe_id());
		logService.addLog(log);
		//返回信息
		return "decorators/employee/emList";
	}
	
	@RequestMapping(value="/showList")
	public String showList(Model model){
//		List<Employee> emList = employeeService.findAll();
//		model.addAttribute("emList", emList);
		return "decorators/employee/emList";
	}
	
	@RequestMapping(value={"/showListByPage"})
	@ResponseBody
	public PageInfo<Employee> showListByPage(Model model,String pageNum,String pageSize,String name,String startTime,String endTime){
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("name", name);
		params.put("startTime", startTime);
		params.put("endTime", endTime);
		
		
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
        List<Employee> searchList = employeeService.findSearch(params);
        PageInfo<Employee> pageInfo = new PageInfo<Employee>(searchList);  
		return pageInfo;
	}
	
	@RequestMapping(value="/showDetail/{id}")
	public String showDetail(Model model,@PathVariable String id){
		Employee em = employeeService.findOnd(id);
		model.addAttribute("em", em);
		return "decorators/employee/showEm";
	}
	@RequestMapping(value="/showUpdate/{id}")
	public String showUpdate(Model model,@PathVariable String id){
		Employee em = employeeService.findOnd(id);
		model.addAttribute("em", em);
		return "decorators/employee/updateEm";
	}
	
	@RequestMapping(value="/updateEm",method=RequestMethod.POST)
	public String updateEm(Employee em,HttpServletRequest request){
		employeeService.updateEm(em);
		//写日志
		Log log = new Log();
		log.setUser_name(getCurrentUser(request).getName());
		log.setOpe_module("员工模块");
		log.setOpe_context("修改员工,员工编号："+em.getEe_id());
		logService.addLog(log);
		return "redirect:/employee/showList";
	}
	
	@RequestMapping(value="/deleteEm/{id}")
	public String deleteEm(@PathVariable String id,HttpServletRequest request){
		employeeService.deleteEm(id);
		//写日志
		Log log = new Log();
		log.setUser_name(getCurrentUser(request).getName());
		log.setOpe_module("员工模块");
		log.setOpe_context("删除员工,员工ID："+id);
		logService.addLog(log);
		return "redirect:/employee/showList";
	}
	
	@RequestMapping("/showExport")
	public String showExport(){
		return "decorators/employee/exportEm";
	}
	
	@RequestMapping("/exportEm")
	public void exportEm(String eType,String eSort,Model model,HttpServletRequest request,HttpServletResponse response){
		if (eType != null && eType.length() > 0) {
			String[] split = eType.split(",");
			List<String> list = Arrays.asList(split);
			List<Employee> listE = employeeService.findAllBySort(eSort);
			try {
				ExcelUtils.exportEm(listE, list,request, response);
			} catch (IOException e) {
				e.printStackTrace();
				model.addAttribute("msg", "");
				model.addAttribute("errorMsg", "数据导出异常");
			}
		}else{
			model.addAttribute("msg", "");
			model.addAttribute("errorMsg", "请先选择要导出的数据");
		}
		model.addAttribute("msg", "数据导出成功");
		model.addAttribute("errorMsg", "");
	}
}
