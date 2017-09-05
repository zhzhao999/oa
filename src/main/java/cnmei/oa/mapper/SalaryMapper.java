package cnmei.oa.mapper;

import java.util.HashMap;
import java.util.List;

import cnmei.oa.bean.SalaryVO;
import cnmei.oa.bean.SalaryVO2;
import cnmei.oa.pojo.Salary;

public interface SalaryMapper {
	void addSalary(Salary salary);
	List<SalaryVO> findSearch(HashMap<String, Object> params);
	SalaryVO findSalaryByEId(String eId);
	SalaryVO2 findSalary2ByEId(String eId);
	Salary findByEId(String eid);
	void updateSalary(Salary salary);
}
