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
			calculateAgeTotal(salaryVO);
		}
		return list;
	}

	@Override
	public SalaryVO findSalaryByEId(String eId) {
		SalaryVO salary = salaryMapper.findSalaryByEId(eId);
		calculateAgeTotal(salary);
		return salary;
	}
	
	/**
	 * 计算工龄 和 新资合计
	 * @param vo
	 * @return
	 */
	public SalaryVO calculateAgeTotal(SalaryVO vo){
		//计算工龄
		Date entry_date = vo.getEntry_date();
		if (entry_date != null) {
			int age = DateUtils.getWorkAge(entry_date);
			vo.setWork_age(age);
		}
		//新资合计
		int pSalary = vo.getPost_salary();//岗位工资
		int mPay = vo.getMerit_pay();//绩效工资
		int award = vo.getFull_award();//满勤奖
		int bPay = vo.getBasic_pay();//职级对应工资
		int oSubsidy = vo.getOil_subsidy();//油补
		int other = vo.getOther();//其他
		vo.setTotal(pSalary + mPay + award + bPay + oSubsidy + other);
		return vo;
	}

	@Override
	public Salary findByEId(String id) {
		return salaryMapper.findByEId(id);
	}

	@Override
	public void updateSalary(Salary salary) {
		salaryMapper.updateSalary(salary);
		
	}

}
