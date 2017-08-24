package cnmei.oa.service.impl;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnmei.oa.mapper.EmployeeMapper;
import cnmei.oa.pojo.Employee;
import cnmei.oa.service.EmployeeService;
import cnmei.oa.utils.DateUtils;
import cnmei.oa.utils.ZodiacUtils;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Override
	public void addEmployee(Employee em) {
		//获取生肖
		Date birthday = em.getBirthday();
		if (birthday != null) {
			String zodiac = ZodiacUtils.getZodiac(birthday);
			em.setZodiac(zodiac);
		}
		//根据入职日期 试用期 合同年限 计算 转正日期及合同终止日期
		Date eDate = em.getEntry_date();//入职日期
		int pro = em.getProbation();//试用期时长
		int conYear = em.getContract_year();//合同年限
		if (eDate != null) {
			if (pro != 0) {
				Date regDate = DateUtils.getParseDate(eDate, Calendar.MONTH, pro);
				em.setRegular_date(regDate);
			}
			if (conYear != 0) {
				Date conDate = DateUtils.getParseDate(eDate, Calendar.YEAR, pro);
				em.setContract_end_date(conDate);
			}
		}
		//设置在职状态
		em.setOn_job(1);
		employeeMapper.addEmployee(em);
	}

}