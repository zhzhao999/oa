package cnmei.oa.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnmei.oa.bean.TooltipVo;
import cnmei.oa.mapper.EmployeeMapper;
import cnmei.oa.mapper.TooltipMapper;
import cnmei.oa.pojo.Employee;
import cnmei.oa.pojo.Tooltip;
import cnmei.oa.service.TooltipService;

@Service
public class tooltipServiceImpl implements TooltipService{
	
	@Autowired
	private TooltipMapper tooltipMapper;
	
	@Autowired
	private EmployeeMapper EmployeeMapper;
	

	@Override
	public Integer SearchRegularE() {
		return tooltipMapper.SearchRegularE();
	}

	@Override
	public List<TooltipVo> FindUnreadM(String page) {
		List<Tooltip> toolList = null;
		if(StringUtils.isNotBlank(page)){
			toolList = tooltipMapper.FindAllTool();
		}else{
			toolList = tooltipMapper.FindUnreadM();
		}
		List<TooltipVo> tooltipVoList = new ArrayList<TooltipVo>();
		for (int i = 0; i < toolList.size(); i++) {
			Employee employee = EmployeeMapper.findOne(String.valueOf(toolList.get(i).getEmployee_id()));
			TooltipVo tooltipVo = new TooltipVo();
			tooltipVo.setId(toolList.get(i).getId());
			tooltipVo.setEmployee_id(toolList.get(i).getEmployee_id());
			tooltipVo.setCreate_time(toolList.get(i).getCreate_time());
			tooltipVo.setMessage(toolList.get(i).getMessage());
			tooltipVo.setDepartment(employee.getDepartment());
			tooltipVo.setEntry_date(employee.getEntry_date());
			tooltipVo.setEmployeeName(employee.getName());
			tooltipVo.setJob(employee.getJob());
			tooltipVoList.add(tooltipVo);
		}
		for (int i = 0; i < toolList.size(); i++) {
			tooltipMapper.updateStatus(toolList.get(i).getId());
		}
		return tooltipVoList;
	}
}
