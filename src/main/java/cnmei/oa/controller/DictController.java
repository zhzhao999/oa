package cnmei.oa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.pojo.Dict;
import cnmei.oa.service.DictService;

@Controller
@RequestMapping("/dict")
public class DictController extends BaseController{
	
	@Autowired
	private DictService dictService;
	
	@RequestMapping("/show")
	public String show(){
		return "decorators/system/dict";
	}
	
	@RequestMapping("/getItem/{typeCode}")
	@ResponseBody
	private ResultBean getItemByTypeCode(@PathVariable String typeCode){
		List<Dict> list = dictService.getDictByTypeCode(typeCode);
		return ResultBean.build(list);
	}
}
