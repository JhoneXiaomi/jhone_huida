package com.rbw.mobile.controller;

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
import com.rbw.www.model.News;
import com.rbw.www.model.NewsExample;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.model.NewsExample.Criteria;
import com.rbw.www.util.Page;


@Controller
@RequestMapping("m")
public class MstrategyController extends MbaseController{

	private Logger logger = Logger.getLogger(MstrategyController.class);
	@Autowired
	private NewsMapper newsMapper;
    @Autowired
    private SysConfigMapper sysConfigMapper;
	
	@RequestMapping(value = "strategy/p{page}")
	public ModelAndView strategy(
			@PathVariable("page") int page,
			@RequestParam(value="NewsNum",required=false,defaultValue="") String NewsNum,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		
	    /*获取共有的信息*/
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
//	       初始化CasesNum
		int MyNewsNum = 0;
		if(NewsNum.isEmpty()){
			MyNewsNum = 6;
		}else{
			MyNewsNum = Integer.parseInt(NewsNum);
		}
		// 分页的基本信息
		int rows = 10;
		if(page<=0){
			page = 1;
		}
//		获取session 中的 BranchCompany
		String branchCompany	= (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
//		非删除状态的活动的信息
		criteria.andStatusEqualTo(5);
		criteria.andTypeEqualTo("装修攻略");
//		分公司查询
	    if(null != branchCompany && branchCompany.length()>0){
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "sjzrbw1";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
	    int totalNums = newsMapper.countByExample(newsExample);
	    Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
//		排序	
		newsExample.setOrderByClause("create_time desc");
		List<News> newsLists = newsMapper.selectByExample(newsExample);
		List<News> newsList = new ArrayList<News>();
		for(News mynews:newsLists){
			String html = mynews.getContents();
			Document doc =Jsoup.parse(html);
			mynews.setContents( doc.text());
			newsList.add(mynews);
		}
		List<News> newsAll = new ArrayList<News>();
		for(int i=0;i<MyNewsNum && i<newsList.size();i++){
			
			if(i<newsList.size()){
				newsAll.add(newsList.get(i));
			}
		}
		
		/*获取SEO 的配置信息*/
        // SEO 标题信息
        SysConfigExample sysConfigExamplerbwHomeSeoTitle = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriarbwHomeSeoTitle = sysConfigExamplerbwHomeSeoTitle.createCriteria();
        criteriarbwHomeSeoTitle.andKeyNameEqualTo("rbw_news_seoDesc_str");
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
        criteriarbwhomeSeoKeyword.andKeyNameEqualTo("rbw_news_seoKeyword_str");
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
        criteriarbwHomeSeoDesc.andKeyNameEqualTo("rbw_news_seoTitle_str");
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
		session.setAttribute("branchCompany", branchCompany);
		model.addObject("page", p);
		model.addObject("newsList", newsAll);
		model.addObject("NewsNum", MyNewsNum);
	    model.addObject("totalNums", totalNums);
		model.setViewName("/mobile/strategy");
		return model;
	}
	
	@RequestMapping("strategyDetail")
	public ModelAndView strategyDetail(
			@RequestParam("newsId") Integer newsId,HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();
//		获取session 中的 BranchCompany
		String branchCompany	= (String) session.getAttribute("branchCompany");
		News news =  newsMapper.selectByPrimaryKey(newsId);
		NewsExample newsExampleLast= new NewsExample();
		com.rbw.www.model.NewsExample.Criteria criteria = newsExampleLast.createCriteria();
		criteria.andStatusNotEqualTo(3);
		criteria.andTypeEqualTo("装修攻略");
		newsExampleLast.setOrderByClause("news_id desc");//排序
		News newLast = newsMapper.selectByExample(newsExampleLast).get(0);
		Integer max = newLast.getNewsId();
//		推荐文章的设置
		NewsExample newsExample = new NewsExample();
		com.rbw.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
//		筛选非删除状态的新闻信息
		creNew.andStatusNotEqualTo(3);
//		分公司查询
	    if(null != branchCompany && branchCompany.length()>0){
	    	creNew.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "sjzrbw1";
			creNew.andBranchCompanyEqualTo(branchCompany);
		}
		List<News> newListNews = newsMapper.selectByExample(newsExample);

		session.setAttribute("branchCompany", branchCompany);
		model.addObject("newListNews", newListNews);
		model.addObject("news", news);
		model.addObject("max", max);
		model.setViewName("/mobile/strategyDetail");
		return model;
		
	}
}