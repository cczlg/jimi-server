package org.edmond.jimi.app.entity;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "App")
public class App{
	private Long id;
	private String creator;
	private String versionName;
	private Long  versionCode;
	private String fileName;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getVersionName() {
		return versionName;
	}
	public void setVersionName(String versionName) {
		this.versionName = versionName;
	}
	public Long getVersionCode() {
		return versionCode;
	}
	public void setVersionCode(Long versionCode) {
		this.versionCode = versionCode;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
