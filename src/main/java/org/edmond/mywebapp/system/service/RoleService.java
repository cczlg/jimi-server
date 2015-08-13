package org.edmond.mywebapp.system.service;

import java.util.List;
import java.util.Map;

import org.edmond.mywebapp.system.entity.Role;
import org.edmond.mywebapp.system.entity.User;

public interface RoleService {
	public List<Role> list() ;
	public void update(Role role) ;
	public Role get(Long id);
	public void delete(Long id);
	public void insert(Role role);
	public Object findRoleByName(String name);
	public List<Map> getAllPermsAndCheckStatus(Long id);
	public void insertRPBat(Role user);
}
