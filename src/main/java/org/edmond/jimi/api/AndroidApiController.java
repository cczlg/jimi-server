package org.edmond.jimi.api;

import org.edmond.mywebapp.base.Response;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/employee")
public class AndroidApiController {

	@RequestMapping(value="login" , method = RequestMethod.GET)
	public Response login(@RequestParam String phoneNo,@RequestParam String phoneIMEI){
		String access_token="";
		Response response=new Response(true,access_token);
		
		return response;
	}
	
	@RequestMapping(value="checkUpdate",method=RequestMethod.GET)
	public Response checkUpdate(@RequestParam String version){
		return new Response(true,"download url");
	}
}
