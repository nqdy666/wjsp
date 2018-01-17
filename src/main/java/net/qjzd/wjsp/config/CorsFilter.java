package net.qjzd.wjsp.config;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2016  </p>
 * <p>Company:ND Co., Ltd.  </p>
 * <p>Create Time: 2017/6/19 </p>
 *
 * @author nianqin
 */
public class CorsFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        servletResponse.setHeader("Access-Control-Allow-Origin", "*");
        servletResponse.setHeader("Access-Control-Allow-Methods", "GET, POST, HEAD, OPTIONS, PUT, DELETE, TRACE, PATCH");
        servletResponse.setHeader("Access-Control-Max-Age", "3600");
        // Authorization是做了oauth2登录响应所必须的
        servletResponse.setHeader("Access-Control-Allow-Headers", "Origin, Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers, Authorization, Cache-control, Orgname");
        // 表示允许cookies
        servletResponse.setHeader("Access-Control-Allow-Credentials","true");
        chain.doFilter(request, servletResponse);
    }

    @Override
    public void destroy() {
    }
}
