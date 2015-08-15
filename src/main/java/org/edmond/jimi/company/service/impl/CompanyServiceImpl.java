package org.edmond.jimi.company.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.edmond.jimi.company.dao.CompanyDao;
import org.edmond.jimi.company.entity.Company;
import org.edmond.jimi.company.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService {
	@Autowired
	private CompanyDao companyDao;

	@Override
	public List<Company> list() {
		return companyDao.getAll();
	}

	@Override
	public void update(Company entity) {
		companyDao.update(entity);
	}

	@Override
	public Company get(Long id) {
		return companyDao.get(id);
	}

	@Override
	public void delete(Long id) {
		companyDao.delete(id);
	}

	@Override
	public void insert(Company entity) {
		companyDao.insert(entity);
	}

	@Override
	public boolean checkNameExist(String name) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("name", name);
		List<Company> list= companyDao.search(paramMap);
		if(list!=null && list.size()>0){
			return true;
		}
		return false;
	}
}
