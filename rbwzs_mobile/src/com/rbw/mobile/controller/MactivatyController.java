package com.rbw.mobile.controller;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rbw.mBase.controller.MbaseController;
import com.rbw.www.dao.NewsMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.model.News;
import com.rbw.www.model.NewsExample;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.model.NewsExample.Criteria;
import com.rbw.www.util.Page;

@Controller
@RequestMapping("m")
public class MactivatyController extends MbaseController{

	private Logger logger = Logger.getLogger(MactivatyController.class);
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	@RequestMapping(value = "activaty/p{page}")
	public ModelAndView Mspec(
			@PathVariable("page") int page,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
		
		String branchCompany = (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		// 分页的基本信息
		int rows = 4;
		if(page<=0){
			page = 1;
		}
//		过滤说装修展示图片为空的新闻展示
		criteria.andThumbImgNotEqualTo("");
//		非删除状态的活动的信息
		criteria.andStatusEqualTo(6);
//      获取分公司的信息
	    if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "sjzrbw1";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
	    int totalNums =newsMapper.countByExample(newsExample);
	    Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
//		排序	
		newsExample.setOrderByClause("update_time desc");
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
        SysConfigExample sysConfigExamplerbwHomeSeoTitle = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriarbwHomeSeoTitle = sysConfigExamplerbwHomeSeoTitle.createCriteria();
        criteriarbwHomeSeoTitle.andKeyNameEqualTo("scinter_news_seoDesc_str");
        criteriarbwHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriarbwHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).size()> 0){
        	newsSeoDescStr = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExamplerbwhomeSeoKeyword = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriarbwhomeSeoKeyword = sysConfigExamplerbwhomeSeoKeyword.createCriteria();
        criteriarbwhomeSeoKeyword.andKeyNameEqualTo("scinter_news_seoKeyword_str");
        criteriarbwhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriarbwhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).size()> 0){
        	
        	newsSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExamplerbwhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExamplerbwHomeSeoDesc = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriarbwHomeSeoDesc = sysConfigExamplerbwHomeSeoDesc.createCriteria();
        criteriarbwHomeSeoDesc.andKeyNameEqualTo("scinter_news_seoTitle_str");
        criteriarbwHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriarbwHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).size()> 0){
        	
        	newsSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExamplerbwHomeSeoDesc).get(0);
        }
        model.addObject("newsSeoDescStr", newsSeoDescStr);
        model.addObject("newsSeoKeywordStr", newsSeoKeywordStr);
        model.addObject("newsSeoTitleStr", newsSeoTitleStr);
        model.addObject("page", p);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("newsList", newsList);
		model.setViewName("/mobile/activaty");
		return model;
	}
	
	@RequestMapping("activatyDetail")
	public ModelAndView MspecDetail(
			@RequestParam("newsId") Integer newsId,
			HttpServletResponse response,HttpSession session,HttpServletRequest request) {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		// 获取当前的装修活动详情
		News news =  newsMapper.selectByPrimaryKey(newsId);
		
		// 推荐文章
		NewsExample newsExample = new NewsExample();
		com.rbw.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
		creNew.andStatusEqualTo(5);
	    if(StringUtils.isNotBlank(branchCompany)){
	    	creNew.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "sjzrbw1";
			creNew.andBranchCompanyEqualTo(branchCompany);
		}
		List<News> newListNews = newsMapper.selectByExample(newsExample);
		model.addObject("newListNews", newListNews);
		model.addObject("news", news);
		model.setViewName("/mobile/activatyDetail");
		return model;
		
	}

}
