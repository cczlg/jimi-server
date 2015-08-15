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
		return productDao.getAll();
	}

	@Override
	public void update(Product entity) {
		productDao.update(entity);
	}

	@Override
	public Product get(Long id) {
		return productDao.get(id);
	}

	@Override
	public void delete(Long id) {
		productDao.delete(id);
	}

	@Override
	public void insert(Product entity) {
		productDao.insert(entity);
	}
}
