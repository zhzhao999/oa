package cnmei.oa.service;

import java.util.List;

import cnmei.oa.pojo.Dict;

public interface DictService {
	List<Dict> getDictByTypeCode(String typeCode);
}
