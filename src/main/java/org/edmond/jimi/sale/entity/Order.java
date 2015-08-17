package org.edmond.jimi.sale.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import org.edmond.mywebapp.base.entity.IdEntity;
import org.springframework.format.annotation.DateTimeFormat;

@XmlRootElement(name = "Order")
public class Order extends IdEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5757000491151688059L;
	private Long employeeId;
	private Long companyId;
	private String code = "";
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orderTime;
	private Long customerId;
	private String customer = "";
	private double total;
	private String salesman = "";
	private String address = "";
	private String customerphone = "";
	
	private List<OrderItem> items = new ArrayList<OrderItem>();
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getSalesman() {
		return salesman;
	}
	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCustomerphone() {
		return customerphone;
	}
	public void setCustomerphone(String customerphone) {
		this.customerphone = customerphone;
	}
	public List<OrderItem> getItems() {
		return items;
	}
	public void setItems(List<OrderItem> items) {
		this.items = items;
	}
	public Long getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Long employeeId) {
		this.employeeId = employeeId;
	}
	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	
	
}
