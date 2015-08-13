package org.edmond.mywebapp.system.schedule;

import org.edmond.mywebapp.system.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 被Spring各种Scheduler反射调用的Service POJO.
 * 
 * @author Calvin
 */
@Component
public class UserCountScanner {

	private static Logger logger = LoggerFactory
			.getLogger(UserCountScanner.class);

	@Autowired
	private UserService accountService;


	// 被Spring的Quartz MethodInvokingJobDetailFactoryBean反射执行
	public void executeByQuartzLocalJob() {
		execute("quartz local job");
	}

	/**
	 * 定时打印当前用户数到日志.
	 */
	private void execute(String by) {
		long userCount = 1L;
		logger.info("There are {} user in database, printed by {}.", userCount,
				by);
	}
}
