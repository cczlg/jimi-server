package org.edmond.mywebapp.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.edmond.mywebapp.system.dao.PermissionDao;
import org.edmond.mywebapp.system.entity.Permission;
import org.edmond.mywebapp.system.service.BusinessLogger;
import org.edmond.mywebapp.system.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PermissionServiceImpl implements PermissionService {
	@Autowired
	private PermissionDao permissionDao;
	@Autowired
	private BusinessLogger businessLogger;

	@Override
	public List<Permission> list() {
		return permissionDao.getAll();
	}

	@Override
	public void update(Permission permission) {
		permissionDao.update(permission);
		if (businessLogger != null)
			businessLogger.log("Update", permission);
	}

	@Override
	public Permission get(Long id) {
		return permissionDao.get(id);
	}

	@Override
	public void delete(Long id) {
		permissionDao.delete(id);
		if (businessLogger != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("table", "ss_permission");
			map.put("id", id);
			businessLogger.log("List", map);
		}
	}

	@Override
	public void insert(Permission permission) {
		permissionDao.insert(permission);
		if (businessLogger != null) {
			businessLogger.log("List", permission);
		}
	}

	@Override
	public Permission findPermissionByPermission(String permission) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("permission", permission);
		List<Permission> permissions = permissionDao.search(paramMap);

		return (permissions != null && permissions.size() > 0) ? permissions
				.get(0) : null;
	}

}
