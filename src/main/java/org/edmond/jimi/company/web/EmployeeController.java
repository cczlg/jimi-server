package org.edmond.jimi.company.web;

import java.util.List;

import javax.validation.Valid;

import org.edmond.jimi.company.entity.Employee;
import org.edmond.jimi.company.service.EmployeeService;
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
@RequestMapping(value = "/jimi/employee")
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	
	@ModelAttribute
	public void getEmployee(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("employee", employeeService.get(id));
		}
	}
	
	@RequestMapping(value="employees",method = RequestMethod.GET)
	public String list(Model model) {
		List<Employee> employees = employeeService.list();
		model.addAttribute("employees", employees);

		return "jimi/employee/employeeList";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String insertForm() {
		return "jimi/employee/newEmployeeForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insert(@Valid @ModelAttribute("employee") Employee employee,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		employeeService.insert(employee);
		redirectAttributes.addFlashAttribute("message", "创建员工" + employee.getName() + "成功");
		return "redirect:jimi/employee/employees";
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("employee", employeeService.get(id));
		return "jimi/employee/employeeForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("employee") Employee employee,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		employeeService.update(employee);
		redirectAttributes.addFlashAttribute("message", "更新员工" + employee.getName() + "成功");
		return "redirect:/jimi/employee/employees";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Employee employee = employeeService.get(id);
		employeeService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除员工" + employee.getName() + "成功");
		return "redirect:/jimi/employee/employees";
	}
}
