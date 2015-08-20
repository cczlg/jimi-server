package org.edmond.mywebapp.base;

import java.util.List;
import java.util.Map;

public interface BaseService<T> {
	public List<T> list() ;
	public void update(T entity) ;
	public T get(Long id);
	public void delete(Long id);
	public void insert(T entity);
	public List<T> search(Map<String, Object> paramMap);
}
