package cnmei.oa.service;

import java.util.HashMap;
import java.util.List;

import cnmei.oa.bean.SalaryVO;
import cnmei.oa.bean.SalaryVO2;
import cnmei.oa.pojo.Salary;

public interface SalaryService {
	void addSalary(Salary salary);
	List<SalaryVO> findSearch(HashMap<String, Object> params);
	SalaryVO findSalaryByEId(String id);
	SalaryVO2 findSalary2ByEId(String id);
	Salary findByEId(String id);
	void updateSalary(Salary salary);
}
