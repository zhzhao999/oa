package cnmei.oa.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import cnmei.oa.pojo.User;

public class BaseController {
	
	/**
	 * 用于将页面传过来的字符串 转换成时间
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	/**
	 * 获取当前用户
	 */
	public User getCurrentUser(HttpServletRequest request){
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("userName");
		int id = (int) session.getAttribute("userId");
		User user = new User();
		user.setName(name);
		user.setId(id);
		return user;
	}
}
