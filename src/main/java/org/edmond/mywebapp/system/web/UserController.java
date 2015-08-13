package org.edmond.mywebapp.system.web;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.edmond.mywebapp.system.entity.User;
import org.edmond.mywebapp.system.service.UserService;
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

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

@Controller
@RequestMapping(value = "/admin/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String insertForm() {
		return "account/newUserForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insertUser(@Valid @ModelAttribute("user") User user,BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		userService.register(user);
		redirectAttributes.addFlashAttribute("message", "创建用户" + user.getLoginName() + "成功");
		return "redirect:/admin/user/users";
	}
	
	@RequestMapping(value="users",method = RequestMethod.GET)
	public String list(Model model) {
		List<User> users = userService.list();
		model.addAttribute("users", users);

		return "account/adminUserList";
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userService.get(id));
		return "account/adminUserForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("user") User user,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		userService.update(user);
		redirectAttributes.addFlashAttribute("message", "更新用户" + user.getLoginName() + "成功");
		return "redirect:/admin/user/users";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		User user = userService.get(id);
		userService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除用户" + user.getLoginName() + "成功");
		return "redirect:/admin/user/users";
	}
	
	@RequestMapping(value="authorized/{id}",method=RequestMethod.GET)
	public String authForm(@PathVariable("id") Long id,Model model) {
		List<Map> roleList=userService.getAllRolesAndCheckStatus(id);
		model.addAttribute("user", userService.get(id));
		model.addAttribute("roles", roleList);
		return "account/userAuthorized";
	}
	
	@RequestMapping(value = "authorized", method = RequestMethod.POST)
	public String authorized(@ModelAttribute("user") User user,RedirectAttributes redirectAttributes) {
		userService.insertURBat(user);
		redirectAttributes.addFlashAttribute("message", "更新" + user.getLoginName() + "用户角色成功");
		return "redirect:/admin/user/users";
	}
	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getUser(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("user", userService.get(id));
		}
	}
	
	@RequestMapping(value = "export", method = RequestMethod.GET)
	public void exportUserPDF(HttpServletRequest request){
		try {
			// step 1
	        Document document = new Document();
	        // step 2
	        PdfWriter writer;
			writer = PdfWriter.getInstance(document, new FileOutputStream("d:\\user.pdf"));
	        // step 3
	        document.open();
	        
	        URL url=new URL("http://localhost:8080/MyWebApp/admin/user/users");
	        // step 4
	        XMLWorkerHelper.getInstance().parseXHtml(writer, document,
	                url.openStream(), Charset.forName("UTF-8"));
	        // step 5
	        document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
}
