package cnmei.oa.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.pojo.User;
import cnmei.oa.service.UserService;
import cnmei.oa.utils.MD5Utils;

@Controller
public class UserController extends BaseController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(){
		return "redirect:/showLogin";
	}
	@RequestMapping("/showLogin")
	public String showLogin(){
		return "jsp/login";
	}
	
	@RequestMapping("/showHomepage")
	public String showHomepage(){
		return "decorators/homepage";
	}
	
	@RequestMapping("/user/login")
	public String userLogin(User user,HttpServletRequest request){
		boolean login = userService.login(user,request);
		if (login) {
			return "redirect:/showHomepage";
		}else{
			request.setAttribute("errorMsg", "用户名或密码错误");
			return "jsp/login";
		}
	}
	
	@RequestMapping("/user/logout")
	public String userLogout(User user,HttpServletRequest request){
		request.getSession().invalidate();
		return "jsp/login";
	}
	
	@RequestMapping("/user/findAll")
	public ModelAndView userfindAll(ModelAndView modelAndView){
		List<User> userList =  userService.findAll();
		modelAndView.addObject("userList", userList);
		modelAndView.setViewName("decorators/user/userList");
		return modelAndView;
	}
	@RequestMapping("/addUser")
	public String addUserPage(){
		return "decorators/user/addUser";
	}
	
	@RequestMapping("/user/addUser")
	@ResponseBody
	public ResultBean addUser(HttpServletRequest request,String yhName,String userPassword){
		if(!getUser(request)){
			ResultBean resultBean = new ResultBean();
			resultBean.setCode(0);
			resultBean.setMessage("您不是超级管理员,没有权限添加用户！！！");
			return resultBean;
		}
		User user = new User();
		user.setName(yhName);
		user.setPassword(MD5Utils.md5(userPassword));
		user.setCreateTime(new Date());
		ResultBean resultBean = userService.insertUser(user);
		return resultBean;
	}
	
	@RequestMapping("/user/deleteUser")
	@ResponseBody
	public ResultBean deleteUser(Integer id,HttpServletRequest request){
		if(!getUser(request)){
			ResultBean resultBean = new ResultBean();
			resultBean.setCode(0);
			resultBean.setMessage("您不是超级管理员,没有权限删除用户！！！");
			return resultBean;
		}
		ResultBean resultBean = userService.deleteUser(id);
		return resultBean;
	}
	
	@RequestMapping("/user/searchByName")
	public ModelAndView searchByName(String name,ModelAndView modelAndView){
		List<User> userList = userService.findUserByNameM(name);
		modelAndView.addObject("userList", userList);
		modelAndView.setViewName("decorators/user/userList");
		return modelAndView;
	}
	
	public boolean getUser(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		if(userName.equals("admin")){
			return true;
		}
		return false;
	}
}
