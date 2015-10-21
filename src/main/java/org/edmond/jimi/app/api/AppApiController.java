package org.edmond.jimi.app.api;

import java.util.Date;

import org.edmond.jimi.app.entity.App;
import org.edmond.jimi.app.service.AppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/app")
public class AppApiController {
	@Autowired
	private AppService appService;
	@RequestMapping(value = "/getNewest", method = RequestMethod.GET)
	@ResponseBody
	public App getNewest() {
		App app=appService.getNewest();
		return app;
	}
}
