package cnmei.oa.pojo;

import java.io.Serializable;

/**
 * 职级级别
 */
public class SalaryLevel implements Serializable {
	private static final long serialVersionUID = -7080276058882204721L;
	private int id;
	private String type_name; // 职级级别
	private int basic_pay;// 对应的基本薪资
	private int oil_subsidy;// 油补
	
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
	
	
}
