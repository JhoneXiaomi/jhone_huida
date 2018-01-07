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
public class ActivityController extends BaseController{

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
	 * 实现活动详情的列表页信息的展示
	 * @author JhoneZhang
	 * @date   2016年8月23日上午11:16:07
	 * @param page						  页码
	 * @param type						  活动类型	
	 * @param response
	 * @param request
	 * @param session
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "activity/p{page}", method = RequestMethod.GET)
	public ModelAndView huoDongMessage(
			@PathVariable("page") int page,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		
		// 获取公共信息
		super.getHomeMessage(request, session);
		int rows = 3;
		if(page<=0){
			page = 1;
		}
		ModelAndView model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany = "sjzrbw1";
		}
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
		criteria.andThumbImgNotEqualTo("");
		criteria.andStatusEqualTo(6);
		criteria.andContentsNotEqualTo("");
		criteria.andBranchCompanyEqualTo(branchCompany);
		int totalNums =newsMapper.countByExample(newsExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
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
		model.addObject("currentBCompany", branchCompany);
		model.addObject("newsList", newsList);
		model.addObject("totalNums",totalNums);
		model.addObject("page", p);
		model.setViewName("/www/activity");
		return model;
	}
	
	@RequestMapping("specNewsDetail")
	public ModelAndView casesNewDetail(
			@RequestParam("type") String type,
			@RequestParam("newsId") Integer newsId,
			HttpSession session, HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		type = new String(request.getParameter("type").getBytes("iso-8859-1"),"UTF-8");
		// 获取公共信息
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
		// 获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(myBranchCompany)){
			myBranchCompany ="sjzrbw1"; 
		}
		// 获取案例排行榜的信息
        CasesExample activityCases = new CasesExample();
        com.rbw.www.model.CasesExample.Criteria ac = activityCases.createCriteria();
        ac.andCaseStatusEqualTo(4);
        if(StringUtils.isNotBlank(myBranchCompany)){
        	ac.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "sjzrbw1";
			ac.andBranchCompanyEqualTo(myBranchCompany);
		}
        List<Cases> aCasesList= casesMapper.selectByExample(activityCases);
        session.setAttribute("branchCompany",myBranchCompany);
        // 获取当前的新闻信息
	    News news =  newsMapper.selectByPrimaryKey(newsId);
        model.addObject("aCasesList", aCasesList);
		model.addObject("type", type);
		model.addObject("news", news);
		model.addObject("branchCompany", myBranchCompany);
		model.setViewName("/www/specNewsDetail");
		return model;
	}
	
	/**
	 * 活动详情页
	 * @author JhoneZhang
	 * @date   2016年9月6日下午3:21:37
	 * @param type
	 * @param newsId
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("activityDetail")
	public ModelAndView serviceNewsDetail(
			@RequestParam("type") String type,
			@RequestParam("newsId") Integer newsId,
			HttpSession session, HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		// 获取公共信息
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
		// 获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(myBranchCompany)){
			myBranchCompany = "sjzrbw1";
		}
		type= new String(request.getParameter("type").getBytes("iso-8859-1"),"UTF-8");
		
		/*获取热门活动的详细信息*/
		NewsExample newsExample = new NewsExample();
		com.rbw.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
		creNew.andStatusEqualTo(6);
	    creNew.andBranchCompanyEqualTo(myBranchCompany);
		List<News> newListNews = newsMapper.selectByExample(newsExample);
		
		// 获取当前的新闻信息
	    News news =  newsMapper.selectByPrimaryKey(newsId);

		// 获取最后一篇文章的信息
		NewsExample newsExampleLast= new NewsExample();
		com.rbw.www.model.NewsExample.Criteria criteria = newsExampleLast.createCriteria();
		criteria.andStatusEqualTo(6);
		newsExampleLast.setOrderByClause("news_id desc");//排序
		News newLast = null;
		Integer max = 0;
		if(newsMapper.selectByExample(newsExampleLast).size()>0){
			newLast = newsMapper.selectByExample(newsExampleLast).get(0);
			max = newLast.getNewsId();
		}
		News newsUp = new News();
		News newsDown = new News();
		NewsExample newsExampleNum = new NewsExample();
		Criteria numCriteria = newsExampleNum.createCriteria();
		numCriteria.andStatusEqualTo(6);
		
		// 获取上一篇文章的信息
		for(Integer i=1;i<newsMapper.countByExample(newsExampleNum)+1;i++){
			if(newsId -i >0){
				if(newsMapper.selectByPrimaryKey(newsId-i).getStatus() == 6 
						&& newsMapper.selectByPrimaryKey(newsId-i).getBranchCompany().equals(myBranchCompany)){
				  newsUp =  newsMapper.selectByPrimaryKey(newsId-i);
				  break;
				}
			}
		}
		// 获取下一篇文章的信息
		for(Integer i=1;i<newsMapper.countByExample(newsExampleNum)+1;i++){
			if(newsId+i<=max){
				if(newsMapper.selectByPrimaryKey(newsId+i).getStatus() == 6
						&& newsMapper.selectByPrimaryKey(newsId+i).getBranchCompany().equals(myBranchCompany)){
					 newsDown =  newsMapper.selectByPrimaryKey(newsId+i);
					 break;
				}
			}
		}
		
		/*获取案例排行榜的信息*/
        CasesExample activityCases = new CasesExample();
        com.rbw.www.model.CasesExample.Criteria ac = activityCases.createCriteria();
        ac.andCaseStatusEqualTo(1);
        if(StringUtils.isNotBlank(myBranchCompany)){
        	ac.andBranchCompanyEqualTo(myBranchCompany);
		}
        List<Cases> aCasesList= casesMapper.selectByExample(activityCases);
        model.addObject("aCasesList", aCasesList);
		model.addObject("newsUp", newsUp);
		model.addObject("newsDown", newsDown);
		model.addObject("max", max);		
		model.addObject("newListNews", newListNews);
		model.addObject("type", type);
		model.addObject("news", news);
		model.addObject("branchCompany", myBranchCompany);
		model.setViewName("/www/activityDetail");
		return model;
	}
	
	
}
