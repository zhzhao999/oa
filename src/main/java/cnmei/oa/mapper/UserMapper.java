package cnmei.oa.mapper;

import java.util.List;

import cnmei.oa.pojo.User;

public interface UserMapper {
	public User findOne(User user);

	public int updatePwdById(User user);

	public List<User> findAll();

	public List<User> findUserByName(String name);

	public void insertUser(User user);

	public void deleteUser(Integer id);

	public List<User> findUserByNameM(String name);

	public User findUserById(Integer id);
}
