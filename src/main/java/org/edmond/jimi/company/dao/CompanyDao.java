package org.edmond.jimi.company.dao;

import org.edmond.jimi.company.entity.Company;
import org.edmond.mywebapp.base.dao.MyBatisRepository;
import org.edmond.mywebapp.base.dao.SqlMapper;

@MyBatisRepository
public interface CompanyDao extends SqlMapper<Company> {

}
