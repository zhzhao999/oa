package cnmei.oa.pojo;

import java.io.Serializable;
import java.util.Date;

public class Employee implements Serializable{
	private static final long serialVersionUID = 3453109906124806310L;
	
	private int id;
	private String ee_id; //员工编号
	private String name;
	private String gender;
	private String nation;
	private Date birthday;
	private String zodiac;
	private String card_id;
	private String telephone;
	private String qq;
	private String email;
	private String education;
	private String school;
	private String major;
	private Date entry_date;//入职日期
	private int probation;//试用期
	private Date regular_date;//转正日期
	private int contract_year;//合同年限
	private Date contract_end_date;//合同终止日期
	private String center;//中心
	private String department;//部门
	private String job;//职务
	private int on_job;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getZodiac() {
		return zodiac;
	}
	public void setZodiac(String zodiac) {
		this.zodiac = zodiac;
	}
	public String getCard_id() {
		return card_id;
	}
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getOn_job() {
		return on_job;
	}
	public void setOn_job(int on_job) {
		this.on_job = on_job;
	}
	public Date getEntry_date() {
		return entry_date;
	}
	public void setEntry_date(Date entry_date) {
		this.entry_date = entry_date;
	}
	public int getProbation() {
		return probation;
	}
	public void setProbation(int probation) {
		this.probation = probation;
	}
	public Date getRegular_date() {
		return regular_date;
	}
	public void setRegular_date(Date regular_date) {
		this.regular_date = regular_date;
	}
	public int getContract_year() {
		return contract_year;
	}
	public void setContract_year(int contract_year) {
		this.contract_year = contract_year;
	}
	public Date getContract_end_date() {
		return contract_end_date;
	}
	public void setContract_end_date(Date contract_end_date) {
		this.contract_end_date = contract_end_date;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getEe_id() {
		return ee_id;
	}
	public void setEe_id(String ee_id) {
		this.ee_id = ee_id;
	}
	public String getCenter() {
		return center;
	}
	public void setCenter(String center) {
		this.center = center;
	}
	
}
