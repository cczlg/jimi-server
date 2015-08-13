package org.edmond.weixin.entity;

import java.util.ArrayList;
import java.util.List;

public class WXButton {
	/**
	 * 必须有，菜单标题，不超过16个字节，子菜单不超过40个字节
	 */
	private String name;
	/**
	 * 必须有，菜单的响应动作类型
	 */
	private String type;
	/**
	 * click等点击类型必须	菜单KEY值，用于消息接口推送，不超过128字节
	 */
	private String key;
	/**
	 * view类型必须	网页链接，用户点击菜单可打开链接，不超过256字节
	 */
	private String url;
	/**
	 * 下级菜单
	 */
	private List<WXButton> sub_button = new ArrayList<WXButton>();
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<WXButton> getSub_button() {
		return sub_button;
	}
	public void setSub_button(List<WXButton> sub_button) {
		this.sub_button = sub_button;
	}
	
	
}
