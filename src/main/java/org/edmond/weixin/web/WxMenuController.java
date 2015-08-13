package org.edmond.weixin.web;

import org.edmond.weixin.entity.WXButton;
import org.edmond.weixin.service.WxMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/wx/menu")
public class WxMenuController {
	@Autowired
	private WxMenuService menuService;

	@RequestMapping(method = RequestMethod.GET)
	private String getMenu() {

		return "/wx/menu/menuForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	private String postMenu(WXButton button) {
		return "";
	}
}
