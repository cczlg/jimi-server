package org.edmond.jimi.sale.web;

import java.util.List;

import javax.validation.Valid;

import org.edmond.jimi.sale.entity.Customer;
import org.edmond.jimi.sale.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		customerService.insert(customer);
		redirectAttributes.addFlashAttribute("message", "创建角色" + customer.getName() + "成功");
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
		customerService.update(customer);
		redirectAttributes.addFlashAttribute("message", "更新角色" + customer.getName() + "成功");
		return "redirect:/jimi/customer/customers";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Customer customer = customerService.get(id);
		customerService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除角色" + customer.getName() + "成功");
		return "redirect:/jimi/customer/customers";
	}
}
