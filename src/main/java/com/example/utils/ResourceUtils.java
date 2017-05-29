/**
 * 
 */
package com.example.utils;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



/**
 * @author Administrator
 *
 */
public class ResourceUtils {
	
	private static final Logger LOG = LoggerFactory.getLogger(ResourceUtils.class);
	
	private static final String EMAIL_CONFIG_FILE = "com/example/config/email.properties";
	
	private ResourceUtils() {
		
	}
	
	public static Properties getEmailConfig() {
		return loadProperties(EMAIL_CONFIG_FILE);
	}
	
	private static Properties loadProperties(String propertiesFile) {
		Properties properties = new Properties();
		ClassLoader cl = ResourceUtils.class.getClassLoader();
		URL url = cl.getResource(EMAIL_CONFIG_FILE);

		try (InputStream in = url.openStream();) {
			properties.load(in);
		} catch (IOException e) {
			LOG.error("get email config file error: " + e, e);
		}

		return properties;
	}
}
