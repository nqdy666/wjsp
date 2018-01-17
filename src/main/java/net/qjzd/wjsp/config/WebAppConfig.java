package net.qjzd.wjsp.config;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.*;
import java.util.EnumSet;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2016  </p>
 * <p>Company:ND Co., Ltd.  </p>
 * <p>Create Time: 2017/6/13 </p>
 *
 * @author nianqin
 */
public class WebAppConfig implements WebApplicationInitializer {
    private static final String CHARACTER_ENCODING_FILTER_ENCODING = "UTF-8";
    private static final String CHARACTER_ENCODING_FILTER_NAME = "characterEncoding";
    private static final String CHARACTER_ENCODING_FILTER_URL_PATTERN = "/*";

    private static final String CORS_FILTER_NAME = "crossOrigin";
    private static final String CORS_FILTER_URL_PATTERN = "/*";

    private static final String DISPATCHER_SERVLET_NAME = "dispatcher";
    private static final String DISPATCHER_SERVLET_MAPPING = "/";

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.register(MvcConfig.class);

        configureDispatcherServlet(servletContext, rootContext);
        EnumSet<DispatcherType> dispatcherTypes = EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD);
        configureCharacterEncodingFilter(servletContext, dispatcherTypes);
        configureCorsFilter(servletContext, dispatcherTypes);
        servletContext.addListener(new ContextLoaderListener(rootContext));
    }

    private void configureDispatcherServlet(ServletContext servletContext, WebApplicationContext rootContext) {
        ServletRegistration.Dynamic dispatcher = servletContext.addServlet(
                DISPATCHER_SERVLET_NAME,
                new DispatcherServlet(rootContext)
        );
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping(DISPATCHER_SERVLET_MAPPING);
        // https://stackoverflow.com/questions/28364564/how-to-catch-spring-pagenotfound-exception-in-dispatcherservlet-context-without
        dispatcher.setInitParameter("throwExceptionIfNoHandlerFound", "true");
    }

    private void configureCharacterEncodingFilter(ServletContext servletContext, EnumSet<DispatcherType> dispatcherTypes) {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding(CHARACTER_ENCODING_FILTER_ENCODING);
        characterEncodingFilter.setForceEncoding(true);
        FilterRegistration.Dynamic characterEncoding = servletContext.addFilter(CHARACTER_ENCODING_FILTER_NAME, characterEncodingFilter);
        characterEncoding.addMappingForUrlPatterns(dispatcherTypes, true, CHARACTER_ENCODING_FILTER_URL_PATTERN);
    }

    private void configureCorsFilter(ServletContext servletContext, EnumSet<DispatcherType> dispatcherTypes) {
        CorsFilter corsFilter = new CorsFilter();
        FilterRegistration.Dynamic cors = servletContext.addFilter(CORS_FILTER_NAME, corsFilter);
        cors.addMappingForUrlPatterns(dispatcherTypes, true, CORS_FILTER_URL_PATTERN);
    }
}
