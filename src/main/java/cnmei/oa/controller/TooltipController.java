package cnmei.oa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.bean.TooltipVo;
import cnmei.oa.pojo.Log;
import cnmei.oa.pojo.Tooltip;
import cnmei.oa.service.LogService;
import cnmei.oa.service.TooltipService;

@Controller
@RequestMapping("tooltip")
public class TooltipController extends BaseController{
	
	@Autowired
	private TooltipService tooltipService;
	
	@Autowired 
	private LogService logService;

	@ResponseBody
	@RequestMapping("searchRegularE")
	public Integer SearchRegularE(){
		Integer count = tooltipService.SearchRegularE();
		return count;
	}
	
	@RequestMapping("findUnreadM")
	public String FindUnreadM(Model model,HttpServletRequest request,String page){
		/*String page = request.getParameter("page");
		List<TooltipVo> toolList = tooltipService.FindUnreadM(page,model);
		model.addAttribute("toolList", toolList);
		model.addAttribute("page",page);*/
		if(StringUtils.isBlank(page)){
			return "decorators/tooltip/tooltipList";
		}else{
			return "decorators/tooltip/tooltipAllList";
		}
	}
	
	
	@RequestMapping(value={"/toolitipList"})
	@ResponseBody
	public PageInfo<Tooltip> toolitipList(Model model,String pageNum,String pageSize,String page){
		int num = 1;  
        int size = 10;  
        if (pageNum != null && !"".equals(pageNum)) {  
            num = Integer.parseInt(pageNum);  
        }  
        if (pageSize != null && !"".equals(pageSize)) {  
            size = Integer.parseInt(pageSize);  
        }  
        // pageHelper分页查询对象  
        PageHelper.startPage(num, size);  
        List<Tooltip> toolList = tooltipService.FindUnreadM(page);
        PageInfo pageInfo = new PageInfo(toolList);
        List<TooltipVo> findToolTipVo = tooltipService.findToolTipVo(toolList);
        pageInfo.setList(findToolTipVo);
		return pageInfo;
	}
	
	@RequestMapping(value={"/modificationStatus"})
	@ResponseBody
	public ResultBean modificationStatus(Integer id,boolean fin_status,HttpServletRequest request){
		ResultBean resultBean  = tooltipService.updateFinStatus(id,!fin_status);
		if(resultBean.getCode()==1){
			//写日志
			Log log = new Log();
			log.setUser_name(getCurrentUser(request).getName());
			log.setOpe_module("消息提醒");
			log.setOpe_context("消息状态修改成功！！！");
			logService.addLog(log);
		}
		return resultBean;
	}
}
