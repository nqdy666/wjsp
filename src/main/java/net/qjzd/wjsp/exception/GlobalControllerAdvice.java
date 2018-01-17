package net.qjzd.wjsp.exception;

import net.qjzd.utils.RequestUtils;
import net.qjzd.utils.I18nUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.http.HttpServletResponse;


/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2016  </p>
 * <p>Company:ND Co., Ltd.  </p>
 * <p>Create Time: 2017/6/12 </p>
 *
 * @author nianqin
 */
@ControllerAdvice
public class GlobalControllerAdvice {

    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String notFoundExceptionHandler(NoHandlerFoundException e, WebRequest request, HttpServletResponse response) {
        if (RequestUtils.isTextHtmlRequest(request)
                && !RequestUtils.isControllerReturnJsonAction(e.getStackTrace())) {
            return "index/index";
        }
        ResponseEntity<ErrorMessage> entity = new ResponseEntity<>(
                new ErrorMessage(ErrorCode.URI_NOT_FOUND.getCode(),
                    I18nUtil.getMessage(ErrorCode.URI_NOT_FOUND.getCode()),
                    e.getMessage()),
                HttpStatus.NOT_FOUND);
        RequestUtils.write(response, entity);
        return null;
    }

    @ExceptionHandler()
    public String defaultErrorHandler(Exception e, WebRequest request, HttpServletResponse response) {
        if (RequestUtils.isTextHtmlRequest(request)
                && !RequestUtils.isControllerReturnJsonAction(e.getStackTrace())) {
            return "error";
        }
        ResponseEntity<ErrorMessage> entity = new ResponseEntity<>(
                new ErrorMessage(ErrorCode.INTERNAL_SERVER_ERROR.getCode(),
                        I18nUtil.getMessage(ErrorCode.INTERNAL_SERVER_ERROR.getCode()),
                    e.getMessage()),
                HttpStatus.INTERNAL_SERVER_ERROR);
        RequestUtils.write(response, entity);
        return null;
    }
}
