package com.rbw.www.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

/**
 * 二级域名请求过滤
 * 
 */
public class DomainFilter extends OncePerRequestFilter {
	
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		// 不拦截的url白名单数组
		String[] domainBranchCompanyArr = new String[] {
				"bd.rbw27900.com", // 保定瑞博文
				"lf.rbw27900.com", // 廊坊瑞博文
				"www.rbw27900.com", // 石家庄瑞博文
				"hs.rbw27900.com", // 衡水瑞博文
				"mbd.rbw27900.com", // 保定瑞博文手机站
				"mlf.rbw27900.com", // 廊坊瑞博文手机站
				"m.rbw27900.com", // 石家庄瑞博文手机站
				"mhs.rbw27900.com", // 衡水瑞博文手机站
				
		};
		// 请求的url
		String url = request.getRequestURL().toString();
		// 检测url包含二级分公司则直接跳转到对应分公司信息页面
		//设置默认的session分公司信息
		if(url.contains(domainBranchCompanyArr[0])){
			request.getSession().setAttribute("branchCompany","bdrbw1");
		}else if(url.contains(domainBranchCompanyArr[1])){
			request.getSession().setAttribute("branchCompany","lfrbw1");
		}else if(url.contains(domainBranchCompanyArr[2])){
			request.getSession().setAttribute("branchCompany","sjzrbw1");
		}else if(url.contains(domainBranchCompanyArr[3])){
			request.getSession().setAttribute("branchCompany","hsrbw1");
		}else if(url.contains(domainBranchCompanyArr[4])){
			request.getSession().setAttribute("branchCompany","bdrbw1");
		}else if(url.contains(domainBranchCompanyArr[5])){
			request.getSession().setAttribute("branchCompany","lfrbw1");
		}else if(url.contains(domainBranchCompanyArr[6])){
			request.getSession().setAttribute("branchCompany","sjzrbw1");
		}else if(url.contains(domainBranchCompanyArr[7])){
			request.getSession().setAttribute("branchCompany","hsrbw1");
		}
		
		filterChain.doFilter(request, response);
		
	}

}
