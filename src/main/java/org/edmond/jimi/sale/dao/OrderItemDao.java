package org.edmond.jimi.sale.dao;

import org.edmond.jimi.sale.entity.OrderItem;
import org.edmond.mywebapp.base.dao.MyBatisRepository;
import org.edmond.mywebapp.base.dao.SqlMapper;

@MyBatisRepository
public interface OrderItemDao extends SqlMapper<OrderItem> {

	void deleteByOrderCode(String code);

}
