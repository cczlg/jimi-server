package org.edmond.mywebapp.system.entity;

import org.edmond.mywebapp.base.entity.IdEntity;
import org.hibernate.validator.constraints.NotBlank;

/**
 * 
 * @author "Zhangligang"
 *
 */
public class Permission  extends IdEntity {
	private String permission;
	private String description;
	@NotBlank
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
