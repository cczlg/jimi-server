package org.edmond.jimi.company.service.impl;

import java.util.List;

import org.edmond.jimi.company.dao.EmployeeDao;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Employee entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Employee get(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(Employee entity) {
		// TODO Auto-generated method stub
		
	}
}
