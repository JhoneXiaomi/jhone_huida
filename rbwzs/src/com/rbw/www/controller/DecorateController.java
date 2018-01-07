package com.rbw.www.controller;
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

import com.rbw.base.controller.BaseController;
import com.rbw.www.dao.CasesMapper;
import com.rbw.www.dao.NewsMapper;
import com.rbw.www.dao.OrderInfoMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.model.Cases;
import com.rbw.www.model.CasesExample;
import com.rbw.www.model.News;
import com.rbw.www.model.NewsExample;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.model.NewsExample.Criteria;
import com.rbw.www.util.Page;
@Controller
public class DecorateController extends BaseController{

	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	@Autowired
	private CasesMapper casesMapper;
	
	/**
	 * 说装修显示列表页
	 * @author JhoneZhang
	 * @date   2016年9月6日下午3:27:49
	 * @param page
	 * @param title
	 * @param response
	 * @param request
	 * @param session
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "news/p{page}", method = RequestMethod.GET)
	public ModelAndView news(
			@PathVariable("page") int page,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		// 获取公共信息
		super.getHomeMessage(request, session);
		int rows = 6;//每页显示6条数据
		if(page<=0){
			page = 1;
		}
		ModelAndView model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andThumbImgNotEqualTo("");
		criteria.andStatusEqualTo(5);
		criteria.andContentsNotEqualTo("");
	    if(StringUtils.isNotBlank(branchCompany)){
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "sjzrbw1";
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
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_spe_seoTitle_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	newsSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_spe_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	
        	newsSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_spe_seoDesc_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	newsSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        model.addObject("newsSeoDescStr", newsSeoDescStr);
        model.addObject("newsSeoKeywordStr", newsSeoKeywordStr);
        model.addObject("newsSeoTitleStr", newsSeoTitleStr);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("branchCompany", branchCompany);
		model.addObject("newsList", newsList);
		model.addObject("totalNums",totalNums);
		model.addObject("page", p);
		model.setViewName("/www/news");
		return model;
	}
	
	/**
	 * 新闻的详情页
	 * @author JhoneZhang
	 * @date   2016年9月6日下午4:10:05
	 * @param type
	 * @param newsId
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
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
		// 获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(myBranchCompany)){
			myBranchCompany ="sjzrbw1"; 
		}
		// 获取当前的新闻信息
	    News news =  newsMapper.selectByPrimaryKey(newsId);
		/*获取案例排行榜的信息*/
        CasesExample activityCases = new CasesExample();
        com.rbw.www.model.CasesExample.Criteria ac = activityCases.createCriteria();
        ac.andCaseStatusEqualTo(1);
        if(StringUtils.isNotBlank(myBranchCompany)){
        	ac.andBranchCompanyEqualTo(myBranchCompany);
		}
        List<Cases> aCasesList= casesMapper.selectByExample(activityCases);
        session.setAttribute("branchCompany",myBranchCompany);

		// 获取最后一篇文章的信息
		NewsExample newsExampleLast= new NewsExample();
		com.rbw.www.model.NewsExample.Criteria criteria = newsExampleLast.createCriteria();
		criteria.andStatusEqualTo(1);
		newsExampleLast.setOrderByClause("news_id desc");//排序
		News newLast = null;
		Integer max = 0;
		if(newsMapper.selectByExample(newsExampleLast).size() > 0){
			newLast = newsMapper.selectByExample(newsExampleLast).get(0);
		}
	
	    max = newLast.getNewsId();
		News newsUp = new News();
		News newsDown = new News();
		NewsExample newsExampleNum = new NewsExample();
		Criteria numCriteria = newsExampleNum.createCriteria();
		numCriteria.andStatusEqualTo(5);
		
