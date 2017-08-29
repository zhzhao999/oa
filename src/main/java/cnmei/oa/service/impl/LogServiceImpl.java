package cnmei.oa.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnmei.oa.mapper.LogMapper;
import cnmei.oa.service.LogService;

@Service
public class LogServiceImpl implements LogService {
	
	@Autowired
	private LogMapper logMapper;

	@Override
	public void addLog(String userName, String context) {
		logMapper.addLog(userName,context);
	}
	
}
