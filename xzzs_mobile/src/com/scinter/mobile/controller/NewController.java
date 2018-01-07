package com.scinter.mobile.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scinter.mBase.controller.MbaseController;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.NewsExample.Criteria;
import com.scinter.www.util.Page;


@Controller
public class NewController extends MbaseController{

	private Logger logger = Logger.getLogger(MhotBuildingController.class);
	@Autowired
	private NewsMapper newsMapper;
    @Autowired
    private SysConfigMapper sysConfigMapper;
	
	/**
	 * 装修攻略
	 * 
	 * @author JhoneZhang
	 * @date   2016年11月18日上午8:42:59
	 * @param page
	 * @param NewsNum
	 * @param response
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "MdecStrategy/p{page}")
	public ModelAndView decStrategy(@PathVariable("page") int page,HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		
	    /*获取共有的信息*/
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
		
		// 分页的基本信息
		int rows = 30;
		if(page<=0){
			page = 1;
		}
		// 获取session 中的 BranchCompany
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andStatusEqualTo(7);
		criteria.andBranchCompanyEqualTo(branchCompany);
		criteria.andContentsNotEqualTo("");
		criteria.andTypeEqualTo("装修攻略");
	    int totalNums = newsMapper.countByExample(newsExample);
	    Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
		newsExample.setOrderByClause("create_time desc");
		List<News> newsLists = newsMapper.selectByExample(newsExample);
		List<News> newsAll = new ArrayList<News>();
		for(News mynews:newsLists){
			String html = mynews.getContents();
			Document doc = null;
			if(StringUtils.isNotBlank(html)){
				
				 doc =Jsoup.parse(html);
				 mynews.setContents(doc.text());
			}
			newsAll.add(mynews);
		}
		
		
		/*获取SEO 的配置信息*/
        // SEO 标题信息
        SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_news_seoDesc_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	newsSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_news_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	
        	newsSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_news_seoTitle_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	newsSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        model.addObject("newsSeoDescStr", newsSeoDescStr);
        model.addObject("newsSeoKeywordStr", newsSeoKeywordStr);
        model.addObject("newsSeoTitleStr", newsSeoTitleStr);
		session.setAttribute("branchCompany", branchCompany);
		model.addObject("page", p);
		model.addObject("newsList", newsAll);
	    model.addObject("totalNums", totalNums);
		model.setViewName("/mobile/decStrategy");
		return model;
	}
	/**
	 * 新闻的详细的信息展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping("MdecStrategyDetail")
	public ModelAndView decStrategyDetail(
			@RequestParam("newsId") Integer newsId,HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		
		News news =  newsMapper.selectByPrimaryKey(newsId);
		NewsExample newsExampleLast= new NewsExample();
		com.scinter.www.model.NewsExample.Criteria criteria = newsExampleLast.createCriteria();
		criteria.andStatusNotEqualTo(3);
		newsExampleLast.setOrderByClause("news_id desc");
		
		model.addObject("news", news);
		model.setViewName("/mobile/decStrategyDetail");
		return model;
		
	}
	
	/**
	 * 装修新闻
	 * 
	 * @author JhoneZhang
	 * @date   2016年11月18日上午9:40:56
	 * @param page
	 * @param response
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "Mnews/p{page}")
	public ModelAndView familyDiary(@PathVariable("page") int page, HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
		int rows = 20;
		if(page<=0){
			page = 1;
		}
		// 获取session 中的 BranchCompany
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andStatusEqualTo(7);
	    criteria.andBranchCompanyEqualTo(branchCompany);
	    criteria.andContentsNotEqualTo("");
	    int totalNums = newsMapper.countByExample(newsExample);
	    Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
		newsExample.setOrderByClause("create_time desc");
		List<News> newsLists = newsMapper.selectByExample(newsExample);
		List<News> newsAll = new ArrayList<News>();
		for(News mynews:newsLists){
			String html = mynews.getContents();
			Document doc =Jsoup.parse(html);
			mynews.setContents( doc.text());
			newsAll.add(mynews);
		}
		
		
		/*获取SEO 的配置信息*/
        // SEO 标题信息
        SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_news_seoDesc_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	newsSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_news_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	
        	newsSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_news_seoTitle_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	newsSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        model.addObject("newsSeoDescStr", newsSeoDescStr);
        model.addObject("newsSeoKeywordStr", newsSeoKeywordStr);
        model.addObject("newsSeoTitleStr", newsSeoTitleStr);
		session.setAttribute("branchCompany", branchCompany);
		model.addObject("page", p);
		model.addObject("newsList", newsAll);
	    model.addObject("totalNums", totalNums);
		model.setViewName("/mobile/news");
		return model;
	}
	
	@RequestMapping("MnewsDetail")
	public ModelAndView familyDiaryDetail(
			@RequestParam("newsId") Integer newsId,HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
		// 获取session 中的 BranchCompany
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany = "bjxz";
		News news =  newsMapper.selectByPrimaryKey(newsId);
		
		model.addObject("news", news);
		model.setViewName("/mobile/newsDetail");
		return model;
		
	}
}
