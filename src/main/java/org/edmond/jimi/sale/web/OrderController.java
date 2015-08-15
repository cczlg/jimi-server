package org.edmond.jimi.sale.web;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.edmond.jimi.Constants;
import org.edmond.jimi.sale.entity.Order;
import org.edmond.jimi.sale.service.OrderService;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/jimi/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@ModelAttribute
	public void getOrder(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("order", orderService.get(id));
		}
	}
	
	@RequestMapping(value="orders",method = RequestMethod.GET)
	public String list(Model model) {
		List<Order> orders = orderService.list();
		model.addAttribute("orders", orders);

		return "jimi/order/orderList";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String insertForm() {
		return "jimi/order/newOrderForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insert(@Valid @ModelAttribute("order") Order order,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		order.setCreator(user.loginName);
		order.setCreateDate(new Date(System.currentTimeMillis()));
		orderService.insert(order);
		redirectAttributes.addFlashAttribute("message", "创建订单" + order.getCode() + "成功");
		return "redirect:/jimi/order/orders";
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("order", orderService.get(id));
		return "jimi/order/orderForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("order") Order order,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		orderService.update(order);
		redirectAttributes.addFlashAttribute("message", "更新订单" + order.getCode() + "成功");
		return "redirect:/jimi/order/orders";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Order order = orderService.get(id);
		orderService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除订单" + order.getCode() + "成功");
		return "redirect:/jimi/order/orders";
	}
}
