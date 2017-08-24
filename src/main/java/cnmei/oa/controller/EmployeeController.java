package cnmei.oa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		return "decorators/emList";
	}
	
	
}
