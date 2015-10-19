package org.edmond.jimi.app.web;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.edmond.jimi.Constants;
import org.edmond.jimi.app.service.AppService;
import org.edmond.jimi.app.entity.App;
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
@RequestMapping(value = "/jimi/app")
public class AppController {
	@Autowired
	private AppService appService;
	
	@ModelAttribute
	public void getApp(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("app", appService.get(id));
		}
	}
	
	@RequestMapping(value="apps",method = RequestMethod.GET)
	public String list(Model model) {
		List<App> apps = appService.list();
		model.addAttribute("apps", apps);

		return "jimi/app/appList";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String insertForm() {
		return "jimi/app/appForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insert(@Valid @ModelAttribute("app") App app,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		app.setCreator(user.loginName);
		app.setCreateDate(new Date(System.currentTimeMillis()));
		app.setReleaseDate(app.getCreateDate());
		appService.insert(app);
		redirectAttributes.addFlashAttribute("message", "发布应用版本" + app.getVersionName() + "成功");
		return "redirect:/jimi/app/apps";
	}
	
	
}
