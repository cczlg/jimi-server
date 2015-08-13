package org.edmond.mywebapp.system.dao;

import java.util.List;
import java.util.Map;

import org.edmond.mywebapp.base.dao.MyBatisRepository;
import org.edmond.mywebapp.base.dao.SqlMapper;
import org.edmond.mywebapp.system.entity.User;

/**
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * 
 * @author zhanglg
 */
@MyBatisRepository
public interface UserDao extends SqlMapper<User> {
	public List<User> getUserWithRole(String loginName);
	public List<String> getUserPermissions(Long id);
	public List<String> getRoleByUserId(Long userId);
	public List<Map> getRolesCheckStatus(Long userId);
	public void insertURBat(User user);
}
