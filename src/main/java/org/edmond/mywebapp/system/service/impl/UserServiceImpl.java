package org.edmond.mywebapp.system.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.edmond.mywebapp.system.dao.RoleDao;
import org.edmond.mywebapp.system.dao.UserDao;
import org.edmond.mywebapp.system.entity.Role;
import org.edmond.mywebapp.system.entity.User;
import org.edmond.mywebapp.system.service.BusinessLogger;
import org.edmond.mywebapp.system.service.UserService;
import org.edmond.mywebapp.utilities.security.utils.Digests;
import org.edmond.mywebapp.utilities.utils.Encodes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private BusinessLogger businessLogger;

	private static final int SALT_SIZE = 8;

	@Override
	public void register(User user) {
		entryptPassword(user);
		// user.setRoles("user");
		user.setRegisterDate(new Date());
		user.setStatus("disabled");
		userDao.insert(user);
		if (businessLogger != null)
			businessLogger.log("Insert", user);
	}

	@Override
	public List<User> list() {
		return userDao.getAll();
	}

	@Override
	public void update(User user) {
		if (StringUtils.isNotBlank(user.getPassword())) {
			entryptPassword(user);
		}
		userDao.update(user);
		if (businessLogger != null)
			businessLogger.log("Update", user);
	}

	@Override
	public User get(Long id) {
		return userDao.get(id);
	}

	@Override
	public void delete(Long id) {
		userDao.delete(id);
		if (businessLogger != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("table", "ss_user");
			map.put("id", id);
			businessLogger.log("List", map);
		}
	}

	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(User user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPassword().getBytes(), salt,
				HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

	@Override
	public User findUserByLoginName(String username) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("loginName", username);
		List<User> users = userDao.search(paramMap);

		return (users != null && users.size() > 0) ? users.get(0) : null;
	}

	@Override
	public List<String> getUserPermissions(Long id) {
		return userDao.getUserPermissions(id);
	}

	@Override
	public List<String> getUserRolesByUserId(Long id) {
		return userDao.getRoleByUserId(id);
	}

	@Override
	public List<Map> getAllRolesAndCheckStatus(Long id) {
		return userDao.getRolesCheckStatus(id);
	}

	@Override
	public void insertURBat(User user) {
		userDao.insertURBat(user);
		if (businessLogger != null)
			businessLogger.log("Update", user);
	}

}
