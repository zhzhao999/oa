package cnmei.oa.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnmei.oa.mapper.DictMapper;
import cnmei.oa.pojo.Dict;
import cnmei.oa.service.DictService;

@Service
public class DictServiceImpl implements DictService {
	
	@Autowired
	private DictMapper dictMapper;

	@Override
	public List<Dict> getDictByTypeCode(String typeCode) {
		List<Dict> list;
		try {
			list = dictMapper.getDictByTypeCode(typeCode);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Dict> findAllType() {
		List<Dict> typeList = dictMapper.findAllType();
		return typeList;
	}

	@Override
	public List<Dict> findAll() {
		List<Dict> typeList = dictMapper.findAll();
		return typeList;
	}

	@Override
	public void updateById(HashMap<String, Object> params) {
		dictMapper.updateById(params);
	}

	
}
