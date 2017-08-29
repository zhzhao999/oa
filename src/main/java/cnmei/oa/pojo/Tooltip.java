package cnmei.oa.pojo;

import java.util.Date;

public class Tooltip {

	private Integer id;
	private Integer employee_id;
	private String message;
	private boolean status;
	private Date create_time;
	
	private boolean fin_status;


	public boolean isFin_status() {
		return fin_status;
	}

	public void setFin_status(boolean fin_status) {
		this.fin_status = fin_status;
	}

	public Integer getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Integer getId() {
		return id;
	}

	public String getMessage() {
		return message;
	}

	public boolean isStatus() {
		return status;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
