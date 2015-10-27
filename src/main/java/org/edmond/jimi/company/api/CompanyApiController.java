package org.edmond.jimi.company.api;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.edmond.jimi.company.entity.Employee;
import org.edmond.jimi.company.service.CompanyService;
import org.edmond.jimi.company.service.EmployeeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/company")
public class CompanyApiController {
	private static Logger logger = LoggerFactory.getLogger(CompanyApiController.class);
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private CompanyService companyService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public boolean newEmployee(@RequestBody Employee emp) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("companyId", emp.getCompanyId());
		
		if (StringUtils.isNotEmpty(emp.getPhoneIMEI()))
			paramMap.put("phoneIMEI", emp.getPhoneIMEI());
		List<Employee> employees = employeeService.search(paramMap);
		if (employees == null || employees.size() == 0) {
			emp.setCreateDate(new Date(System.currentTimeMillis()));
			employeeService.insert(emp);
			logger.debug("Create an employee-->" + emp.toString());
		} else {
			emp.setId(employees.get(0).getId());
			emp.setLoginCount(employees.get(0).getLoginCount()+1);
			emp.setUpdateDate(new Date(System.currentTimeMillis()));
			employeeService.update(emp);
		}
		return true;
	}
}
