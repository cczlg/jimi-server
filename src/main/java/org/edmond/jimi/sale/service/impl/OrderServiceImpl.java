package org.edmond.jimi.sale.service.impl;

import java.util.List;

import org.edmond.jimi.sale.dao.OrderDao;
import org.edmond.jimi.sale.entity.Order;
import org.edmond.jimi.sale.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao;

	@Override
	public List<Order> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Order entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Order get(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(Order entity) {
		// TODO Auto-generated method stub
		
	}
}
