package org.edmond.jimi.sale.web;

import java.util.List;

import javax.validation.Valid;

import org.edmond.jimi.sale.entity.Product;
import org.edmond.jimi.sale.service.ProductService;
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
@RequestMapping(value = "/jimi/product")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@ModelAttribute
	public void getProduct(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("product", productService.get(id));
		}
	}
	
	@RequestMapping(value="products",method = RequestMethod.GET)
	public String list(Model model) {
		List<Product> products = productService.list();
		model.addAttribute("products", products);

		return "jimi/product/productList";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String insertForm() {
		return "jimi/product/newProductForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String insert(@Valid @ModelAttribute("product") Product product,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		productService.insert(product);
		redirectAttributes.addFlashAttribute("message", "创建产品" + product.getProduct() + "成功");
		return "redirect:/jimi/product/products";
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("product", productService.get(id));
		return "jimi/product/productForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("product") Product product,BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if(bindingResult.hasErrors())
		{
			return "error/error";
		}
		productService.update(product);
		redirectAttributes.addFlashAttribute("message", "更新产品" + product.getProduct() + "成功");
		return "redirect:/jimi/product/products";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Product product = productService.get(id);
		productService.delete(id);
		redirectAttributes.addFlashAttribute("message", "删除产品" + product.getProduct() + "成功");
		return "redirect:/jimi/product/products";
	}
}
