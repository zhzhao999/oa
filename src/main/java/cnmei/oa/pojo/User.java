package cnmei.oa.pojo;

import java.io.Serializable;

public class User implements Serializable{
	private static final long serialVersionUID = 3329228541580530658L;
	
	private int id;
	private String name;
	private String password;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}