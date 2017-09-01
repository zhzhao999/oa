package cnmei.oa.service;

import java.util.HashMap;
import java.util.List;

import cnmei.oa.bean.SalaryVO;
import cnmei.oa.pojo.Salary;

public interface SalaryService {
	void addSalary(Salary salary);
	List<SalaryVO> findSearch(HashMap<String, Object> params);
}
