package cn.edu.cdu.practice.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.cdu.practice.utils.ValidateUtils;

/** 
* @author  作者于曦 E-mail: 
* @date 创建时间：2017年4月27日 下午10:07:51 
* @FileName:SqlFilter.java
* @version 1.0 
* @Description:  
* @Author:
* @Modification User:
* @Modification Date:下午10:07:51
*/
@WebFilter(filterName="SqlFilter",urlPatterns={"/*"})
public class SqlFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		//获得所有请求参数名  
		Enumeration<String> params = req.getParameterNames();  
		String sql = "";  
		
		while (params.hasMoreElements()) {  
			//得到参数名  
			String name = params.nextElement().toString();  
			//得到参数对应值  
			String[] value = req.getParameterValues(name);  
			for (int i = 0; i < value.length; i++) {  
				sql = sql + value[i];  
			}  
		}  
		//调用防sql注入的方法
		if (ValidateUtils.validate(sql)) {  
			//跳转到404页面,并打印错误信息
			String errorMessage = "请求附带非法字符，拒绝访问！";
			((HttpServletRequest) request).getSession().setAttribute("ErrorMessage", errorMessage);
			((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getContextPath() + "/404.jsp");
		}else {  
			chain.doFilter(req, res);  
		}  
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
}
