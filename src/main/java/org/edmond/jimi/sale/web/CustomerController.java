package org.edmond.jimi.sale.web;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.edmond.jimi.Constants;
import org.edmond.jimi.company.entity.Company;
import org.edmond.jimi.company.entity.Employee;
import org.edmond.jimi.sale.entity.Customer;
import org.edmond.jimi.sale.service.CustomerService;
import org.edmond.mywebapp.system.service.ShiroDbRealm.ShiroUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/jimi/customer")
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	@ModelAttribute
	public void getCustomer(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("user", customerService.get(id));
		}
	}
	
	@RequestMapping(value="customers",method = RequestMethod.GET)
	public String list(Model model) {
		List<Customer> customers = customerService.list();
		model.addAttribute("customers", customers);

		return "jimi/customer/customerList";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String insertForm() {
		return "jimi/customer/newCustomerForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insert(@Valid @ModelAttribute("customer") Customer customer,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		customer.setCreator(user.loginName);
		customer.setCreateDate(new Date(System.currentTimeMillis()));
		customer.setStatus(Constants.STATUS_ENABLED);
		customerService.insert(customer);
		redirectAttributes.addFlashAttribute("message", "创建客户" + customer.getName() + "成功");
		return "redirect:/jimi/customer/customers";
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("customer", customerService.get(id));
		return "jimi/customer/customerForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("customer") Customer customer,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		customer.setUpdater(user.loginName);
		customer.setUpdateDate(new Date(System.currentTimeMillis()));
		customerService.update(customer);
		redirectAttributes.addFlashAttribute("message", "更新客户" + customer.getName() + "成功");
		return "redirect:/jimi/customer/customers";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Customer customer = customerService.get(id);
		customer.setStatus(Constants.STATUS_DELETED);
//		customerService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除客户" + customer.getName() + "成功");
		return "redirect:/jimi/customer/customers";
	}

	@RequestMapping(value = "checkName")
	@ResponseBody
	public String checkName(@RequestParam String name, RedirectAttributes redirectAttributes) {
		return String.valueOf(!customerService.checkNameExist(name));
	}
	@RequestMapping(value = "changeStatus")
	public String changeStatus(@RequestParam String status,@RequestParam Long id, RedirectAttributes redirectAttributes) {
		Customer customer = customerService.get(id);
		customer.setStatus(status);
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		customer.setUpdater(user.loginName);
		customer.setUpdateDate(new Date(System.currentTimeMillis()));
		customerService.update(customer);
		redirectAttributes.addFlashAttribute("message", "设置客户" + customer.getName() + "成功");
		return "redirect:/jimi/customer/customers";
	}
}
