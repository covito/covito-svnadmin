package com.monsoon.svnadmin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.svnadmin.entity.PjAuth;
import org.svnadmin.entity.Usr;
import org.svnadmin.servlet.BaseServlet;

/**
 * 用户
 * 
 * @author <a href="mailto:yuanhuiwu@gmail.com">Huiwu Yuan</a>
 * @since 3.0
 */
public class UsrAuthServlet extends BaseServlet {

	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 5448367307094487885L;

	@Override
	protected void get(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("entity",
				usrService.get(request.getParameter("usr")));
	}

	
	@Override
	protected void list(HttpServletRequest request, HttpServletResponse response) {
		boolean hasAdminRight = hasAdminRight(request);
		request.setAttribute("hasAdminRight", hasAdminRight);

		Usr sessionUsr = getUsrFromSession(request);
		if (!hasAdminRight) {
			request.setAttribute("entity", sessionUsr);
		}
		//查看用户权限
		String usr = request.getParameter("usr");
		if(StringUtils.isBlank(usr)){
			usr = sessionUsr.getUsr();
		}
		boolean hasUsr = StringUtils.isNotBlank(usr);
		if (hasUsr) {
			List<PjAuth> auths = usrService.getAuths(usr);
			request.setAttribute("auths", auths);
		}
	}

	@Override
	protected void forword(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		request.getRequestDispatcher("usrauth.jsp").forward(request, response);
	}

}
