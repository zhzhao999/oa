package cnmei.oa.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnmei.oa.bean.SalaryVO;
import cnmei.oa.mapper.SalaryMapper;
import cnmei.oa.pojo.Salary;
import cnmei.oa.service.SalaryService;
import cnmei.oa.utils.DateUtils;

@Service
public class SalaryServiceImpl implements SalaryService {
	
	@Autowired
	private SalaryMapper salaryMapper;

	@Override
	public void addSalary(Salary salary) {
		salaryMapper.addSalary(salary);
	}

	@Override
	public List<SalaryVO> findSearch(HashMap<String, Object> params) {
		List<SalaryVO> list = salaryMapper.findSearch(params);
		for (SalaryVO salaryVO : list) {
			//计算工龄
			Date entry_date = salaryVO.getEntry_date();
			int age = DateUtils.getWorkAge(entry_date);
			salaryVO.setWork_age(age);
			//新资合计
			int pSalary = salaryVO.getPost_salary();//岗位工资
			int mPay = salaryVO.getMerit_pay();//绩效工资
			int award = salaryVO.getFull_award();//满勤奖
			int bPay = salaryVO.getBasic_pay();//职级对应工资
			int oSubsidy = salaryVO.getOil_subsidy();//油补
			int other = salaryVO.getOther();//其他
			salaryVO.setTotal(pSalary + mPay + award + bPay + oSubsidy + other);
		}
		return list;
	}
	

}
