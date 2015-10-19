package org.edmond.jimi.app.service.impl;

import java.util.List;
import java.util.Map;

import org.edmond.jimi.app.dao.AppDao;
import org.edmond.jimi.app.entity.App;
import org.edmond.jimi.app.service.AppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AppServiceImpl implements AppService {
	@Autowired
	private AppDao appDao;
	@Override
	public List<App> list() {
		return appDao.getAll();
	}

	@Override
	public void update(App entity) {
		appDao.update(entity);
	}

	@Override
	public App get(Long id) {
		return appDao.get(id);
	}

	@Override
	public void delete(Long id) {
		appDao.delete(id);
	}

	@Override
	public void insert(App entity) {
		appDao.insert(entity);
	}

	@Override
	public List<App> search(Map<String, Object> paramMap) {
		return appDao.search(paramMap);
	}

	@Override
	public App getNewest() {
		return appDao.getNewest();
	}

}
