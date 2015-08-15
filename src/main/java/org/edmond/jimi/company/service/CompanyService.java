package org.edmond.jimi.company.service;

import org.edmond.jimi.company.entity.Company;
import org.edmond.mywebapp.base.BaseService;

public interface CompanyService extends BaseService<Company> {

	boolean checkNameExist(String name);

}
