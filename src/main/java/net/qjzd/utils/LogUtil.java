package net.qjzd.utils;

import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;

import java.util.List;

/**
 * 系统业务日志
 */
public final class LogUtil {

	public static void exceptionLog(Logger log,Exception e){
		if(e==null)
			return;
		StringBuffer str = new StringBuffer(e.getClass().getName());
		str.append(":").append(e.getMessage());
		StackTraceElement[] stack = e.getStackTrace();
		for(StackTraceElement ee:stack){
			str.append("\n").append(ee.toString());
		}
		log.error(str.toString());
		e.printStackTrace();
	}
	
	public static String exceptionLog(Throwable t) {
		if(t == null)
			return "";
		StringBuffer str = new StringBuffer(t.getClass().getName());
		str.append(":").append(t.getMessage());
		StackTraceElement[] stack = t.getStackTrace();
		for(StackTraceElement ee:stack){
			str.append("\n").append(ee.toString());
		}
		Logger.getRootLogger().error(str.toString());
		return str.toString();
	}
	
	public static String exceptionLog(Exception e) {
		if(e == null)
			return "";
		StringBuffer str = new StringBuffer(e.getClass().getName());
		str.append(":").append(e.getMessage());
		StackTraceElement[] stack = e.getStackTrace();
		for(StackTraceElement ee:stack){
			str.append("\n").append(ee.toString());
		}
		Logger.getRootLogger().error(str.toString());
		return str.toString();
	}
	
	public static void debugLog(String info) {
		Logger.getRootLogger().debug(info);
	}
	
	/*******网上营业厅新增********/
	
	public static void infoLog(Class<?> theme, String info) {
		LogFactory.getLog(theme).info(info);
	}

	public static void infoLog(Class<?> theme, Object[] infos) {
		for (int i = 0; i < infos.length; i++) {
			LogFactory.getLog(theme).info(infos[i]);
		}
	}

	public static void infoLog(Class<?> theme, List<Object> infos) {
		for (int i = 0; i < infos.size(); i++) {
			LogFactory.getLog(theme).info(infos.get(i));
		}
	}
	
	public static void infoLog(String info) {
		Logger.getRootLogger().info(info);
	}
	
	public static void errorLog(Class<?> theme, String info) {
		LogFactory.getLog(theme).error(info);
	}
	
	public static void errorLog(Class<?> theme, String info, Exception e) {
		LogFactory.getLog(theme).error(info, e);
	}
}
