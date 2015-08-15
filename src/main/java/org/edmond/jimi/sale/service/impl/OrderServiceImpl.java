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
		return orderDao.getAll();
	}

	@Override
	public void update(Order entity) {
		orderDao.update(entity);
	}

	@Override
	public Order get(Long id) {
		return orderDao.get(id);
	}

	@Override
	public void delete(Long id) {
		orderDao.delete(id);
	}

	@Override
	public void insert(Order entity) {
		orderDao.insert(entity);
	}
}
