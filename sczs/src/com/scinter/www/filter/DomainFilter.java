package com.scinter.www.filter;

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
				"bd.sc27800.com", // 保定三创 0
				"tj.sc27800.com",//天津三创1
				"ts.sc27800.com",//唐山三创2
				"lf.sc27800.com",//廊坊三创3
				"yj.sc27800.com",//燕郊三创4
				"sjz.sc27800.com",//石家庄三创5
				"ty.sc27800.com",//太原三创6
				"hs.sc27800.com",//衡水三创7
				"www.sc27800.com", //北京三创8
				"sc27800.com",// 北京三创9
		};
		// 请求的url
		String url = request.getRequestURL().toString();
		//设置默认的session分公司信息
		if(url.contains(domainBranchCompanyArr[0])){
			request.getSession().setAttribute("branchCompany","bdsc");
		}else if(url.contains(domainBranchCompanyArr[1])){
			request.getSession().setAttribute("branchCompany","tjsc");
		}else if(url.contains(domainBranchCompanyArr[2])){
			request.getSession().setAttribute("branchCompany","tssc");
		}else if(url.contains(domainBranchCompanyArr[3])){
			request.getSession().setAttribute("branchCompany","lfsc");
		}else if(url.contains(domainBranchCompanyArr[4])){
			request.getSession().setAttribute("branchCompany","yjsc");
		}else if(url.contains(domainBranchCompanyArr[5])){
			request.getSession().setAttribute("branchCompany","sjzsc");
		}else if(url.contains(domainBranchCompanyArr[6])){
			request.getSession().setAttribute("branchCompany","tysc");
		}else if(url.contains(domainBranchCompanyArr[7])){
			request.getSession().setAttribute("branchCompany","hssc");
		}else if(url.contains(domainBranchCompanyArr[8])){
			request.getSession().setAttribute("branchCompany","bjsc");
		}else if(url.contains(domainBranchCompanyArr[9])){
			request.getSession().setAttribute("branchCompany","tssc");
		}
		filterChain.doFilter(request, response);
		
	}

}
