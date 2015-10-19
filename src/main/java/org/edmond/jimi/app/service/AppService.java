package org.edmond.jimi.app.service;

import org.edmond.jimi.app.entity.App;
import org.edmond.mywebapp.base.BaseService;

public interface AppService extends BaseService<App> {

	App getNewest();

}
