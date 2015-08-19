package org.edmond.jimi.sale.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.edmond.jimi.sale.dao.OrderDao;
import org.edmond.jimi.sale.dao.OrderItemDao;
import org.edmond.jimi.sale.entity.Order;
import org.edmond.jimi.sale.entity.OrderItem;
import org.edmond.jimi.sale.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderItemDao orderItemDao;

	@Override
	public List<Order> list() {
		return orderDao.getAll();
	}

	@Override
	public void update(Order entity) {
		orderDao.update(entity);
		orderItemDao.deleteByOrderCode(entity.getCode());
		if(entity.getItems()!=null){
			for (OrderItem item : entity.getItems()) {
				orderItemDao.insert(item);
			}
		}
	}

	@Override
	public Order get(Long id) {
		Order order=orderDao.get(id);
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("orderCode", order.getCode());
		order.setItems(orderItemDao.search(paramMap));
		return order;
	}

	@Override
	public void delete(Long id) {
		Order order=orderDao.get(id);
		orderItemDao.deleteByOrderCode(order.getCode());
		orderDao.delete(id);
	}

	@Override
	public void insert(Order entity) {
		orderDao.insert(entity);
		if(entity.getItems()!=null){
			for (OrderItem item : entity.getItems()) {
				orderItemDao.insert(item);
			}
		}
	}
}
