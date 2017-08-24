package cnmei.oa.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		String md5 = MD5Utils.md5(pwd);
		user.setPassword(md5);
		User u = userMapper.findOne(user);
		if (u != null) {
			HttpSession session = request.getSession();
			user.setPassword("");
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
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

}
