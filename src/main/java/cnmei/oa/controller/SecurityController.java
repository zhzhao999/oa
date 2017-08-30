package cnmei.oa.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.pojo.Log;
import cnmei.oa.pojo.User;
import cnmei.oa.service.LogService;
import cnmei.oa.service.UserService;
import cnmei.oa.utils.JsonUtils;
import cnmei.oa.utils.MD5Utils;

@Controller
@RequestMapping("/security")
public class SecurityController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@Autowired 
	private LogService logService;
	
	@RequestMapping(value="checkPassword")
	@ResponseBody
	public boolean CheckPassword(String oldPwd,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer  id =(Integer) session.getAttribute("userId");
		String  name =(String) session.getAttribute("userName");
		User user = new User(id, name, MD5Utils.md5(oldPwd),new Date());
		return userService.findUser(user);
	}
	
	@RequestMapping(value="checkUserName")
	@ResponseBody
	public boolean CheckUserName(String yhName,HttpServletRequest request) {
		return userService.findUserByName(yhName);
	}
	
	
	@RequestMapping("changePassword")
	@ResponseBody
	public String ChangePassword(String password,HttpServletRequest request){
		HttpSession session = request.getSession();
		Integer  id =(Integer) session.getAttribute("userId");
		String  name =(String) session.getAttribute("userName");
		User user = new User(id, name, MD5Utils.md5(password),new Date());
		boolean b = userService.ChangePassword(user);
		ResultBean resultBean = new ResultBean();
		if(b){
			//写日志
			Log log = new Log();
			log.setUser_name(getCurrentUser(request).getName());
			log.setOpe_module("用户管理");
			log.setOpe_context("修改密码成功");
			logService.addLog(log);
			resultBean.setCode(1);
			resultBean.setMessage("修改成功");
		}else{
			resultBean.setCode(0);
			resultBean.setMessage("修改失败");
		}
		return JsonUtils.objectToJson(resultBean);
	}

}
