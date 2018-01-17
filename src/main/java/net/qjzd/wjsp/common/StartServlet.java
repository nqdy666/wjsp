package net.qjzd.wjsp.common;

import net.qjzd.utils.SpringUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class StartServlet extends HttpServlet {

	private static final long serialVersionUID = -6562937892680056788L;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		SpringUtil.getInstance(this.getServletContext());
	}

}
