package net.qjzd.wjsp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2016  </p>
 * <p>Company:ND Co., Ltd.  </p>
 * <p>Create Time: 2017/6/13 </p>
 *
 * @author nianqin
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "net.qjzd.*", includeFilters = {
    @Filter(type= FilterType.ANNOTATION, value=Repository.class),
    @Filter(type= FilterType.ANNOTATION, value=Controller.class),
    @Filter(type= FilterType.ANNOTATION, value=Service.class),
    @Filter(type= FilterType.ANNOTATION, value=Component.class)
})
public class MvcConfig extends WebMvcConfigurerAdapter {
    /**
     * 经过测试，加入后开发过程中启动tomcat偶尔会失败，原因待排查
     * 拦截器注入
     * https://stackoverflow.com/questions/23349180/java-config-for-spring-interceptor-where-interceptor-is-using-autowired-spring-b
     */
//    @Bean
//    GlobalInterceptor globalInterceptor () {
//        return new GlobalInterceptor();
//    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        super.addResourceHandlers(registry);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(globalInterceptor())
//                .addPathPatterns("/**");
        super.addInterceptors(registry);
    }
}
