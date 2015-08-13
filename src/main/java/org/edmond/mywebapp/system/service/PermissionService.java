package org.edmond.mywebapp.system.service;

import java.util.List;

import org.edmond.mywebapp.system.entity.Permission;

public interface PermissionService {
	public List<Permission> list() ;
	public void update(Permission permission) ;
	public Permission get(Long id);
	public void delete(Long id);
	public void insert(Permission permission);
	public Permission findPermissionByPermission(String permission);
}
