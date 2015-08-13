package org.edmond.mywebapp.system.web;

import java.util.List;

import javax.validation.Valid;

import org.edmond.mywebapp.system.entity.Permission;
import org.edmond.mywebapp.system.service.PermissionService;
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
@RequestMapping(value = "/admin/permission")
public class PermissionController {
	@Autowired
	private PermissionService permissionService;
	
	
	@RequestMapping(value="permissions",method = RequestMethod.GET)
	public String list(Model model) {
		List<Permission> permissions = permissionService.list();
		model.addAttribute("permissions", permissions);

		return "permission/adminPermissionList";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String insertForm() {
		return "permission/newPermissionForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insert(@Valid @ModelAttribute("user") Permission permission,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		permissionService.insert(permission);
		redirectAttributes.addFlashAttribute("message", "创建权限" + permission.getPermission() + "成功");
		return "redirect:/admin/permission/permissions";
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("permission", permissionService.get(id));
		return "permission/adminPermissionForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("permission") Permission permission,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		permissionService.update(permission);
		redirectAttributes.addFlashAttribute("message", "更新权限" + permission.getPermission() + "成功");
		return "redirect:/admin/permission/permissions";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Permission permission = permissionService.get(id);
		permissionService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除权限" + permission.getPermission() + "成功");
		return "redirect:/admin/permission/permissions";
	}
	
	/**
	 * Ajax请求校验name是否唯一。
	 */
	@RequestMapping(value = "checkPermission")
	@ResponseBody
	public String checkPermission(@RequestParam("permission") String permission) {
		if (permissionService.findPermissionByPermission(permission) == null) {
			return "true";
		} else {
			return "false";
		}
	}
}
