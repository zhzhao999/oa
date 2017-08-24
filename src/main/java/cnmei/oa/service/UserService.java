package cnmei.oa.service;

import javax.servlet.http.HttpServletRequest;

import cnmei.oa.pojo.User;

public interface UserService {
	boolean login(User user,HttpServletRequest request);
	boolean ChangePassword(User user);
	boolean findUser(User user);
}
