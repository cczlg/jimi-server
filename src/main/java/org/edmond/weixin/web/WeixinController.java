package org.edmond.weixin.web;

import java.util.ArrayList;
import java.util.Set;
import java.util.TreeSet;

import org.eclipse.jetty.util.log.Log;
import org.edmond.mywebapp.system.schedule.UserCountScanner;
import org.edmond.mywebapp.utilities.mapper.JaxbMapper;
import org.edmond.mywebapp.utilities.security.utils.Digests;
import org.edmond.weixin.WXConstants;
import org.edmond.weixin.entity.WXMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WeixinController {

	private static Logger logger = LoggerFactory
			.getLogger(UserCountScanner.class);

	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "/msg", method = RequestMethod.POST,consumes="application/xml")
	@ResponseBody
	public String responseMsg(@RequestBody String msg) {
		WXMessage wxmsg=JaxbMapper.fromXml(msg, WXMessage.class);
		System.out.println(wxmsg);
		
		wxmsg.setContent("aaabbbcccddd");
		System.out.println(JaxbMapper.toXml(wxmsg));
		return "wx/";
	}

	/**
	 * 
	 * @param signature
	 * @param timestamp
	 * @param nonce
	 * @param echostr
	 * @return
	 */
	@RequestMapping(value = "/msg", method = RequestMethod.GET)
	@ResponseBody
	private String valid(String signature, String timestamp, String nonce,
			String echostr) {
		logger.info("valid signature is {},timestamp is {}, nonce is {} .",
				signature, timestamp, nonce);
		if (signature != null && timestamp != null & nonce != null
				&& checkSignature(signature, timestamp, nonce)) {
			return echostr;
		}
		return "signature:" + signature + "; timestamp:" + timestamp
				+ "; nonce:" + nonce;
	}

	private boolean checkSignature(String signature, String timestamp,
			String nonce) {
		TreeSet<String> sortSet = new TreeSet<String>();
		sortSet.add(WXConstants.TOKEN);
		sortSet.add(timestamp);
		sortSet.add(nonce);

		StringBuffer sb = new StringBuffer();
		sb.append(sortSet.pollFirst());
		sb.append(sortSet.pollFirst());
		sb.append(sortSet.pollFirst());

		byte[] result = Digests.sha1(sb.toString().getBytes());
		StringBuffer tmpStr = new StringBuffer();
		for (int i = 0; i < result.length; i++) {
			tmpStr.append(Integer.toString((result[i] & 0xff) + 0x100, 16)
					.substring(1));
		}
		if (tmpStr.toString().equals(signature)) {
			return true;
		}

		return false;
	}

	// signature is 6b6d1e584bfb1f5346b199333c72a6c723a1a6c3,timestamp is
	// 1429739509, nonce is 369976694 .
	// public static void main(String args[]){
	// WeixinController wx=new WeixinController();
	// wx.checkSignature("6b6d1e584bfb1f5346b199333c72a6c723a1a6c3",
	// "1429739509", "369976694");
	// }
}
