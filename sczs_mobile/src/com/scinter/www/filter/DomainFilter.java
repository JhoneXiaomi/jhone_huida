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
				"mbd.sc27800.com",//保定三创
				"mtj.sc27800.com",//天津三创
				"mts.sc27800.com",//唐山三创
				"mlf.sc27800.com",//廊坊三创
				"msjz.sc27800.com",//石家庄三创
				"mty.sc27800.com",//太原三创
				"mhs.sc27800.com",//衡水三创
				"m.sc27800.com", //北京三创
		};
		// 请求的url
		String url = request.getRequestURL().toString();
		//设置默认的session分公司信息
		if(url.contains(domainBranchCompanyArr[0])){
			request.getSession().setAttribute("branchCompany","bdsc");// 保定三创
		}else if(url.contains(domainBranchCompanyArr[1])){
			request.getSession().setAttribute("branchCompany","tjsc");// 天津三创
		}else if(url.contains(domainBranchCompanyArr[2])){
			request.getSession().setAttribute("branchCompany","tssc");// 唐山三创
		}else if(url.contains(domainBranchCompanyArr[3])){
			request.getSession().setAttribute("branchCompany","lfsc");// 廊坊三创
		}else if(url.contains(domainBranchCompanyArr[4])){
			request.getSession().setAttribute("branchCompany","sjzsc");// 石家庄三创
		}else if(url.contains(domainBranchCompanyArr[5])){
			request.getSession().setAttribute("branchCompany","tysc");// 太原三创
		}else if(url.contains(domainBranchCompanyArr[6])){
			request.getSession().setAttribute("branchCompany","hssc");// 衡水三创
		}else if(url.contains(domainBranchCompanyArr[7])){
			request.getSession().setAttribute("branchCompany","bjsc");// 北京三创
		}
		filterChain.doFilter(request, response);
		
	}

}
