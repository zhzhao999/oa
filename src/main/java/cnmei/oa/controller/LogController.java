package cnmei.oa.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cnmei.oa.pojo.Log;
import cnmei.oa.service.LogService;

@Controller
@RequestMapping("/log")
public class LogController extends BaseController{
	
	@Autowired
	private LogService logService;
	
	@RequestMapping("/showList")
	public String showLogList(){
		return "decorators/system/logList";
	}
	
	@RequestMapping("/addLog")
	public void addLog(Log log){
		logService.addLog(log);
	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public PageInfo<Log> findAll(String pageNum,String pageSize,String name,String module,String startTime,String endTime){
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("name", name);
		params.put("module", module);
		params.put("startTime", startTime);
		params.put("endTime", endTime);
		
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
        List<Log> searchList = logService.findAll(params);
        PageInfo<Log> pageInfo = new PageInfo<Log>(searchList);  
		return pageInfo;
	}
}
