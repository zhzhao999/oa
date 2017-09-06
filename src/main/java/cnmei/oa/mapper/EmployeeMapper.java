package cnmei.oa.mapper;

import java.util.HashMap;
import java.util.List;

import cnmei.oa.bean.EmployeeVO;
import cnmei.oa.pojo.Employee;

public interface EmployeeMapper {
	void addEmployee(Employee em);
	List<Employee> findAll();
	Employee findOne(String id);
	void updateById(Employee em);
	void deleteEm(String id);
	List<Employee> findSearch(HashMap<String, Object> params);
	List<Integer> findRegular(String time);
	List<Integer> findContract(String time);
	List<EmployeeVO> findAllBySort();//按部门
	List<EmployeeVO> findAllByTime();//按入职时间
	Integer findDateCount(String time); //获取当日入职的人数
}
