package cnmei.oa.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnmei.oa.mapper.LogMapper;
import cnmei.oa.pojo.Log;
import cnmei.oa.service.LogService;

@Service
public class LogServiceImpl implements LogService {
	
	@Autowired
	private LogMapper logMapper;

	@Override
	public void addLog(Log log) {
		logMapper.addLog(log);
	}

	@Override
	public List<Log> findAll(HashMap<String, Object> params) {
		return logMapper.findAll(params);
	}
	
	
}
