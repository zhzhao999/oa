package cnmei.oa.bean;

public class ResultBean {
	private int code;
	private String message;
	public int getCode() {
		return code;
	}
	
	/**
	 * 状态码  0=false 1=true
	 * @param code
	 */
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
