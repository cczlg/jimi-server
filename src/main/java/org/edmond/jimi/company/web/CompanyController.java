package org.edmond.jimi.company.web;

import java.util.List;

import javax.validation.Valid;

import org.edmond.jimi.company.entity.Company;
import org.edmond.jimi.company.service.CompanyService;
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
@RequestMapping(value = "/jimi/company")
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	
	@ModelAttribute
	public void getCompany(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("company", companyService.get(id));
		}
	}
	
	@RequestMapping(value="companies",method = RequestMethod.GET)
	public String list(Model model) {
		List<Company> companys = companyService.list();
		model.addAttribute("companys", companys);

		return "jimi/company/companyList";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String insertForm() {
		return "jimi/company/newCompanyForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insert(@Valid @ModelAttribute("company") Company Company,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		companyService.insert(Company);
		redirectAttributes.addFlashAttribute("message", "创建公司" + Company.getName() + "成功");
		return "redirect:/jimi/company/companys";
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("company", companyService.get(id));
		return "jimi/company/companyForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("company") Company Company,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		companyService.update(Company);
		redirectAttributes.addFlashAttribute("message", "更新公司" + Company.getName() + "成功");
		return "redirect:/jimi/company/companys";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Company company = companyService.get(id);
		companyService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除公司" + company.getName() + "成功");
		return "redirect:/jimi/company/Companys";
	}
}
