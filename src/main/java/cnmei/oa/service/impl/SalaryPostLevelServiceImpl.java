package cnmei.oa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnmei.oa.mapper.SalaryPostLevelMapper;
import cnmei.oa.pojo.SalaryPostLevel;
import cnmei.oa.service.SalaryPostLevelService;

@Service
public class SalaryPostLevelServiceImpl implements SalaryPostLevelService {
	
	@Autowired
	private SalaryPostLevelMapper postLevelMapper;
	
	@Override
	public List<SalaryPostLevel> findAllType() {
		return postLevelMapper.findAllType();
	}

}
