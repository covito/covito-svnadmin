package com.monsoon.svnadmin.tab;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

public class ParamTag extends TagSupport {
	private static final long serialVersionUID = 1L;
	private String var;
	private String Default;

	public void setPageContext(PageContext pc) {
		super.setPageContext(pc);
		this.var = null;
		this.Default = null;
	}

	public int doStartTag() throws JspException {
		try {
			String p=this.pageContext.getRequest().getParameter(var);
			if (p != null) {
				this.pageContext.getOut().write(p);
			} else if (this.Default != null) {
				this.pageContext.getOut().write(this.Default);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public String getVar() {
		return this.var;
	}

	public void setVar(String var) {
		this.var = var;
	}

	public String getDefault() {
		return this.Default;
	}

	public void setDefault(String default1) {
		this.Default = default1;
	}
}
