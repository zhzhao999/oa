package cnmei.oa.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 工资列表页 对应工资条目
 */
public class SalaryVO implements Serializable{

	private static final long serialVersionUID = -4239515504547326946L;
	private int id; //员工ID
	private String ee_id;//员工编号
	private String name;//员工姓名
	private Date entry_date;//入职日期
	private String l_name;//职级
	private int basic_pay;//职级对应基本工资
	private int oil_subsidy;//职级 油补
	private String p_name;//岗位级别
	private int post_salary;//岗位工资
	private int merit_pay;//绩效工资
	private int full_award;//满勤奖
	private int work_age;//工龄
	private int work_age_salary;//工龄工资
	private int other;//其他
	private int total;//共计
	public String getEe_id() {
		return ee_id;
	}
	public void setEe_id(String ee_id) {
		this.ee_id = ee_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getEntry_date() {
		return entry_date;
	}
	public void setEntry_date(Date entry_date) {
		this.entry_date = entry_date;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public int getBasic_pay() {
		return basic_pay;
	}
	public void setBasic_pay(int basic_pay) {
		this.basic_pay = basic_pay;
	}
	public int getOil_subsidy() {
		return oil_subsidy;
	}
	public void setOil_subsidy(int oil_subsidy) {
		this.oil_subsidy = oil_subsidy;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getPost_salary() {
		return post_salary;
	}
	public void setPost_salary(int post_salary) {
		this.post_salary = post_salary;
	}
	public int getMerit_pay() {
		return merit_pay;
	}
	public void setMerit_pay(int merit_pay) {
		this.merit_pay = merit_pay;
	}
	public int getFull_award() {
		return full_award;
	}
	public void setFull_award(int full_award) {
		this.full_award = full_award;
	}
	public int getOther() {
		return other;
	}
	public void setOther(int other) {
		this.other = other;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getWork_age() {
		return work_age;
	}
	public void setWork_age(int work_age) {
		this.work_age = work_age;
	}
	public int getWork_age_salary() {
		return work_age_salary;
	}
	public void setWork_age_salay(int work_age_salary) {
		this.work_age_salary = work_age_salary;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
