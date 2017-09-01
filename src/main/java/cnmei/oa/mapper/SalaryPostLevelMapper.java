package cnmei.oa.mapper;

import java.util.HashMap;
import java.util.List;

import cnmei.oa.pojo.SalaryPostLevel;

public interface SalaryPostLevelMapper {
	List<SalaryPostLevel> findAllType();

	List<SalaryPostLevel> findSearch(HashMap<String, Object> params);

	SalaryPostLevel findById(String id);

	void updateById(SalaryPostLevel level);
}
