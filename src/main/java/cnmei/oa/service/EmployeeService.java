package cnmei.oa.service;

import java.util.List;

import cnmei.oa.pojo.Employee;

public interface EmployeeService {
	void addEmployee(Employee em);
	List<Employee> findAll();
}
