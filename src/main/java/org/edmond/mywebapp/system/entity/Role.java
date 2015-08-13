package org.edmond.mywebapp.system.entity;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.edmond.mywebapp.base.entity.IdEntity;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.internal.util.privilegedactions.NewInstance;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Lists;

/**
 * 角色.
 * 
 * @author zhanglg
 */
public class Role extends IdEntity {

	private String name;
	private String description;
	
	private Long[] permissions;
	private List<Permission> permissionList = Lists.newArrayList();
	
	public List<Permission> getPermissionList() {
		return permissionList;
	}

	public void setPermissionList(List<Permission> permissionList) {
		this.permissionList = permissionList;
	}

	public Role() {
	}
	
	public Role(Long roleId) {
		this.id=roleId;
	}
	@NotBlank
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public List<String> getPermissionStringList() {
		List<String> permList = new ArrayList<String>();
		for (Permission perm : permissionList) {
			permList.add(perm.getPermission());
		}
		return permList;
	}

	public Long[] getPermissions() {
		return permissions;
	}

	public void setPermissions(Long[] permissions) {
		this.permissions = permissions;
	}
}
