package cnmei.oa.bean;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ResultBean implements Serializable {

	private static final long serialVersionUID = 1L;
	// 定义jackson对象
	private static final ObjectMapper MAPPER = new ObjectMapper();
	// 响应状态 0=false 1=true
	private int code;
	// 响应消息
	private String message;
	// 响应中的数据
	private Object data;

	public ResultBean(int code, String msg, Object data) {
		this.code = code;
		this.message = msg;
		this.data = data;
	}

	public ResultBean(Object data) {
		this.code = 1;
		this.message = "OK";
		this.data = data;
	}

	public ResultBean() {
	}

	public int getCode() {
		return code;
	}

	/**
	 * 状态码 0=false 1=true
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

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public static ResultBean build(Integer status, String msg, Object data) {
		return new ResultBean(status, msg, data);
	}

	public static ResultBean build(Integer code, String msg) {
		return new ResultBean(code, msg, null);
	}

	public static ResultBean build(Object data) {
		return new ResultBean(data);
	}

	public static ResultBean ok() {
		return new ResultBean(null);
	}

	/**
	 * 将json结果集转化为ResultBean对象
	 * 
	 * @param jsonData
	 *            json数据
	 * @param clazz
	 *            ResultBean中的object类型
	 */
	public static ResultBean formatToPojo(String jsonData, Class<?> clazz) {
		try {
			if (clazz == null) {
				return MAPPER.readValue(jsonData, ResultBean.class);
			}
			JsonNode jsonNode = MAPPER.readTree(jsonData);
			JsonNode data = jsonNode.get("data");
			Object obj = null;
			if (clazz != null) {
				if (data.isObject()) {
					obj = MAPPER.readValue(data.traverse(), clazz);
				} else if (data.isTextual()) {
					obj = MAPPER.readValue(data.asText(), clazz);
				}
			}
			return build(jsonNode.get("code").intValue(), jsonNode.get("message").asText(), obj);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 没有object对象的转化
	 */
	public static ResultBean format(String jsonStr) {
		try {
			return MAPPER.readValue(jsonStr, ResultBean.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Object是集合转化
	 * 
	 * @param jsonData
	 *            json数据
	 * @param clazz
	 *            集合中的类型
	 */
	public static ResultBean formatToList(String jsonData, Class<?> clazz) {
		try {
			JsonNode jsonNode = MAPPER.readTree(jsonData);
			JsonNode data = jsonNode.get("data");
			Object obj = null;
			if (data.isArray() && data.size() > 0) {
				obj = MAPPER.readValue(data.traverse(),
						MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
			}
			return build(jsonNode.get("code").intValue(), jsonNode.get("message").asText(), obj);
		} catch (Exception e) {
			return null;
		}
	}
}
