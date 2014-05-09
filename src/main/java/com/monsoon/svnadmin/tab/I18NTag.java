package com.monsoon.svnadmin.tab;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.svnadmin.util.I18N;

public class I18NTag extends BodyTagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	public int doStartTag() throws JspException {
		return EVAL_BODY_AGAIN;
	}
	
	public int doAfterBody() throws JspException {
		HttpServletRequest request=(HttpServletRequest) this.pageContext.getRequest();
		String str = I18N.getLbl(request, id, getBodyContent().getString().trim());
		try {
			getPreviousOut().write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	

}
