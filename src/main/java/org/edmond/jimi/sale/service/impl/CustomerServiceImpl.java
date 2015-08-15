package org.edmond.jimi.sale.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.edmond.jimi.company.entity.Employee;
import org.edmond.jimi.sale.dao.CustomerDao;
import org.edmond.jimi.sale.entity.Customer;
import org.edmond.jimi.sale.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao customerDao;

	@Override
	public List<Customer> list() {
		return customerDao.getAll();
	}

	@Override
	public void update(Customer entity) {
		customerDao.update(entity);
	}

	@Override
	public Customer get(Long id) {
		return customerDao.get(id);
	}

	@Override
	public void delete(Long id) {
		customerDao.delete(id);
	}

	@Override
	public void insert(Customer entity) {
		customerDao.insert(entity);
	}
	@Override
	public boolean checkNameExist(String name) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("name", name);
		List<Customer> list= customerDao.search(paramMap);
		if(list!=null && list.size()>0){
			return true;
		}
		return false;
	}
}
