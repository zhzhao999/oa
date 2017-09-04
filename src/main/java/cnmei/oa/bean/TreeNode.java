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
	private int item_code;
	private String item_name;

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
	public TreeNode(Integer id, Integer pId, String name, int item_code) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.item_code = item_code;
		this.checked = false;
		this.open = false;
	}

	public TreeNode() {
		super();
	}

	public int getItem_code() {
		return item_code;
	}

	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
}
