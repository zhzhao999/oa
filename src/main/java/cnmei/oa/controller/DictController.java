package cnmei.oa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dict")
public class DictController extends BaseController{
	
	@RequestMapping("/show")
	public String show(){
		return "decorators/system/dict";
	}
	
}
