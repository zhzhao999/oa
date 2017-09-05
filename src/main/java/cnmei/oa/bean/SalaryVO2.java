package cnmei.oa.bean;

import java.io.Serializable;

/**
 * 更新工资表
 */
public class SalaryVO2 implements Serializable{

	private static final long serialVersionUID = -4239515504547326946L;
	private int id; //工资ID
	private int employee_id; //员工ID
	private String ee_id;//员工编号
	private String name;//员工姓名
	private String level;//职级
	private String post_level;//岗位级别
	private int other;//其他
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getPost_level() {
		return post_level;
	}
	public void setPost_level(String post_level) {
		this.post_level = post_level;
	}
	public int getOther() {
		return other;
	}
	public void setOther(int other) {
		this.other = other;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	
}	
