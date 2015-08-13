package org.edmond.weixin;

import java.text.MessageFormat;
import java.util.Timer;
import java.util.TimerTask;

import org.edmond.mywebapp.system.schedule.UserCountScanner;
import org.edmond.mywebapp.utilities.mapper.JsonMapper;
import org.edmond.weixin.entity.AccessToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author Edmond
 *
 *         统一处理微信平台access_token的获取和刷新的中控服务器，所有业务应该从这里取得access_token
 * 
 */
public class AccessTokenCenter {
	private static Logger logger = LoggerFactory
			.getLogger(AccessTokenCenter.class);

	private static String TOKEN_INTERFACE_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={0}&secret={1}";
	private static AccessTokenCenter accessTokenCenter;

	private AccessToken token;
	/**
	 * 刷新Token的定时器
	 */
	private Timer timer = null;
	/**
	 * 刷新Token的任务
	 */
	private TimerTask task = null;

	private AccessTokenCenter() {
		task = new TimerTask() {
			@Override
			public void run() {
				refreshToken();
			}
		};

		timer = new Timer(true);
	}

	public static AccessTokenCenter getInstance() {
		if (accessTokenCenter == null) {
			accessTokenCenter = new AccessTokenCenter();
		}

		return accessTokenCenter;
	}

	/**
	 * @return Access_Token字符串
	 */
	public String getAccessToken() {
		long nowTime = System.currentTimeMillis();
		long expires = this.token.getLast_timestamp()
				+ (this.token.getExpires_in() * 1000);
		if (expires < nowTime) {
			this.refreshToken();
		}

		return this.token.getAccess_token();
	}

	/**
	 * 刷新Access_Token
	 */
	private void refreshToken() {
		String result = HttpClientUtils.doGet(MessageFormat.format(
				TOKEN_INTERFACE_URL, WXConstants.APPID, WXConstants.APPSECRET));

		AccessToken newToken = JsonMapper.nonEmptyMapper().fromJson(result,
				AccessToken.class);
		if (newToken.getErrcode() == null) {
			newToken.setLast_timestamp(System.currentTimeMillis());
			this.token = newToken;

			timer.schedule(task, newToken.getExpires_in() - 5);
		} else {
			logger.error("微信服务返回失败信息：" + result);
		}
	}

}
