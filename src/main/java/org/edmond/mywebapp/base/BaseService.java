package org.edmond.mywebapp.base;

import java.util.List;

public interface BaseService<T> {
	public List<T> list() ;
	public void update(T entity) ;
	public T get(Long id);
	public void delete(Long id);
	public void insert(T entity);
}
