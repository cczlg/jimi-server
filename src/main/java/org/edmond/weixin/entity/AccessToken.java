package org.edmond.weixin.entity;

public class AccessToken extends WXResult {
	private String access_token;
	private long expires_in;
	private long last_timestamp;
	
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public long getExpires_in() {
		return expires_in;
	}
	public void setExpires_in(long expires_in) {
		this.expires_in = expires_in;
	}
	public long getLast_timestamp() {
		return last_timestamp;
	}
	public void setLast_timestamp(long last_timestamp) {
		this.last_timestamp = last_timestamp;
	}
	
	
}
