package net.qjzd.utils;

import com.alibaba.fastjson.JSON;
import net.qjzd.wjsp.exception.ErrorMessage;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
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
public class RequestUtils {

    /**
     * 写请求
     * @param response
     * @param entity
     */
    public static void write(HttpServletResponse response, ResponseEntity<ErrorMessage> entity) {
        response.setStatus(entity.getStatusCode().value());
        response.setContentType("application/json;charset=UTF-8");
        try {
            PrintWriter writer = response.getWriter();
            writer.print(JSON.toJSONString(entity.getBody()));
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 通过头部的accept的，如果带有text/html
     * @param request
     * @return
     */
    public static Boolean isTextHtmlRequest(WebRequest request) {
        String accept = String.valueOf(request.getHeader("Accept"));
        return accept.indexOf("text/html") >= 0;
    }

    /***
     * 判断controller是否含有注解RestController或者方法是否含有注解ResponseBody
     * @param stackTraceElement
     * @return
     */
    public static boolean isControllerReturnJsonAction(StackTraceElement stackTraceElement) {
        String className = stackTraceElement.getClassName();
        if (className.endsWith("Controller")) {
            try {
                Class controllerClass = Class.forName(className);
                if (ReflectUtils.hasAnnotatioin(controllerClass, RestController.class)) {
                    return true;
                }
                Method actionMethod = ReflectUtils.findMethod(controllerClass, stackTraceElement.getMethodName(), ResponseBody.class);
                if (null != actionMethod) {
                    return true;
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    /***
     * 判断接口的注解是否是ResponseBody,是,那么返回json,而不是跳转错误页面<br />
     * 限制最多循环10次,否则影响性能
     * @param stackTraceElements
     * @return
     */
    public static boolean isControllerReturnJsonAction(StackTraceElement[] stackTraceElements) {
        int length = stackTraceElements.length;
        for (int i = 0; i < length; i++) {
            StackTraceElement stackTraceElement = stackTraceElements[i];
            if (isControllerReturnJsonAction(stackTraceElement)) {
                return true;
            }
        }
        return false;
    }
}
