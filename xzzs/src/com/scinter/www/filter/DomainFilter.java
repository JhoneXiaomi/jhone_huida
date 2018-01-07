package com.scinter.www.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
				
				"www.xz27800.com", //北京新洲0
				"bd.xz27800.com",//保定新洲1
				"www.xzzstj.com",//天津新洲2
				"sjz.xz27800.com",//石家庄新洲3
				"ty.xz27800.com",// 太原新洲4
				"lf.xz27800.com",//廊坊新洲5
				"ts.xz27800.com",//唐山新洲6
				"cz.xz27800.com",// 沧州新洲7
				"www.0531zhuangshi.com",// 济南新洲8
				"hf.xz27800.com",//合肥新洲9
				"zz.xz27800.com",// 郑州新洲10
				"cq.xz27800.com",// 重庆新洲11
				"tj.xz27800.com", //天津新洲12
				"www.xz37800.com",//石家庄新洲13
				"xzzstj.com",//天津新洲14
				"hs.xz27800.com"//衡水新洲15
			};
		// 请求的url
		String url = request.getRequestURL().toString();
		// 检测url包含二级分公司则直接跳转到对应分公司信息页面
		
		//设置默认的session分公司信息
		if(url.contains(domainBranchCompanyArr[0])){
			request.getSession().setAttribute("branchCompany","bjxz");
		}else if( url.contains(domainBranchCompanyArr[1])){
			request.getSession().setAttribute("branchCompany","bdxz");
		}else if( url.contains(domainBranchCompanyArr[2])){
			request.getSession().setAttribute("branchCompany","tjxz");
		}else if(url.contains(domainBranchCompanyArr[3]) ||url.contains(domainBranchCompanyArr[13])){
			request.getSession().setAttribute("branchCompany","sjzxz");
		}else if(url.contains(domainBranchCompanyArr[4])){
			request.getSession().setAttribute("branchCompany","tyxz");
		}else if( url.contains(domainBranchCompanyArr[5])){
			request.getSession().setAttribute("branchCompany","lfxz");
		}else if(url.contains(domainBranchCompanyArr[6])){
			request.getSession().setAttribute("branchCompany","tsxz");
		}else if(url.contains(domainBranchCompanyArr[7])){
			request.getSession().setAttribute("branchCompany","czxz");
		}else if(url.contains(domainBranchCompanyArr[8])){
			request.getSession().setAttribute("branchCompany","jnxz");
		}else if(url.contains(domainBranchCompanyArr[9])){
			request.getSession().setAttribute("branchCompany","hfxz");
		}else if(url.contains(domainBranchCompanyArr[10])){
			request.getSession().setAttribute("branchCompany","zzxz");
		}else if(url.contains(domainBranchCompanyArr[11])){
			request.getSession().setAttribute("branchCompany","cqxz");
		}else if(url.contains(domainBranchCompanyArr[12])||url.contains(domainBranchCompanyArr[14])){
			request.getSession().setAttribute("branchCompany","tjxz");
		}else if(url.contains(domainBranchCompanyArr[15])){
			request.getSession().setAttribute("branchCompany","hsxz");
		}
		filterChain.doFilter(request, response);
		
	}

}
