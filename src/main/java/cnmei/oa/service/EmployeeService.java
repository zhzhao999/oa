package cnmei.oa.service;

import java.util.HashMap;
import java.util.List;

import cnmei.oa.pojo.Employee;

public interface EmployeeService {
	void addEmployee(Employee em);
	List<Employee> findAll();
	List<Employee> findAllBySort(String sort);
	Employee findOnd(String id);
	void updateEm(Employee em);
	void deleteEm(String id);
	List<Employee> findSearch(HashMap<String, Object> params);
	List<Employee> findAllByPage(String pageNum, String pageSize, String name, String startTime, String endTime);
}
