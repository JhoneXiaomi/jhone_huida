package com.scinter.www.controller;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.base.baseController.BaseController;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.CasesExample.Criteria;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.OrderInfo;
import com.scinter.www.model.OrderInfoExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.util.Page;

@Controller
public class NewsController extends BaseController{

	private Logger logger = Logger.getLogger(NewsController.class);

	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private CasesMapper casesMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	
	
	/**
	 * 新闻列表页信息展示
	 * 
	 * @author JhoneZhang
	 * @date   2016年10月28日下午8:09:42
	 * @param page
	 * @param session
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "news/p{page}", method = RequestMethod.GET)
	public ModelAndView caseMessage(@PathVariable("page") int page,HttpSession session, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		
		// 获取公共信息
		super.getPublicMes(session);
		// 获取session 中的 BranchCompany
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany ="bjxz"; 
		}
		int rows = 20;
		if(page<=0){
			page = 1;
		}
		// 新闻信息的获取
		NewsExample newsExample = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
		creNew.andThumbImgNotEqualTo("");
		// 筛选非删除状态的新闻信息
		creNew.andStatusEqualTo(7);
		// 获取分公司的信息
		creNew.andBranchCompanyEqualTo(branchCompany);
		int totalNums = newsMapper.countByExample(newsExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
		newsExample.setOrderByClause("update_time desc");
		List<News> listNew = newsMapper.selectByExample(newsExample);
		List<News> listNews = new ArrayList<News>();
		
			for(News mynews:listNew){
				
				if(StringUtils.isNotBlank(branchCompany)){
					
					String html = mynews.getContents();
					Document doc = Jsoup.parse(html);
					mynews.setContents(doc.text());
				}
				listNews.add(mynews);
			}
			
		// 获取订单总数
		OrderInfoExample oe = new OrderInfoExample();
		com.scinter.www.model.OrderInfoExample.Criteria oc =  oe.createCriteria();
		oc.andStatusEqualTo(1);
		oc.andBranchCompanyEqualTo(branchCompany);
		Integer orderNumber = orderInfoMapper.countByExample(oe);
		

        // 订单详情最新推送
        OrderInfoExample orderInfoExample =  new OrderInfoExample();
        com.scinter.www.model.OrderInfoExample.Criteria orderC = orderInfoExample.createCriteria();
        orderC.andStatusNotEqualTo(3);
        orderC.andAcreageNotEqualTo("");
        orderC.andClientNameNotEqualTo("");
        orderC.andPhoneNotEqualTo("");
        orderInfoExample.setOrderByClause("create_time desc");
        orderC.andBranchCompanyEqualTo(branchCompany);
        List<OrderInfo> orders = orderInfoMapper.selectByExample(orderInfoExample);
        
        /*获取SEO 的配置信息*/
        // SEO 标题信息
        SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_spe_seoTitle_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig speSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	speSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_spe_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig speSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	
        	speSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_spe_seoDesc_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig speSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	speSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        
        // 推荐案例
        CasesExample casesExample = new CasesExample();
        Criteria cce = casesExample.createCriteria();
        cce.andBranchCompanyEqualTo(branchCompany);
        cce.andCaseStatusEqualTo(1);
        cce.andCaseThumbImgNotEqualTo("");
        List<Cases> listCases = casesMapper.selectByExample(casesExample);
        
        model.addObject("listCases", listCases);
        model.addObject("speSeoTitleStr", speSeoTitleStr);
        model.addObject("speSeoKeywordStr", speSeoKeywordStr);
        model.addObject("speSeoDescStr", speSeoDescStr);
        model.addObject("orders", orders);
		session.setAttribute("branchCompany",branchCompany);
		model.addObject("orderNumber",orderNumber);
		model.addObject("page", p);
		model.addObject("listNews", listNews);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/news");
		return model;
	}
	
	/**
	 * 新闻的详细的信息展示
	 * @author JhoneZhang
	 * @date   2016年8月23日下午12:05:37
	 * @param type						装修新闻的类型值
	 * @param newsId					新闻的ID 值
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("newsDetail")
	public ModelAndView newDetail(
			@RequestParam("newsId") Integer newsId,
			HttpSession session, HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		// 获取公共信息
		super.getPublicMes(session);
		ModelAndView model = new ModelAndView();
		// 获取session 中的 BranchCompany
		String branchCompany	= (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany ="bjxz"; 
		}
		// 获取当前的新闻信息
	    News news =  newsMapper.selectByPrimaryKey(newsId);
		/*获取案例排行榜的信息*/
        CasesExample activityCases = new CasesExample();
        com.scinter.www.model.CasesExample.Criteria ac = activityCases.createCriteria();
        ac.andCaseStatusNotEqualTo(3);
        if(StringUtils.isNotBlank(branchCompany)){
        	ac.andBranchCompanyEqualTo(branchCompany);
		}
        List<Cases> aCasesList= casesMapper.selectByExample(activityCases);
        
        // 订单详情最新推送
        OrderInfoExample orderInfoExample =  new OrderInfoExample();
        com.scinter.www.model.OrderInfoExample.Criteria orderC = orderInfoExample.createCriteria();
        orderC.andStatusNotEqualTo(3);
        orderC.andAcreageNotEqualTo("");
        orderC.andClientNameNotEqualTo("");
        orderC.andPhoneNotEqualTo("");
        orderInfoExample.setOrderByClause("create_time desc");
        orderC.andBranchCompanyEqualTo(branchCompany);
        List<OrderInfo> orders = orderInfoMapper.selectByExample(orderInfoExample);
        
    	// 获取订单总数
		OrderInfoExample oe = new OrderInfoExample();
		com.scinter.www.model.OrderInfoExample.Criteria oc =  oe.createCriteria();
		oc.andStatusEqualTo(1);
		oc.andBranchCompanyEqualTo(branchCompany);
		Integer orderNumber = orderInfoMapper.countByExample(oe);
        
		model.addObject("orderNumber", orderNumber);
        model.addObject("orders", orders);
        session.setAttribute("branchCompany",branchCompany);
        model.addObject("aCasesList", aCasesList);
		model.addObject("news", news);
		model.setViewName("/www/newsDetail");
		return model;
	}
}
