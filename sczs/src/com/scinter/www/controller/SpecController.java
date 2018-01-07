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

import com.base.controller.BaseController;
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
public class SpecController extends BaseController{

	private Logger logger = Logger.getLogger(SpecController.class);
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	/**
	 * 热门活动列表页信息的展示
	 * @param page			当前的页码
	 * @param response		用于动态响应客户端请示
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "spec/p{page}", method = RequestMethod.GET)
	public ModelAndView huoDongMessage(@PathVariable("page") int page,
			@RequestParam("type")String type,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		/*配置共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		String myType= new String(request.getParameter("type").getBytes("iso-8859-1"),"UTF-8");
		int rows = 16;//每页显示4条数据
		if(page<=0){
			page = 1;
		}
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
//		判断type的类型，将type 添加为查询的条件，将"将热门活动"除去
		if(!myType.equals("热门活动")){
			criteria.andTypeEqualTo(myType);
		}
//		过滤热门活动展示图片为空的新闻展示
		criteria.andThumbImgNotEqualTo("");
//		非删除状态的活动的信息
		criteria.andStatusEqualTo(4);
//      获取分公司的信息
	    if(StringUtils.isNotBlank(myBranchCompany)){
	    	
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}
		int totalNums =newsMapper.countByExample(newsExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
//		排序	
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
//		活动信息列表的获取
		NewsExample newsExample2 = new NewsExample();
		Criteria creNew = newsExample2.createCriteria();
//		筛选非删除状态的活动信息
		creNew.andStatusEqualTo(4);
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
	    	creNew.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			creNew.andBranchCompanyEqualTo(myBranchCompany);
		}
		List<News> listNews2 = newsMapper.selectByExample(newsExample2);
		/*获取案例列表页SEO 的配置信息*/
      
