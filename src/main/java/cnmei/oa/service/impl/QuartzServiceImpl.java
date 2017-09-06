package cnmei.oa.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnmei.oa.mapper.EmployeeMapper;
import cnmei.oa.mapper.TooltipMapper;
import cnmei.oa.pojo.Tooltip;
import cnmei.oa.service.QuartzService;
import cnmei.oa.utils.DateUtils;

@Service
public class QuartzServiceImpl implements QuartzService{
	
	@Autowired
	private TooltipMapper tooltipMapper;
	
	@Autowired
	private EmployeeMapper employeeMapper;

	@Override
	public void execute() {
		//获取十五天后的日期
		Date currentDate = new Date();
		Date date = DateUtils.getParseDate(currentDate, Calendar.DATE, 15);
		String time = DateUtils.dateToString(date);
		List<Integer> rIdList = employeeMapper.findRegular(time);
		for (int i = 0; i < rIdList.size(); i++) {
			Tooltip tooltip = new Tooltip();
			tooltip.setEmployee_id(rIdList.get(i));
			tooltip.setMessage("15天后为该员工转正日期");
			tooltip.setCreate_time(currentDate);
			tooltipMapper.insertEmployee(tooltip);
		}
		List<Integer> cIdlist = employeeMapper.findContract(time);
		for (int i = 0; i < cIdlist.size(); i++) {
			Tooltip tooltip = new Tooltip();
			tooltip.setEmployee_id(cIdlist.get(i));
			tooltip.setMessage("15天后该员工合同到期");
			tooltip.setCreate_time(currentDate);
			tooltipMapper.insertEmployee(tooltip);
		}
	}
}
