package cnmei.oa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
}
