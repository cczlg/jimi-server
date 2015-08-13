package org.edmond.jimi.sale.service.impl;

import java.util.List;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Customer entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Customer get(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(Customer entity) {
		// TODO Auto-generated method stub
		
	}
}
