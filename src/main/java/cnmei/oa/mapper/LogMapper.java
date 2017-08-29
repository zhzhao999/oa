package cnmei.oa.mapper;

import java.util.HashMap;
import java.util.List;

import cnmei.oa.pojo.Log;

public interface LogMapper {
	void addLog(Log log);

	List<Log> findAll(HashMap<String, Object> params);
}
