package com.scinter.www.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * 二级域名请求过滤
 * 
 */
public class DomainFilter extends OncePerRequestFilter {
	
	private Logger logger = Logger.getLogger(DomainFilter.class);
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		// 不拦截的url白名单数组
		String[] domainBranchCompanyArr = new String[] {
				"m.xz27800.com",//北京新洲手机站 0
                "mbd.xz27800.com",//保定新洲手机站1
                "m.xzzstj.com",//天津新洲手机站2
                "msjz.xz27800.com",// 石家庄新洲3
                "mty.xz27800.com",// 太原新洲手机站4
				"mlf.xz27800.com",//廊坊新洲手机站5
				"mts.xz27800.com",//唐山新洲手机站6
				"mcz.xz27800.com",// 沧州新洲手机站7
				"m.0531zhuangshi.com",// 济南新洲手机站8
				"mhf.xz27800.com",//合肥新洲手机站9
				"mzz.xz27800.com",// 郑州新洲手机站10
				"mcq.xz27800.com",// 重庆新洲手机站11
				"m.xz37800.com",// 石家庄新洲12
				"mhs.xz27800.com",// 衡水新洲13
				"mtj.xz27800.com" // 天津新洲
				
	};
		// 请求的url
		String url = request.getRequestURL().toString();
		// 检测url包含二级分公司则直接跳转到对应分公司信息页面
		
		//设置默认的session分公司信息
				if(url.contains(domainBranchCompanyArr[0])){
					request.getSession().setAttribute("branchCompany","bjxz");
				}else if( url.contains(domainBranchCompanyArr[1])){
					request.getSession().setAttribute("branchCompany","bdxz");
				}else if( url.contains(domainBranchCompanyArr[2]) || url.contains(domainBranchCompanyArr[14])){
					request.getSession().setAttribute("branchCompany","tjxz");
				}else if( url.contains(domainBranchCompanyArr[3]) || url.contains(domainBranchCompanyArr[12])){
					request.getSession().setAttribute("branchCompany","sjzxz");
				}else if( url.contains(domainBranchCompanyArr[4])){
					request.getSession().setAttribute("branchCompany","tyxz");
				}else if( url.contains(domainBranchCompanyArr[5])){
					request.getSession().setAttribute("branchCompany","lfxz");
				}else if( url.contains(domainBranchCompanyArr[6])){
					request.getSession().setAttribute("branchCompany","tsxz");
				}else if( url.contains(domainBranchCompanyArr[7])){
					request.getSession().setAttribute("branchCompany","czxz");
				}else if( url.contains(domainBranchCompanyArr[8])){
					request.getSession().setAttribute("branchCompany","jnxz");
				}else if( url.contains(domainBranchCompanyArr[9])){
					request.getSession().setAttribute("branchCompany","hfxz");
				}else if( url.contains(domainBranchCompanyArr[10])){
					request.getSession().setAttribute("branchCompany","zzxz");
				}else if( url.contains(domainBranchCompanyArr[11])){
					request.getSession().setAttribute("branchCompany","cqxz");
				}else if( url.contains(domainBranchCompanyArr[13])){
					request.getSession().setAttribute("branchCompany","hsxz");
				}
				filterChain.doFilter(request, response);
		
	}

}
