package org.edmond.jimi.sale.dao;

import org.edmond.jimi.sale.entity.Order;
import org.edmond.mywebapp.base.dao.MyBatisRepository;
import org.edmond.mywebapp.base.dao.SqlMapper;

@MyBatisRepository
public interface OrderDao extends SqlMapper<Order> {

}
