package cnmei.oa.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnmei.oa.mapper.SalaryLevelMapper;
import cnmei.oa.pojo.SalaryLevel;
import cnmei.oa.service.SalaryLevelService;

@Service
public class SalaryLevelServiceImpl implements SalaryLevelService {
	
	@Autowired
	private SalaryLevelMapper levelMapper;
	
	@Override
	public List<SalaryLevel> findAllType() {
		return levelMapper.findAllType();
	}

	@Override
	public List<SalaryLevel> findSearch(HashMap<String, Object> params) {
		return levelMapper.findSearch(params);
	}

	@Override
	public SalaryLevel findById(String id) {
		return levelMapper.findById(id);
	}

	@Override
	public void updateById(SalaryLevel level) {
		levelMapper.updateById(level);
	}

}
