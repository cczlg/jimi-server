package org.edmond.mywebapp.system.service;

import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.edmond.mywebapp.system.service.ShiroDbRealm.ShiroUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class BusinessLogger {
	// 业务日志的logger
	private static Logger businessLogger = LoggerFactory.getLogger("business");

	public void log(String action, Map data) {
		businessLogger.info("{},{},{}", action, getCurrentUserName(), data);
	}

	public void log(String action, Object object) {
		businessLogger.info("{},{},{}", action, getCurrentUserName(), object);
	}

	private String getCurrentUserName() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.loginName;
	}
}
