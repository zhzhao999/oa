package cnmei.oa.bean;

import cnmei.oa.pojo.Employee;

public class EmployeeVO extends Employee{

	private static final long serialVersionUID = -5159115110288877344L;
	
	private String gender_name; 	//性别
	private String education_name; 	//学历
	private String center_name; 	//中心
	private String department_name; //部门
	
	
	public String getGender_name() {
		return gender_name;
	}
	public void setGender_name(String gender_name) {
		this.gender_name = gender_name;
	}
	public String getEducation_name() {
		return education_name;
	}
	public void setEducation_name(String education_name) {
		this.education_name = education_name;
	}
	public String getCenter_name() {
		return center_name;
	}
	public void setCenter_name(String center_name) {
		this.center_name = center_name;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
}
