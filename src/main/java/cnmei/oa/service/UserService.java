package cnmei.oa.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cnmei.oa.bean.ResultBean;
import cnmei.oa.pojo.User;

public interface UserService {
	boolean login(User user,HttpServletRequest request);
	boolean ChangePassword(User user);
	boolean findUser(User user);
	List<User> findAll();
	boolean findUserByName(String name);
	ResultBean insertUser(User user);
	ResultBean deleteUser(Integer id);
	List<User> findUserByNameM(String name);
}
