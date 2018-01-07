package com.scinter.www.controller;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
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
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.OrderInfo;
import com.scinter.www.model.OrderInfoExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.NewsExample.Criteria;
import com.scinter.www.util.Page;


@Controller
public class ActivityController extends BaseController{

	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	
	@RequestMapping(value = "activity/p{page}", method = RequestMethod.GET)
	public ModelAndView huoDongMessage(
			@PathVariable("page") int page,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		// 获取公共信息
		super.getPublicMes(session);
		int rows = 3;
		if(page<=0){
			page = 1;
		}
		ModelAndView model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andThumbImgNotEqualTo("");
		criteria.andStatusEqualTo(8);
		criteria.andBranchCompanyEqualTo(branchCompany);
		int totalNums =newsMapper.countByExample(newsExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
		newsExample.setOrderByClause("update_time desc");
		List<News> newsLists = newsMapper.selectByExample(newsExample);
		List<News> newsList = new ArrayList<News>();
		for(News mynews:newsLists){
			if(StringUtils.isNotBlank(mynews.getContents())){
				String html = mynews.getContents();
				Document doc =Jsoup.parse(html);
				mynews.setContents( doc.text());
			}
			newsList.add(mynews);
		}
			
        // SEO 标题信息
        SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_news_seoDesc_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
  		criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
        SysConfig newsSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0)
        	newsSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
	        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_news_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
  		criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
        SysConfig newsSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0)
        	newsSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
	        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_news_seoTitle_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
  		criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
        SysConfig newsSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0)
        	newsSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
	        
        model.addObject("newsSeoDescStr", newsSeoDescStr);
        model.addObject("newsSeoKeywordStr", newsSeoKeywordStr);
        model.addObject("newsSeoTitleStr", newsSeoTitleStr);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("newsList", newsList);
		model.addObject("page", p);
		model.setViewName("/www/activity");
		return model;
	}
	
	/**
	 * 
	 * 活动详情页
	 * 
	 * @author JhoneZhang
	 * @date   2016年11月6日上午8:58:53
	 * @param newsId
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("activityDetail")
	public ModelAndView activityDetail(
			@RequestParam("activityId") Integer newsId,
			HttpSession session, HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		// 获取公共信息
		super.getPublicMes(session);
		ModelAndView model = new ModelAndView();
		// 获取session 中的 BranchCompany
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany ="bjxz"; 
		// 获取当前的新闻信息
	    News news =  newsMapper.selectByPrimaryKey(newsId);
        
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
		model.addObject("news", news);
		
		String str = news.getContents();
		Document doc = null;
		if(StringUtils.isNotBlank(str)){
			doc = Jsoup.parse(str);
			str = doc.text();
		}
		if(StringUtils.isNotBlank(str)){
			model.setViewName("/www/activityDetailtwo");
		}else{
			model.setViewName("/www/activityDetail");
		}
		
		return model;
	}
	
	
	
 
}
