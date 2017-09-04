package cnmei.oa.mapper;

import java.util.HashMap;
import java.util.List;

import cnmei.oa.pojo.Dict;

public interface DictMapper {
	List<Dict> getDictByTypeCode(String typeCode);
	List<Dict> findAllType();
	List<Dict> findAll();
	void updateById(HashMap<String, Object> params);
}
