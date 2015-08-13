package org.edmond.test.MyWebApp.functional;

import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Driver;

import org.eclipse.jetty.server.Server;
import org.edmond.mywebapp.utilities.utils.PropertiesLoader;
import org.edmond.test.MyWebApp.QuickStartServer;
import org.edmond.test.base.data.DataFixtures;
import org.edmond.test.base.jetty.JettyFactory;
import org.edmond.test.base.spring.Profiles;
import org.junit.BeforeClass;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

/**
 * 功能测试基类.
 * 
 * 在整个测试期间启动一次Jetty Server和 Selenium，在JVM退出时关闭两者。 在每个TestCase Class执行前重新载入默认数据.
 * 
 * @author calvin
 */
public class BaseFunctionalTestCase {

	protected static String baseUrl;

	protected static Server jettyServer;

	protected static SimpleDriverDataSource dataSource;

	protected static PropertiesLoader propertiesLoader = new PropertiesLoader(
			"classpath:/application.properties",
			"classpath:/application.functional.properties",
			"classpath:/application.test.properties");

	private static Logger logger = LoggerFactory
			.getLogger(BaseFunctionalTestCase.class);

	@BeforeClass
	public static void initFunctionalTestEnv() throws Exception {
		baseUrl = propertiesLoader.getProperty("baseUrl");

		// 如果是目标地址是localhost，则启动嵌入式jetty。如果指向远程地址，则不需要启动Jetty.
		boolean isEmbedded = new URL(baseUrl).getHost().equals("localhost")
				&& propertiesLoader.getBoolean("embeddedForLocal");
		System.out.println("baseUrl is : " + baseUrl);
		System.out.println("embeddedForLocal is :"
				+ propertiesLoader.getBoolean("embeddedForLocal"));
		if (isEmbedded) {
			startJettyOnce();
		}

		buildDataSourceOnce();
		// reloadSampleData();
	}

	/**
	 * 启动Jetty服务器, 仅启动一次.
	 * 
	 * @throws MalformedURLException
	 */
	protected static void startJettyOnce() throws Exception {
		System.out.println("jettyServer is : " + jettyServer);
		if (jettyServer == null) {
			// 设定Spring的profile
			Profiles.setProfileAsSystemProperty(Profiles.FUNCTIONAL_TEST);

			jettyServer = JettyFactory.createServerInSource(
					new URL(baseUrl).getPort(), QuickStartServer.CONTEXT);
			JettyFactory.setTldJarNames(jettyServer,
					QuickStartServer.TLD_JAR_NAMES);
			System.out.println("jettyServer is instance : " + jettyServer);
			try {
				jettyServer.start();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			logger.info("Jetty Server started at {}", baseUrl);
		}
	}

	/**
	 * 构造数据源，仅构造一次. 连接参数从配置文件中读取，可指向本地的开发环境，也可以指向远程的测试服务器。
	 */
	protected static void buildDataSourceOnce() throws ClassNotFoundException {
		if (dataSource == null) {
			dataSource = new SimpleDriverDataSource();
			dataSource.setDriverClass((Class<? extends Driver>) Class
					.forName(propertiesLoader.getProperty("jdbc.driver")));
			dataSource.setUrl(propertiesLoader.getProperty("jdbc.url"));
			dataSource.setUsername(propertiesLoader
					.getProperty("jdbc.username"));
			dataSource.setPassword(propertiesLoader
					.getProperty("jdbc.password"));
		}
	}

	/**
	 * 载入测试数据.
	 */
	protected static void reloadSampleData() throws Exception {
		String dbType = propertiesLoader.getProperty("db.type", "h2");
		DataFixtures.executeScript(dataSource, "classpath:data/" + dbType
				+ "/cleanup-data.sql", "classpath:data/" + dbType
				+ "/import-data.sql");
	}
}