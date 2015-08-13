package org.edmond.mywebapp.system.dao;

import org.edmond.mywebapp.base.dao.MyBatisRepository;
import org.edmond.mywebapp.base.dao.SqlMapper;
import org.edmond.mywebapp.system.entity.Permission;

@MyBatisRepository
public interface PermissionDao extends SqlMapper<Permission> {
}
