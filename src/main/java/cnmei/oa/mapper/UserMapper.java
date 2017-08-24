package cnmei.oa.mapper;

import cnmei.oa.pojo.User;

public interface UserMapper {
	public User findOne(User user);

	public int updatePwdById(User user);
}
