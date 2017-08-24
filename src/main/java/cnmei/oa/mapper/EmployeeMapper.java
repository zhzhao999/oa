package cnmei.oa.mapper;

import java.util.List;

import cnmei.oa.pojo.Employee;

public interface EmployeeMapper {
	void addEmployee(Employee em);
	List<Employee> findAll();
	
}
