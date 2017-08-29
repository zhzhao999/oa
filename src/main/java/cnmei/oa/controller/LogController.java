package cnmei.oa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cnmei.oa.service.LogService;

@Controller
@RequestMapping("/log")
public class LogController extends BaseController{
	
	@Autowired
	private LogService logService;
	
	/*@RequestMapping("/showAddEm")
	public String showAddEm(){
		return "decorators/createEm";
	}*/
	
	@RequestMapping("/addLog")
	public void addLog(String userName,String context){
		logService.addLog(userName, context);
	}
}
