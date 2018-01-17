package net.qjzd.utils;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 * spring工具
 * 
 * @author nianqin
 */
public class SpringUtil {

	public static WebApplicationContext context = null;

	public static void getInstance(ServletContext sc) {
		context = (WebApplicationContext) sc
				.getAttribute("org.springframework.web.servlet.FrameworkServlet.CONTEXT.springWebDispatcherServlet");
	}

	public static Object getBean(String beanName) {
		if (context == null) {
			return null;
		}
		return context.getBean(beanName);
	}
	
	public static HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}
}
