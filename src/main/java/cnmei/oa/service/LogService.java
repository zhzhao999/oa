package cnmei.oa.service;

import java.util.HashMap;
import java.util.List;

import cnmei.oa.pojo.Log;

public interface LogService {
	void addLog(Log log);
	List<Log> findAll(HashMap<String, Object> params);
}
