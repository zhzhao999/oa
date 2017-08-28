package cnmei.oa.mapper;

import java.util.HashMap;
import java.util.List;

import cnmei.oa.pojo.Employee;

public interface EmployeeMapper {
	void addEmployee(Employee em);
	List<Employee> findAll();
	Employee findOne(String id);
	void updateById(Employee em);
	void deleteEm(String id);
	List<Employee> findSearch(HashMap<String, Object> params);
	List<Integer> findRegular(String time);
	List<Employee> findAllBySort();//按部门
	List<Employee> findAllByTime();//按入职时间
}
