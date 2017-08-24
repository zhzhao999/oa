package cnmei.oa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.pojo.User;
import cnmei.oa.service.UserService;
import cnmei.oa.utils.JsonUtils;
import cnmei.oa.utils.MD5Utils;

@Controller
@RequestMapping("/security")
public class SecurityController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="checkPassword")
	@ResponseBody
	public boolean CheckPassword(String oldPwd,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer  id =(Integer) session.getAttribute("userId");
		String  name =(String) session.getAttribute("userName");
		User user = new User(id, name, MD5Utils.md5(oldPwd));
		return userService.findUser(user);
	}
	
	@RequestMapping("changePassword")
	@ResponseBody
	public String ChangePassword(String password,HttpServletRequest request){
		HttpSession session = request.getSession();
		Integer  id =(Integer) session.getAttribute("userId");
		String  name =(String) session.getAttribute("userName");
		User user = new User(id, name, MD5Utils.md5(password));
		boolean b = userService.ChangePassword(user);
		ResultBean resultBean = new ResultBean();
		if(b){
			resultBean.setCode(1);
			resultBean.setMessage("修改成功");
		}else{
			resultBean.setCode(0);
			resultBean.setMessage("修改失败");
		}
		return JsonUtils.objectToJson(resultBean);
	}

}
