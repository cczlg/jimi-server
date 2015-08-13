package org.edmond.mywebapp.base.dao;

import java.util.List;
import java.util.Map;

/**
 * DAO接口基类
 * 
 * @author "Zhangligang"
 * 
 * @param <T>
 */
public interface SqlMapper<T> {
	/**
	 * for insert
	 * 
	 * @param entity
	 */
	public void insert(T entity);

	/**
	 * for update
	 * 
	 * @param entity
	 */
	public void update(T entity);

	/**
	 * delete entity by object
	 * 
	 * @param entity
	 */
	public void delete(T entity);

	/**
	 * delete entity by id
	 * 
	 * @param id
	 */
	public void delete(Long id);

	/**
	 * get one entity object by id
	 * 
	 * @param entity
	 * @return
	 */
	public T get(Long id);

	/**
	 * get all entity objects
	 * 
	 * @return
	 */
	public List<T> getAll();
	
	/**
	 * 
	 * @return
	 */
	public List<T> search(Map<String,Object> paramMap);
}
