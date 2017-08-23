package cnmei.oa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cnmei.oa.bean.EmployeeAll;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@RequestMapping("/showAddEm")
	public String showAddEm(){
		return "decorators/createEm";
	}
	
	@RequestMapping("/saveEmployee")
	public String saveEmployee(EmployeeAll ema){
		return "";
	}
	
	
}
