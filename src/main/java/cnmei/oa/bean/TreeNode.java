package cnmei.oa.bean;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public class TreeNode {
	private Integer id;
	@JsonProperty("pId")
	private Integer pId;
	private String name;
	private Boolean checked;
	private Boolean open;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPId() {
		return pId;
	}
	
	@JsonIgnore 
	public void setPId(Integer id) {
		pId = id;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean isChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public Boolean isOpen() {
		return open;
	}

	public void setOpen(Boolean open) {
		this.open = open;
	}

	public TreeNode(Integer id, Integer pId, String name, Boolean checked, Boolean open) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.checked = checked;
		this.open = open;
	}
	public TreeNode(Integer id, Integer pId, String name) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.checked = false;
		this.open = false;
	}

	public TreeNode() {
		super();
	}
}
