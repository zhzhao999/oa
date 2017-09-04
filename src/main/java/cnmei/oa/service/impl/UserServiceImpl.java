package cnmei.oa.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.mapper.UserMapper;
import cnmei.oa.pojo.User;
import cnmei.oa.service.UserService;
import cnmei.oa.utils.MD5Utils;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public boolean login(User user,HttpServletRequest request) {
		
		String pwd = user.getPassword();
		if (StringUtils.isNoneBlank(pwd)) {
			String md5 = MD5Utils.md5(pwd);
			user.setPassword(md5);
		}else{
			return false;
		}
		
		User u = userMapper.findOne(user);
		if (u != null) {
			HttpSession session = request.getSession();
			user.setPassword("");
			session.setAttribute("userId", u.getId());
			session.setAttribute("userName", u.getName());
			return true;
		}
		return false;
	}

	@Override
	public boolean ChangePassword(User user) {
		int b = userMapper.updatePwdById(user);
		if(b==1){
			return true;
		}
		return false;
	}

	@Override
	public boolean findUser(User user) {
		User findOne = userMapper.findOne(user);
		if (findOne != null) {
			return true;
		}
		return false;
	}

	@Override
	public List<User> findAll() {
		return userMapper.findAll();
	}

	@Override
	public boolean findUserByName(String name) {
		 List<User> userList = userMapper.findUserByName(name);
		 if(userList.size()==0){
			 return true;
		 }
		return false;
	}

	@Override
	public ResultBean insertUser(User user) {
		ResultBean resultBean = new ResultBean();
		try {
			userMapper.insertUser(user);
			resultBean.setCode(1);
			resultBean.setMessage("添加用户成功");
		} catch (Exception e) {
			resultBean.setCode(0);
			resultBean.setMessage("添加用户失败");
			new Exception("添加用户失败");
		}
		return resultBean;
	}

	@Override
	public ResultBean deleteUser(Integer id) {
		ResultBean resultBean = new ResultBean();
		if(id==1){
			resultBean.setCode(0);
			resultBean.setMessage("不能删除超级管理员用户！！！");
			return resultBean;
		}
		try {
			userMapper.deleteUser(id);
			resultBean.setCode(1);
			resultBean.setMessage("删除用户成功");
		} catch (Exception e) {
			resultBean.setCode(0);
			resultBean.setMessage("删除用户失败");
			new Exception("删除用户失败");
		}
		return resultBean;
	}

	@Override
	public List<User> findUserByNameM(String name) {
		return  userMapper.findUserByNameM(name);
	}

	@Override
	public User findUserById(Integer id) {
		return  userMapper.findUserById(id);
	}
}
