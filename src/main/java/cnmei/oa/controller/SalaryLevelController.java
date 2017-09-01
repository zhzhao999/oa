package cnmei.oa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.pojo.SalaryLevel;
import cnmei.oa.service.SalaryLevelService;

@Controller
@RequestMapping("/salary/dict/level")
public class SalaryLevelController extends BaseController{
	
	@Autowired
	private SalaryLevelService levelService;
	
	/*@RequestMapping("/showList")
	public String showSalaryList(){
		return "decorators/system/logList";
	}*/
	
	@RequestMapping("/type")
	@ResponseBody
	public ResultBean findAllType(){
		List<SalaryLevel> list = levelService.findAllType();
		return ResultBean.build(list);
	}
	
	
}
