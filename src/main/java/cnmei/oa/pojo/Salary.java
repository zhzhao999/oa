package cnmei.oa.pojo;

import java.io.Serializable;

public class Salary implements Serializable {

	private static final long serialVersionUID = 1309463023082895572L;
	
	private int id;
	private int employee_id;
	private String level;
	private String post_level;
	private int work_age; //工龄
	private int other;
	private int total;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
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
}
