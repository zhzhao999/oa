package cnmei.oa.service.impl;

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

}
