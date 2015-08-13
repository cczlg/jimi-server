package org.edmond.jimi.sale.service.impl;

import java.util.List;

import org.edmond.jimi.sale.dao.ProductDao;
import org.edmond.jimi.sale.entity.Product;
import org.edmond.jimi.sale.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao productDao;

	@Override
	public List<Product> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Product entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Product get(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(Product entity) {
		// TODO Auto-generated method stub
		
	}
}
