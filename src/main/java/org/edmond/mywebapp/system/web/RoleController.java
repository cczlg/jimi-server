package org.edmond.mywebapp.system.web;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.edmond.mywebapp.system.entity.Role;
import org.edmond.mywebapp.system.entity.User;
import org.edmond.mywebapp.system.service.RoleService;
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
@RequestMapping(value = "/admin/role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	
	@RequestMapping(value="roles",method = RequestMethod.GET)
	public String list(Model model) {
		List<Role> roles = roleService.list();
		model.addAttribute("roles", roles);

		return "role/adminRoleList";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String insertForm() {
		return "role/newRoleForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insert(@Valid @ModelAttribute("user") Role role,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		roleService.insert(role);
		redirectAttributes.addFlashAttribute("message", "创建角色" + role.getName() + "成功");
		return "redirect:/admin/role/roles";
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("role", roleService.get(id));
		return "role/adminRoleForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("role") Role role,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		roleService.update(role);
		redirectAttributes.addFlashAttribute("message", "更新角色" + role.getName() + "成功");
		return "redirect:/admin/role/roles";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Role role = roleService.get(id);
		roleService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除角色" + role.getName() + "成功");
		return "redirect:/admin/role/roles";
	}
	@RequestMapping(value="authorized/{id}",method=RequestMethod.GET)
	public String authForm(@PathVariable("id") Long id,Model model) {
		List<Map> permList=roleService.getAllPermsAndCheckStatus(id);
		model.addAttribute("role", roleService.get(id));
		model.addAttribute("perms", permList);
		return "role/roleAuthorized";
	}
	
	@RequestMapping(value = "authorized", method = RequestMethod.POST)
	public String authorized(@ModelAttribute("role") Role role,RedirectAttributes redirectAttributes) {
		roleService.insertRPBat(role);
		redirectAttributes.addFlashAttribute("message", "更新" + role.getName() + "角色权限成功");
		return "redirect:/admin/role/roles";
	}
	/**
	 * Ajax请求校验name是否唯一。
	 */
	@RequestMapping(value = "checkName")
	@ResponseBody
	public String checkLoginName(@RequestParam("name") String name) {
		if (roleService.findRoleByName(name) == null) {
			return "true";
		} else {
			return "false";
		}
	}
}
