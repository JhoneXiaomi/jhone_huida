package com.scinter.www.controller;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
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
import com.scinter.www.model.NewsExample.Criteria;
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
	
	/**
	 * 楼盘资讯的列表页信息的展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping(value = "news/p{page}", method = RequestMethod.GET)
	public ModelAndView caseMessage(@PathVariable("page") int page,HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		
		/*配置共有的信息*/
		super.getHomeMessage(request, session);
//		获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(myBranchCompany==""){
			myBranchCompany ="bjsc"; 
		}
		int rows = 5;//每页显示5条数据
		if(page<=0){
			page = 1;
		}
//		新闻信息的获取
		NewsExample newsExample = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
		creNew.andThumbImgNotEqualTo("");
//		筛选非删除状态的新闻信息
		creNew.andStatusEqualTo(1);
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
	    	creNew.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			
			creNew.andBranchCompanyEqualTo(myBranchCompany);
		}
		int totalNums = newsMapper.countByExample(newsExample);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		newsExample.setPage(p);
		List<News> listNews = newsMapper.selectByExample(newsExample);
		
//		推荐文章的设置
		NewsExample newsExample2 = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria creNew2 = newsExample.createCriteria();
//		筛选非删除状态的新闻信息
		int totalNums2 = newsMapper.countByExample(newsExample);
		Page p2 = new Page( 8, 8);
		p2.setTotalRecords(totalNums2);
		newsExample.setPage(p2);
		creNew2.andStatusEqualTo(1);
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
	    	creNew2.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			
			creNew2.andBranchCompanyEqualTo(myBranchCompany);
		}
		List<News> newListNews = newsMapper.selectByExample(newsExample2);
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
		model.addObject("newListNews", newListNews);
		model.addObject("page", p);
		model.addObject("newListNews", newListNews);
		model.addObject("listNews", listNews);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/news");
		logger.info("成功实现楼盘资讯的功能");
		return model;
	}
	
	/**
	 * 新闻的详细的信息展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("newDetail")
	public ModelAndView newDetail(@RequestParam("type") String type,@RequestParam("newsId") Integer newsId,
			HttpSession session, HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		/*配置共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
//		获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(myBranchCompany==""){
			myBranchCompany ="bjsc"; 
		}
		String myType= new String(request.getParameter("type").getBytes("iso-8859-1"),"UTF-8");
		News news =  newsMapper.selectByPrimaryKey(newsId);
		
		// 获取最后一篇文章的信息
		NewsExample newsExampleLast= new NewsExample();
		com.scinter.www.model.NewsExample.Criteria criteria = newsExampleLast.createCriteria();
		criteria.andStatusEqualTo(1);
		newsExampleLast.setOrderByClause("news_id desc");//排序
		News newLast = newsMapper.selectByExample(newsExampleLast).get(0);
	
		Integer max = newLast.getNewsId();
		News newsUp = new News();
		News newsDown = new News();
		NewsExample newsExampleNum = new NewsExample();
		Criteria numCriteria = newsExampleNum.createCriteria();
		numCriteria.andStatusEqualTo(1);
		// 获取上一篇文章的信息
		for(Integer i=1;i<newsMapper.countByExample(newsExampleNum)+1;i++){
			if(newsId -i >0){
				if(newsMapper.selectByPrimaryKey(newsId-i).getStatus() == 1
						&& newsMapper.selectByPrimaryKey(newsId-i).getBranchCompany().equals(myBranchCompany)){
				  newsUp =  newsMapper.selectByPrimaryKey(newsId-i);
				  break;
				}
			}
		}
		// 获取下一篇文章的信息
		for(Integer i=1;i<newsMapper.countByExample(newsExampleNum)+1;i++){
			if(newsId+i<=max){
				if(newsMapper.selectByPrimaryKey(newsId+i).getStatus() == 1
						&& newsMapper.selectByPrimaryKey(newsId+i).getBranchCompany().equals(myBranchCompany)){
					 newsDown =  newsMapper.selectByPrimaryKey(newsId+i);
					 break;
				}
			}
		}
				
//		推荐文章的设置
		NewsExample newsExample = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
//		筛选非删除状态的新闻信息
		creNew.andStatusEqualTo(1);
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
	    	creNew.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			
			creNew.andBranchCompanyEqualTo(myBranchCompany);
		}
		List<News> newListNews = newsMapper.selectByExample(newsExample);
		session.setAttribute("currentBCompany",myBranchCompany);
		model.addObject("newListNews", newListNews);
		model.addObject("type", myType);
		model.addObject("news", news);
		model.addObject("newsUp", newsUp);
		model.addObject("newsDown", newsDown);
		model.addObject("max", max);
		model.setViewName("/www/newsDetail");
		return model;
		
	}
	
	/**
	 * 案例新闻的详细的信息展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("casesNewDetail")
	public ModelAndView casesNewDetail(@RequestParam("type") String type,@RequestParam("newsId") Integer newsId,
			HttpSession session, HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		/*配置共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
//		获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(myBranchCompany==""){
			myBranchCompany ="bjsc"; 
		}
		String myType= new String(request.getParameter("type").getBytes("iso-8859-1"),"UTF-8");
		News news =  newsMapper.selectByPrimaryKey(newsId);
		// 获取最后一篇文章的信息
		NewsExample newsExampleLast= new NewsExample();
		com.scinter.www.model.NewsExample.Criteria criteria = newsExampleLast.createCriteria();
		criteria.andStatusEqualTo(1);
		newsExampleLast.setOrderByClause("news_id desc");//排序
		News newLast = newsMapper.selectByExample(newsExampleLast).get(0);
	
		Integer max = newLast.getNewsId();
		News newsUp = new News();
		News newsDown = new News();
		NewsExample newsExampleNum = new NewsExample();
		Criteria numCriteria = newsExampleNum.createCriteria();
		numCriteria.andStatusEqualTo(1);
//		获取上一篇文章的信息
		for(Integer i=1;i<newsMapper.countByExample(newsExampleNum)+1;i++){
			if(newsId -i >0){
				if(newsMapper.selectByPrimaryKey(newsId-i).getStatus() == 1
						&& newsMapper.selectByPrimaryKey(newsId-i).getBranchCompany() == myBranchCompany){
				  newsUp =  newsMapper.selectByPrimaryKey(newsId-i);
				  break;
				}
			}
		}
//		获取下一篇文章的信息
		for(Integer i=1;i<newsMapper.countByExample(newsExampleNum)+1;i++){
			if(newsId+i<=max){
				if(newsMapper.selectByPrimaryKey(newsId+i).getStatus() == 1
						&& newsMapper.selectByPrimaryKey(newsId+i).getBranchCompany() == myBranchCompany){
					 newsDown =  newsMapper.selectByPrimaryKey(newsId+i);
					 break;
				}
			}
		}
		
//		推荐文章的设置
		NewsExample newsExample = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
//		筛选非删除状态的新闻信息
		creNew.andStatusEqualTo(1);
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
	    	creNew.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			
			creNew.andBranchCompanyEqualTo(myBranchCompany);
		}
		List<News> newListNews = newsMapper.selectByExample(newsExample);
		session.setAttribute("currentBCompany",myBranchCompany);
		model.addObject("newListNews", newListNews);
		model.addObject("type", myType);
		model.addObject("news", news);
		model.addObject("newsUp", newsUp);
		model.addObject("newsDown", newsDown);
		model.addObject("max", max);
		model.setViewName("/www/casesNewsDetail");
		return model;
		
	}
	
	
	
}
