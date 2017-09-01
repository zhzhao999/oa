package cnmei.oa.service;

import java.util.HashMap;
import java.util.List;

import cnmei.oa.pojo.SalaryLevel;

public interface SalaryLevelService {
	List<SalaryLevel> findAllType();

	List<SalaryLevel> findSearch(HashMap<String, Object> params);

	SalaryLevel findById(String id);

	void updateById(SalaryLevel level);
}
