package net.qjzd.utils;

import org.springframework.util.Assert;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2016  </p>
 * <p>Company:ND Co., Ltd.  </p>
 * <p>Create Time: 2017/6/21 </p>
 *
 * @author nianqin
 */
public class ReflectUtils {

    /**
     * 查找方法，方法需要包含特定的注解
     * @param clazz
     * @param name
     * @param annotationType
     * @return
     */
    public static Method findMethod(Class<?> clazz, String name, Class<? extends Annotation> annotationType) {
        Assert.notNull(clazz, "Class must not be null");
        Assert.notNull(name, "Method name must not be null");
        Class<?> searchType = clazz;
        while (searchType != null) {
            Method[] methods = (searchType.isInterface() ? searchType.getMethods() : searchType.getDeclaredMethods());
            for (Method method : methods) {
                if (name.equals(method.getName()) && annotationType != null) {
                    Annotation[] annotations = method.getDeclaredAnnotations();
                    for (int i = 0; i < annotations.length; i++) {
                        if (annotations[i].annotationType() == annotationType) {
                            return method;
                        }
                    }
                }
            }
            searchType = searchType.getSuperclass();
        }
        return null;
    }

    /**
     * 类是否包含某一个注解
     * @param clazz
     * @param annotationType
     * @return
     */
    public static Boolean hasAnnotatioin(Class<?> clazz, Class<? extends Annotation> annotationType) {
        Assert.notNull(clazz, "Class must not be null");
        Class<?> searchType = clazz;
        while (searchType != null) {
            Annotation[] annotations = searchType.getAnnotations();
            for (int i = 0; i < annotations.length; i++) {
                if (annotations[i].annotationType() == annotationType) {
                    return true;
                }
            }
            searchType = searchType.getSuperclass();
        }
        return false;
    }
}
