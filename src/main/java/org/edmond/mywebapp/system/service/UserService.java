package org.edmond.mywebapp.system.service;

import java.util.List;
import java.util.Map;

import org.edmond.mywebapp.system.entity.User;

public interface UserService {

	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	
	public void register(User user) ;
	public List<User> list() ;
	public void update(User user) ;
	public User get(Long id);
	public void delete(Long id);
	public User findUserByLoginName(String username);
	public List<String> getUserRolesByUserId(Long id);
	public List<String> getUserPermissions(Long id);
	public List<Map> getAllRolesAndCheckStatus(Long id);
	public void insertURBat(User user);
}
