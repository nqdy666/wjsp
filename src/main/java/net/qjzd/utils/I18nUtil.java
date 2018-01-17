package net.qjzd.utils;

import org.springframework.web.servlet.support.RequestContext;

/**
 * <p>Title: I18nUtil </p>
 * <p>Description: 国际化转换message </p>
 * <p>Copyright: Copyright (c) 2015 </p>
 * <p>Company: ND Websoft Inc. </p>
 * <p>Create Time: 2017年06月16日 </p>
 * @author lianggz
 */
public class I18nUtil {

    public static String getMessage(String key) {
        RequestContext requestContext = new RequestContext(SpringUtil.getRequest());
        return requestContext.getMessage(key);
    }

    public static String getMessage(String key, Object... objects) {
        RequestContext requestContext = new RequestContext(SpringUtil.getRequest());
        return requestContext.getMessage(key, objects);
    }
}