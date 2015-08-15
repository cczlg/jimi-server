package org.edmond.jimi.company.web;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.edmond.jimi.Constants;
import org.edmond.jimi.company.entity.Company;
import org.edmond.jimi.company.service.CompanyService;
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
		List<Company> companies = companyService.list();
		model.addAttribute("companies", companies);

		return "jimi/company/companyList";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String insertForm() {
		return "jimi/company/newCompanyForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insert(@Valid @ModelAttribute("company") Company company,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		company.setCreator(user.loginName);
		company.setCreateDate(new Date(System.currentTimeMillis()));
		company.setStatus(Constants.STATUS_ENABLED);
		companyService.insert(company);
		redirectAttributes.addFlashAttribute("message", "创建公司" + company.getName() + "成功");
		return "redirect:/jimi/company/companies";
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("company", companyService.get(id));
		return "jimi/company/companyForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("company") Company company,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		company.setCreator(user.loginName);
		company.setCreateDate(new Date(System.currentTimeMillis()));
		companyService.update(company);
		redirectAttributes.addFlashAttribute("message", "更新公司" + company.getName() + "成功");
		return "redirect:/jimi/company/companies";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Company company = companyService.get(id);
		companyService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除公司" + company.getName() + "成功");
		return "redirect:/jimi/company/companies";
	}
	
	@RequestMapping(value = "checkName")
	@ResponseBody
	public String checkName(@RequestParam String name, RedirectAttributes redirectAttributes) {
		return String.valueOf(!companyService.checkNameExist(name));
	}
	
	@RequestMapping(value = "changeStatus")
	public String changeStatus(@RequestParam String status,@RequestParam Long id, RedirectAttributes redirectAttributes) {
		Company company = companyService.get(id);
		company.setStatus(status);
		companyService.update(company);
		redirectAttributes.addFlashAttribute("message", "设置公司" + company.getName() + "成功");
		return "redirect:/jimi/company/companies";
	}
}
