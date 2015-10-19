package org.edmond.jimi.app.dao;

import org.edmond.jimi.app.entity.App;
import org.edmond.mywebapp.base.dao.MyBatisRepository;
import org.edmond.mywebapp.base.dao.SqlMapper;

@MyBatisRepository
public interface AppDao extends SqlMapper<App> {

	App getNewest();

}
