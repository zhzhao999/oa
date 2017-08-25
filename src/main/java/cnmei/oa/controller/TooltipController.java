package cnmei.oa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cnmei.oa.bean.TooltipVo;
import cnmei.oa.service.TooltipService;

@Controller
@RequestMapping("tooltip")
public class TooltipController extends BaseController{
	
	@Autowired
	private TooltipService tooltipService;

	@ResponseBody
	@RequestMapping("searchRegularE")
	public Integer SearchRegularE(){
		Integer count = tooltipService.SearchRegularE();
		return count;
	}
	
	@RequestMapping("findUnreadM")
	public ModelAndView FindUnreadM(ModelAndView modelAndView,HttpServletRequest request){
		String page = request.getParameter("page");
		List<TooltipVo> toolList = tooltipService.FindUnreadM(page);
		modelAndView.addObject("toolList", toolList);
		modelAndView.addObject("page",page);
		if(StringUtils.isBlank(page)){
			modelAndView.setViewName("decorators/tooltip/tooltipList");
		}else{
			modelAndView.setViewName("decorators/tooltip/tooltipAllList");
		}
		return modelAndView;
	}
}
