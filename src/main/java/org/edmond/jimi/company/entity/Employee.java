package org.edmond.jimi.company.entity;

import javax.xml.bind.annotation.XmlRootElement;

import org.edmond.mywebapp.base.entity.IdEntity;

@XmlRootElement(name = "Employee")
public class Employee extends IdEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7763805072635510424L;

	private Long companyId;
	private String name;
	private String phone;
	private String phoneIMEI;
	private String status;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhoneIMEI() {
		return phoneIMEI;
	}

	public void setPhoneIMEI(String phoneIMEI) {
		this.phoneIMEI = phoneIMEI;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
