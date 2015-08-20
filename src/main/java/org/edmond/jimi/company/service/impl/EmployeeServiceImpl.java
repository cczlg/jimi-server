package org.edmond.jimi.company.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.edmond.jimi.company.dao.EmployeeDao;
import org.edmond.jimi.company.entity.Company;
import org.edmond.jimi.company.entity.Employee;
import org.edmond.jimi.company.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeDao employeeDao;

	@Override
	public List<Employee> list() {
		return employeeDao.getAll();
	}

	@Override
	public void update(Employee entity) {
		employeeDao.update(entity);
	}

	@Override
	public Employee get(Long id) {
		return employeeDao.get(id);
	}

	@Override
	public void delete(Long id) {
		employeeDao.delete(id);
	}

	@Override
	public void insert(Employee entity) {
		employeeDao.insert(entity);
	}
	
	@Override
	public boolean checkPhoneExist(String phone) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("phone", phone);
		List<Employee> list= employeeDao.search(paramMap);
		if(list!=null && list.size()>0){
			return true;
		}
		return false;
	}

	@Override
	public List<Employee> search(Map<String, Object> paramMap) {
		return employeeDao.search(paramMap);
	}
}
