package org.edmond.mywebapp.system.dao;

import java.util.List;
import java.util.Map;

import org.edmond.mywebapp.base.dao.MyBatisRepository;
import org.edmond.mywebapp.base.dao.SqlMapper;
import org.edmond.mywebapp.system.entity.Role;
import org.edmond.mywebapp.system.entity.User;

@MyBatisRepository
public interface RoleDao extends SqlMapper<Role> {
	public List<Role> getRoleWithPermission(Long id);
	public List<Map> getPermissionsCheckStatus(Long userId);
	public void insertRPBat(Role role);
}
