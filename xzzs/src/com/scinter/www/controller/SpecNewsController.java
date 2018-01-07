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
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.NewsExample.Criteria;
import com.scinter.www.util.Page;
@Controller
public class SpecNewsController extends BaseController{

	private Logger logger = Logger.getLogger(SpecNewsController.class);
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	/**
	 * 行业资讯
	 * @author JhoneZhang
	 * @date   2016年9月2日下午12:17:19
	 * @param page
	 * @param response
	 * @param request
	 * @param session
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "industry/p{page}", method = RequestMethod.GET)
	public ModelAndView industry(
			@PathVariable("page") int page,
			@RequestParam(value="title",required=false)String title,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		// 获取公共信息
		super.getPublicMes(session);
		int rows = 6;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
		ModelAndView model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andThumbImgNotEqualTo("");
		criteria.andStatusEqualTo(7);
		criteria.andTypeEqualTo("行业资讯");
		if(StringUtils.isNotBlank(title)){
			title = new String(title.getBytes("ISO-8859-1"),"utf-8");
			criteria.andTitleLike("%"+title+"%");
		}
	    if(StringUtils.isNotBlank(branchCompany)){
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjxz";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
		int totalNums =newsMapper.countByExample(newsExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
		newsExample.setOrderByClause("create_time desc");
		List<News> newsLists = newsMapper.selectByExample(newsExample);
		List<News> newsList = new ArrayList<News>();
		for(News mynews:newsLists){
			if(null !=mynews.getContents() && mynews.getContents().length()>0 ){
				String html = mynews.getContents();
				Document doc =Jsoup.parse(html);
				mynews.setContents( doc.text());
			}
			newsList.add(mynews);
		}

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
        model.addObject("speSeoTitleStr", speSeoTitleStr);
        model.addObject("speSeoKeywordStr", speSeoKeywordStr);
        model.addObject("speSeoDescStr", speSeoDescStr);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("newsList", newsList);
		model.addObject("totalNums",totalNums);
		model.addObject("page", p);
		model.setViewName("/www/industry");
		return model;
	}
	
	
	/**
	 * 装修攻略
	 * @author JhoneZhang
	 * @date   2016年9月2日下午12:17:19
	 * @param page
	 * @param response
	 * @param request
	 * @param session
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "decorateStrategy/p{page}", method = RequestMethod.GET)
	public ModelAndView decorateStrategy(
			@PathVariable("page") int page,
			@RequestParam(value="title",required=false)String title,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		// 获取公共信息
		super.getPublicMes(session);
		int rows = 6;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
		ModelAndView model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andThumbImgNotEqualTo("");
		criteria.andStatusEqualTo(7);
		criteria.andTypeEqualTo("装修攻略");
		if(StringUtils.isNotBlank(title)){
			title = new String(title.getBytes("ISO-8859-1"),"utf-8");
			criteria.andTitleLike("%"+title+"%");
		}
	    if(StringUtils.isNotBlank(branchCompany)){
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjxz";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
		int totalNums =newsMapper.countByExample(newsExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
		newsExample.setOrderByClause("create_time desc");
		List<News> newsLists = newsMapper.selectByExample(newsExample);
		List<News> newsList = new ArrayList<News>();
		for(News mynews:newsLists){
			if(null !=mynews.getContents() && mynews.getContents().length()>0 ){
				String html = mynews.getContents();
				Document doc =Jsoup.parse(html);
				mynews.setContents( doc.text());
			}
			newsList.add(mynews);
		}

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
        model.addObject("speSeoTitleStr", speSeoTitleStr);
        model.addObject("speSeoKeywordStr", speSeoKeywordStr);
        model.addObject("speSeoDescStr", speSeoDescStr);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("newsList", newsList);
		model.addObject("totalNums",totalNums);
		model.addObject("page", p);
		model.setViewName("/www/decorateStrategy");
		return model;
	}
	

	/**
	 * 家装日记
	 * @author JhoneZhang
	 * @date   2016年9月2日下午12:17:19
	 * @param page
	 * @param response
	 * @param request
	 * @param session
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "domesticOutfit/p{page}", method = RequestMethod.GET)
	public ModelAndView domesticOutfit(
			@PathVariable("page") int page,
			@RequestParam(value="title",required=false)String title,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		// 获取公共信息
		super.getPublicMes(session);
		int rows = 6;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
		ModelAndView model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andThumbImgNotEqualTo("");
		criteria.andStatusEqualTo(7);
		criteria.andTypeEqualTo("家装日记");
		if(StringUtils.isNotBlank(title)){
			title = new String(title.getBytes("ISO-8859-1"),"utf-8");
			criteria.andTitleLike("%"+title+"%");
		}
	    if(StringUtils.isNotBlank(branchCompany)){
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjxz";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
		int totalNums =newsMapper.countByExample(newsExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
		newsExample.setOrderByClause("create_time desc");
		List<News> newsLists = newsMapper.selectByExample(newsExample);
		List<News> newsList = new ArrayList<News>();
		for(News mynews:newsLists){
			if(null !=mynews.getContents() && mynews.getContents().length()>0 ){
				String html = mynews.getContents();
				Document doc =Jsoup.parse(html);
				mynews.setContents( doc.text());
			}
			newsList.add(mynews);
		}

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
        model.addObject("speSeoTitleStr", speSeoTitleStr);
        model.addObject("speSeoKeywordStr", speSeoKeywordStr);
        model.addObject("speSeoDescStr", speSeoDescStr);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("newsList", newsList);
		model.addObject("totalNums",totalNums);
		model.addObject("page", p);
		model.setViewName("/www/domesticOutfit");
		return model;
	}
	

	
}
