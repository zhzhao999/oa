package cnmei.oa.pojo;

import java.io.Serializable;

public class SalaryPostLevel implements Serializable {
	private static final long serialVersionUID = 3476574334140050133L;
	private int id;
	private String type_name; // 级别（专业级别、管理级别）
	private String post_salary;// 岗位工资
	private double up_ratio;// 上升比例
	private int merit_pay; // 绩效工资
	private double merit_ratio;// 绩效/岗位占比
	private int full_award;// 满勤奖
	private int total;// 小计
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getPost_salary() {
		return post_salary;
	}
	public void setPost_salary(String post_salary) {
		this.post_salary = post_salary;
	}
	public double getUp_ratio() {
		return up_ratio;
	}
	public void setUp_ratio(double up_ratio) {
		this.up_ratio = up_ratio;
	}
	public int getMerit_pay() {
		return merit_pay;
	}
	public void setMerit_pay(int merit_pay) {
		this.merit_pay = merit_pay;
	}
	public double getMerit_ratio() {
		return merit_ratio;
	}
	public void setMerit_ratio(double merit_ratio) {
		this.merit_ratio = merit_ratio;
	}
	public int getFull_award() {
		return full_award;
	}
	public void setFull_award(int full_award) {
		this.full_award = full_award;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
