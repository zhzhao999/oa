package cnmei.oa.service.impl;

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
	public boolean login(User user) {
		String pwd = user.getPassword();
		String md5 = MD5Utils.md5(pwd);
		user.setPassword(md5);
		User u = userMapper.findOne(user);
		if (u != null) {
			return true;
		}
		return false;
	}

}
