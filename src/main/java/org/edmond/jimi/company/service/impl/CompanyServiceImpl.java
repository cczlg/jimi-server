package org.edmond.jimi.company.service.impl;

import java.util.List;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Company entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Company get(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(Company entity) {
		// TODO Auto-generated method stub
		
	}
}
