package org.edmond.mywebapp.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.edmond.mywebapp.system.dao.RoleDao;
import org.edmond.mywebapp.system.entity.Role;
import org.edmond.mywebapp.system.entity.User;
import org.edmond.mywebapp.system.service.BusinessLogger;
import org.edmond.mywebapp.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private BusinessLogger businessLogger;

	@Override
	public List<Role> list() {
		return roleDao.getAll();
	}

	@Override
	public void update(Role role) {
		roleDao.update(role);
		if (businessLogger != null)
			businessLogger.log("Update", role);
	}

	@Override
	public Role get(Long id) {
		return roleDao.get(id);
	}

	@Override
	public void delete(Long id) {
		roleDao.delete(id);
		if (businessLogger != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("table", "ss_role");
			map.put("id", id);
			businessLogger.log("List", map);
		}
	}

	@Override
	public void insert(Role role) {
		roleDao.insert(role);
		if (businessLogger != null)
			businessLogger.log("Insert", role);
	}

	@Override
	public Object findRoleByName(String name) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("name", name);
		List<Role> roles = roleDao.search(paramMap);

		return (roles != null && roles.size() > 0) ? roles.get(0) : null;
	}

	@Override
	public List<Map> getAllPermsAndCheckStatus(Long id) {
		return roleDao.getPermissionsCheckStatus(id);
	}

	@Override
	public void insertRPBat(Role role) {
		roleDao.insertRPBat(role);

		if (businessLogger != null)
			businessLogger.log("Update", role);
	}
}