      // SEO 标题信息
      SysConfigExample scinterNewsSeoTitleStrE = new SysConfigExample();
      com.scinter.www.model.SysConfigExample.Criteria scinterNewsSeoTitleStrC = scinterNewsSeoTitleStrE.createCriteria();
      scinterNewsSeoTitleStrC.andKeyNameEqualTo("scinter_news_seoTitle_str");
      scinterNewsSeoTitleStrC.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany)){
    	  scinterNewsSeoTitleStrC.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			scinterNewsSeoTitleStrC.andBranchCompanyEqualTo(myBranchCompany);
		}
      SysConfig scinterNewsSeoTitleStr= null;
      if(sysConfigMapper.selectByExample(scinterNewsSeoTitleStrE).size()> 0){
    	  scinterNewsSeoTitleStr = sysConfigMapper.selectByExample(scinterNewsSeoTitleStrE).get(0);
      }
      
      // SEO 关键字信息 
      SysConfigExample scinterNewsSeoKeywordStrE = new SysConfigExample();
      com.scinter.www.model.SysConfigExample.Criteria scinterNewsSeoKeywordStrC = scinterNewsSeoKeywordStrE.createCriteria();
      scinterNewsSeoKeywordStrC.andKeyNameEqualTo("scinter_news_seoKeyword_str");
      scinterNewsSeoKeywordStrC.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany)){
    	  scinterNewsSeoKeywordStrC.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			scinterNewsSeoKeywordStrC.andBranchCompanyEqualTo(myBranchCompany);
		}
      SysConfig scinterNewsSeoKeywordStr= null;
      if(sysConfigMapper.selectByExample(scinterNewsSeoKeywordStrE).size()> 0){
    	  
    	  scinterNewsSeoKeywordStr = sysConfigMapper.selectByExample(scinterNewsSeoKeywordStrE).get(0);
      }
      
      // SEO 描述信息
      SysConfigExample scinterNewsSeoDescStrE = new SysConfigExample();
      com.scinter.www.model.SysConfigExample.Criteria scinterNewsSeoDescStrC = scinterNewsSeoDescStrE.createCriteria();
      scinterNewsSeoDescStrC.andKeyNameEqualTo("scinter_news_seoDesc_str");
      scinterNewsSeoDescStrC.andValueNotEqualTo("");
      if(StringUtils.isNotBlank(myBranchCompany)){
    	  scinterNewsSeoDescStrC.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			scinterNewsSeoDescStrC.andBranchCompanyEqualTo(myBranchCompany);
		}
      SysConfig scinterNewsSeoDescStr= null;
      if(sysConfigMapper.selectByExample(scinterNewsSeoDescStrE).size()> 0){
      	
    	  scinterNewsSeoDescStr = sysConfigMapper.selectByExample(scinterNewsSeoDescStrE).get(0);
      }
	    model.addObject("scinterNewsSeoTitleStr", scinterNewsSeoTitleStr);
	    model.addObject("scinterNewsSeoKeywordStr", scinterNewsSeoKeywordStr);
	    model.addObject("scinterNewsSeoDescStr", scinterNewsSeoDescStr); 
		model.addObject("page", p);
		model.addObject("newsList", newsList);
		model.addObject("listNews2", listNews2);
		model.addObject("totalNums",totalNums);
		model.addObject("currentBCompany", myBranchCompany);
		model.addObject("type", myType);
		model.setViewName("/www/spec");
		logger.info("成功实现活动详情的功能");
		return model;
	}
	
	/**
	 * 实现说装修的列表页信息的展示
	 * @param page			当前的页码
	 * @param response		用于动态响应客户端请示
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "specase/p{page}", method = RequestMethod.GET)
	public ModelAndView specaseMessage(@PathVariable("page") int page,@RequestParam("type")String type,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		/*配置共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		String myType= new String(request.getParameter("type").getBytes("iso-8859-1"),"UTF-8");
		int rows = 16;//每页显示4条数据
		if(page<=0){
			page = 1;
		}
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
//		判断type的类型，将type 添加为查询的条件，将"说装修"除去
		if(!myType.equals("说装修")){
			criteria.andTypeEqualTo(myType);
		}
//		过滤说装修展示图片为空的新闻展示
		criteria.andThumbImgNotEqualTo("");
//		非删除状态的活动的信息
		criteria.andStatusEqualTo(1);
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}
		int totalNums =newsMapper.countByExample(newsExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
//		排序	
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
//		活动信息列表的获取
		NewsExample newsExample2 = new NewsExample();
		Criteria creNew = newsExample2.createCriteria();
//		筛选非删除状态的活动信息
		creNew.andStatusNotEqualTo(3);
		creNew.andStatusNotEqualTo(4);
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
	    	creNew.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			creNew.andBranchCompanyEqualTo(myBranchCompany);
		}
		List<News> listNews2 = newsMapper.selectByExample(newsExample2);
		/*获取案例列表页SEO 的配置信息*/
	      
	      // SEO 标题信息
	      SysConfigExample scinterNewsSeoTitleStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterNewsSeoTitleStrC = scinterNewsSeoTitleStrE.createCriteria();
	      scinterNewsSeoTitleStrC.andKeyNameEqualTo("scinter_spe_seoTitle_str");
	      scinterNewsSeoTitleStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  scinterNewsSeoTitleStrC.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				scinterNewsSeoTitleStrC.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterSpeSeoTitleStr= null;
	      if(sysConfigMapper.selectByExample(scinterNewsSeoTitleStrE).size()> 0){
	    	  scinterSpeSeoTitleStr = sysConfigMapper.selectByExample(scinterNewsSeoTitleStrE).get(0);
	      }
	      
	      // SEO 关键字信息 
	      SysConfigExample scinterNewsSeoKeywordStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterNewsSeoKeywordStrC = scinterNewsSeoKeywordStrE.createCriteria();
	      scinterNewsSeoKeywordStrC.andKeyNameEqualTo("scinter_spe_seoKeyword_str");
	      scinterNewsSeoKeywordStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  scinterNewsSeoKeywordStrC.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				scinterNewsSeoKeywordStrC.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterSpeSeoKeywordStr= null;
	      if(sysConfigMapper.selectByExample(scinterNewsSeoKeywordStrE).size()> 0){
	    	  scinterSpeSeoKeywordStr = sysConfigMapper.selectByExample(scinterNewsSeoKeywordStrE).get(0);
	      }
	      // SEO 描述信息
	      SysConfigExample scinterNewsSeoDescStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterNewsSeoDescStrC = scinterNewsSeoDescStrE.createCriteria();
	      scinterNewsSeoDescStrC.andKeyNameEqualTo("scinter_spe_seoDesc_str");
	      scinterNewsSeoDescStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(myBranchCompany)){
	    	  scinterNewsSeoDescStrC.andBranchCompanyEqualTo(myBranchCompany);
			}else{
				myBranchCompany = "bjsc";
				scinterNewsSeoDescStrC.andBranchCompanyEqualTo(myBranchCompany);
			}
	      SysConfig scinterSpeSeoDescStr= null;
	      if(sysConfigMapper.selectByExample(scinterNewsSeoDescStrE).size()> 0){
	      	
	    	  scinterSpeSeoDescStr = sysConfigMapper.selectByExample(scinterNewsSeoDescStrE).get(0);
	      }
        model.addObject("scinterSpeSeoTitleStr", scinterSpeSeoTitleStr);
	    model.addObject("scinterSpeSeoKeywordStr", scinterSpeSeoKeywordStr);
	    model.addObject("scinterSpeSeoDescStr", scinterSpeSeoDescStr);   
		model.addObject("currentBCompany", myBranchCompany);
		model.addObject("page", p);
		model.addObject("newsList", newsList);
		model.addObject("listNews2", listNews2);
		model.addObject("totalNums",totalNums);
		model.addObject("type", myType);
		model.setViewName("/www/specase");
		logger.info("成功实现活动详情的功能");
		return model;
	}
	
}
