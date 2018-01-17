package net.qjzd.wjsp.config;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class FileUploadConfig {
    private static final Logger logger = Logger.getLogger(FileUploadConfig.class);

	private static final String DEFAULT_ENCODING = "UTF-8";
	private static final Integer MAX_UPLOAD_SIZE = 2 * 1024 * 1024;

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		commonsMultipartResolver.setDefaultEncoding(DEFAULT_ENCODING);
		commonsMultipartResolver.setMaxUploadSize(MAX_UPLOAD_SIZE);
		return commonsMultipartResolver;
	}
}
