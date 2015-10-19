package org.edmond.jimi.app.entity;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import org.edmond.mywebapp.base.entity.IdEntity;

@XmlRootElement(name = "App")
public class App extends IdEntity {
	private String versionName;
	private Long  versionCode;
	private Date releaseDate;
	private String fileName;
	
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
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
