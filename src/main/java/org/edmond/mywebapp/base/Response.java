package org.edmond.mywebapp.base;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "Response")
public class Response {
	private boolean success;
	private Object data;
	private String message;

	
	public Response(boolean success, String message) {
		super();
		this.success = success;
		this.message = message;
	}
	
	public Response(boolean success, Object data, String message) {
		super();
		this.success = success;
		this.data = data;
		this.message = message;
	}
	public Response() {
	}

	@XmlElement
	public boolean getSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	@XmlElement
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	@XmlElement
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
