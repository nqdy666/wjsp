package net.qjzd.wjsp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource(value = {"classpath:app.properties"})
public class BeanConfig {
}
