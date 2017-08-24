package cnmei.oa.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cnmei.oa.pojo.User;
import cnmei.oa.service.UserService;

@Controller
public class UserController {
	
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
	
}
