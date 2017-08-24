package cnmei.oa.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cnmei.oa.pojo.Employee;
import cnmei.oa.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController extends BaseController{
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/showAddEm")
	public String showAddEm(){
		return "decorators/createEm";
	}
	
	@RequestMapping(value="/saveEmployee")
	public String saveEmployee(Employee em){
		employeeService.addEmployee(em);
		return "redirect:/employee/showList";
	}
	
	@RequestMapping(value="/showList")
	public String showList(Model model){
		List<Employee> emList = employeeService.findAll();
		model.addAttribute("emList", emList);
		return "decorators/emList";
	}
	@RequestMapping(value="/showSearchList")
	public String showSearchList(String name,String startTime, String endTime,Model model){
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("name", name);
		params.put("startTime", startTime);
		params.put("endTime", endTime);
		List<Employee> emList = employeeService.findSearch(params);
		model.addAttribute("name", name);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("emList", emList);
		return "decorators/emList";
	}
	
	@RequestMapping(value="/showDetail/{id}")
	public String showDetail(Model model,@PathVariable String id){
		Employee em = employeeService.findOnd(id);
		model.addAttribute("em", em);
		return "decorators/showEm";
	}
	@RequestMapping(value="/showUpdate/{id}")
	public String showUpdate(Model model,@PathVariable String id){
		Employee em = employeeService.findOnd(id);
		model.addAttribute("em", em);
		return "decorators/updateEm";
	}
	
	@RequestMapping(value="/updateEm",method=RequestMethod.POST)
	public String updateEm(Employee em){
		employeeService.updateEm(em);
		return "redirect:/employee/showList";
	}
	
	@RequestMapping(value="/deleteEm/{id}")
	public String deleteEm(@PathVariable String id){
		employeeService.deleteEm(id);
		return "redirect:/employee/showList";
	}
}
