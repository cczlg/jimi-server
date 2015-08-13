package org.edmond.weixin.entity;

/**
 * 
 * @author Edmond
 *	微信平台接口返回消息基类
 */
public class WXResult {
	
	private String errcode;
	private String errmsg;
	
	
	public String getErrcode() {
		return errcode;
	}
	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
	
	
}
