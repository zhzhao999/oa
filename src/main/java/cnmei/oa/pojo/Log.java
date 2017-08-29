package cnmei.oa.pojo;

import java.io.Serializable;
import java.util.Date;

public class Log implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String user_name; //用户名
	private Date ope_date; //操作日期
	private String ope_module; //操作模块
	private String ope_context; //操作内容
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Date getOpe_date() {
		return ope_date;
	}
	public void setOpe_date(Date ope_date) {
		this.ope_date = ope_date;
	}
	public String getOpe_module() {
		return ope_module;
	}
	public void setOpe_module(String ope_module) {
		this.ope_module = ope_module;
	}
	public String getOpe_context() {
		return ope_context;
	}
	public void setOpe_context(String ope_context) {
		this.ope_context = ope_context;
	}
	
}
