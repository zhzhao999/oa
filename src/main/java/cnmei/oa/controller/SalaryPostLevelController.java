package cnmei.oa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.pojo.SalaryPostLevel;
import cnmei.oa.service.SalaryPostLevelService;

@Controller
@RequestMapping("/salary/dict/postLevel")
public class SalaryPostLevelController extends BaseController{
	
	@Autowired
	private SalaryPostLevelService postLevelService;
	
	/*@RequestMapping("/showList")
	public String showSalaryList(){
		return "decorators/system/logList";
	}*/
	
	@RequestMapping("/type")
	@ResponseBody
	public ResultBean findAllType(){
		List<SalaryPostLevel> list = postLevelService.findAllType();
		return ResultBean.build(list);
	}
	
	
}
