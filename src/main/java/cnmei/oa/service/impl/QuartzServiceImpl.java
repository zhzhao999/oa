package cnmei.oa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnmei.oa.mapper.EmployeeMapper;
import cnmei.oa.mapper.TooltipMapper;
import cnmei.oa.pojo.Tooltip;
import cnmei.oa.service.QuartzService;
import cnmei.oa.utils.TimeUtil;

@Service
public class QuartzServiceImpl implements QuartzService{
	
	@Autowired
	private TooltipMapper tooltipMapper;
	
	@Autowired
	private EmployeeMapper employeeMapper;

	@Override
	public void execute() {
		Date date = new Date();
		String time = TimeUtil.DateTimeToString2(date);
		List<Integer> employeeIdList = employeeMapper.findRegular(time);
		for (int i = 0; i < employeeIdList.size(); i++) {
			Tooltip tooltip = new Tooltip();
			tooltip.setEmployee_id(employeeIdList.get(i));
			tooltip.setMessage("今日为该员工转正日期");
			tooltip.setCreate_time(new Date());
			tooltipMapper.insertEmployee(tooltip);
		}
	}
}