		// 获取上一篇文章的信息
		for(Integer i=1;i<newsMapper.countByExample(newsExampleNum)+1;i++){
			if(newsId -i >0){
				if(newsMapper.selectByPrimaryKey(newsId-i).getStatus() ==5
						&& newsMapper.selectByPrimaryKey(newsId-i).getBranchCompany().equals(myBranchCompany)){
				  newsUp =  newsMapper.selectByPrimaryKey(newsId-i);
				  break;
				}
			}
		}
		// 获取下一篇文章的信息
		for(Integer i=1;i<newsMapper.countByExample(newsExampleNum)+1;i++){
			if(newsId+i<=max){
				if(newsMapper.selectByPrimaryKey(newsId+i).getStatus() ==5
						&& newsMapper.selectByPrimaryKey(newsId+i).getBranchCompany().equals(myBranchCompany)){
					 newsDown =  newsMapper.selectByPrimaryKey(newsId+i);
					 break;
				}
			}
		}
		model.addObject("branchCompany", myBranchCompany);
		model.addObject("newsUp", newsUp);
		model.addObject("newsDown", newsDown);
		model.addObject("max", max);
        model.addObject("aCasesList", aCasesList);
		model.addObject("news", news);
		model.setViewName("/www/newsDetail");
		return model;
	}
	
	/**
	 * 行业咨询
	 * @author JhoneZhang
	 * @date   2016年9月9日上午8:30:37
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
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		// 获取公共信息
		super.getHomeMessage(request, session);
		int rows = 6;//每页显示6条数据
		if(page<=0){
			page = 1;
		}
		ModelAndView model = new ModelAndView();
		String branchCompany= (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andThumbImgNotEqualTo("");
		criteria.andStatusEqualTo(5);
		criteria.andTypeEqualTo("行业资讯");
		criteria.andContentsNotEqualTo("");
	    if(StringUtils.isNotBlank(branchCompany)){
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "sjzrbw1";
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
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_spe_seoTitle_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	newsSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_spe_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	
        	newsSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_spe_seoDesc_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "sjzrbw1";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig newsSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	newsSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        model.addObject("newsSeoDescStr", newsSeoDescStr);
        model.addObject("newsSeoKeywordStr", newsSeoKeywordStr);
        model.addObject("newsSeoTitleStr", newsSeoTitleStr);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("branchCompany", branchCompany);
		model.addObject("newsList", newsList);
		model.addObject("totalNums",totalNums);
		model.addObject("page", p);
		model.setViewName("/www/industry");
		return model;
	}
	/**
	 * 家装日记
	 * @author JhoneZhang
	 * @date   2016年9月9日下午3:03:41
	 * @param page						页码
	 * @param title						标题，用于搜索			
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
		super.getHomeMessage(request, session);
		int rows = 6;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
		ModelAndView model = new ModelAndView();
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andContentsNotEqualTo("");
		criteria.andThumbImgNotEqualTo("");
		criteria.andStatusEqualTo(5);
		criteria.andTypeEqualTo("家装日记");
		if(StringUtils.isNotBlank(title)){
			title = new String(title.getBytes("ISO-8859-1"),"utf-8");
			criteria.andTitleLike("%"+title+"%");
		}
	    if(StringUtils.isNotBlank(myBranchCompany)){
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			criteria.andBranchCompanyEqualTo(myBranchCompany);
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
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_spe_seoTitle_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany)){
      	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
  		}else{
  			myBranchCompany = "sjzrbw1";
  			criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
  		}
        SysConfig newsSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	newsSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_spe_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
  		}else{
  			myBranchCompany = "sjzrbw1";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
  		}
        SysConfig newsSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	
        	newsSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_spe_seoDesc_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
  		}else{
  			myBranchCompany = "sjzrbw1";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
  		}
        SysConfig newsSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	newsSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        model.addObject("newsSeoDescStr", newsSeoDescStr);
        model.addObject("newsSeoKeywordStr", newsSeoKeywordStr);
        model.addObject("newsSeoTitleStr", newsSeoTitleStr);
		model.addObject("currentBCompany", myBranchCompany);
		model.addObject("branchCompany", myBranchCompany);
		model.addObject("newsList", newsList);
		model.addObject("totalNums",totalNums);
		model.addObject("page", p);
		model.setViewName("/www/decorateStrategy");
		return model;
	}
	
	/**
	 * 装修攻略
	 * @author JhoneZhang
	 * @date   2016年9月9日下午3:05:53
	 * @param page						页码
	 * @param title						标题
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
		super.getHomeMessage(request, session);
		int rows = 6;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
		ModelAndView model = new ModelAndView();
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andContentsNotEqualTo("");
		criteria.andThumbImgNotEqualTo("");
		criteria.andStatusEqualTo(5);
		criteria.andTypeEqualTo("装修攻略");
		if(StringUtils.isNotBlank(title)){
			title = new String(title.getBytes("ISO-8859-1"),"utf-8");
			criteria.andTitleLike("%"+title+"%");
		}
	    if(StringUtils.isNotBlank(myBranchCompany)){
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			criteria.andBranchCompanyEqualTo(myBranchCompany);
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
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_spe_seoTitle_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany)){
      	  criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
  		}else{
  			myBranchCompany = "sjzrbw1";
  			criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(myBranchCompany);
  		}
        SysConfig newsSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	newsSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_spe_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
  		}else{
  			myBranchCompany = "sjzrbw1";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(myBranchCompany);
  		}
        SysConfig newsSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	
        	newsSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_spe_seoDesc_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
  		}else{
  			myBranchCompany = "sjzrbw1";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(myBranchCompany);
  		}
        SysConfig newsSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	newsSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        model.addObject("newsSeoDescStr", newsSeoDescStr);
        model.addObject("newsSeoKeywordStr", newsSeoKeywordStr);
        model.addObject("newsSeoTitleStr", newsSeoTitleStr);
		model.addObject("currentBCompany", myBranchCompany);
		model.addObject("branchCompany", myBranchCompany);
		model.addObject("newsList", newsList);
		model.addObject("totalNums",totalNums);
		model.addObject("page", p);
		model.setViewName("/www/domesticOutfit");
		return model;
	}
}
