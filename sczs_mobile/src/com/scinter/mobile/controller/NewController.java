package com.scinter.mobile.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mBase.controller.MbaseController;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.NewsExample.Criteria;


@Controller
public class NewController extends MbaseController{

	private Logger logger = Logger.getLogger(MhotBuildingController.class);
	@Autowired
	private NewsMapper newsMapper;
    @Autowired
    private SysConfigMapper sysConfigMapper;
	
	/**
	 * 实现活动详情的列表页信息的展示
	 * @param page			当前的页码
	 * @param response		用于动态响应客户端请示
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("news")
	public ModelAndView huoDongMessage(
			@RequestParam(value="NewsNum",required=false,defaultValue="") String NewsNum,
			HttpServletResponse response,HttpServletRequest request,HttpSession session) {
		
		/*获取共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
//	       初始化CasesNum
		int MyNewsNum = 0;
		if(NewsNum.isEmpty()){
			MyNewsNum = 6;
		}else{
			MyNewsNum = Integer.parseInt(NewsNum);
		}
//		获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
//		非删除状态的活动的信息
		criteria.andStatusNotEqualTo(3);
//		分公司查询
	    if(StringUtils.isNotBlank(myBranchCompany)){
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}
	    int totalNums = newsMapper.countByExample(newsExample);
//		排序	
		newsExample.setOrderByClause("create_time desc");
		List<News> newsLists = newsMapper.selectByExample(newsExample);
		List<News> newsList = new ArrayList<News>();

		for(News mynews:newsLists){
			
			String html = mynews.getContents();
			Document doc = null;
			if (StringUtils.isNotBlank(html)) {
				doc = Jsoup.parse(html);
				mynews.setContents( doc.text());
			}
			newsList.add(mynews);
		}
		List<News> newsAll = new ArrayList<News>();
		for(int i=0;i<MyNewsNum && i<newsList.size();i++){
			
			if(i<newsList.size()){
				newsAll.add(newsList.get(i));
			}
		}
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
		session.setAttribute("branchCompany", myBranchCompany);
		model.addObject("newsList", newsAll);
		model.addObject("NewsNum", MyNewsNum);
	    model.addObject("totalNums", totalNums);
		model.setViewName("/mobile/news");
		return model;
	}
	/**
	 * 新闻的详细的信息展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping("newDetail")
	public ModelAndView newDetail(@RequestParam("newsId") Integer newsId,HttpSession session, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();
//		获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		News news =  newsMapper.selectByPrimaryKey(newsId);
//		过滤文本中的图片
		String html = news.getContents();
		Document doc =Jsoup.parse(html);
		doc.select("img").removeAttr("width");
		doc.select("img").removeAttr("height");
		news.setContents(doc.toString());
		NewsExample newsExampleLast= new NewsExample();
		com.scinter.www.model.NewsExample.Criteria criteria = newsExampleLast.createCriteria();
		criteria.andStatusNotEqualTo(3);
		newsExampleLast.setOrderByClause("news_id desc");//排序
		News newLast = newsMapper.selectByExample(newsExampleLast).get(0);
		Integer max = newLast.getNewsId();
//		推荐文章的设置
		NewsExample newsExample = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
//		筛选非删除状态的新闻信息
		creNew.andStatusNotEqualTo(3);
//		分公司查询
	    if(null != myBranchCompany && myBranchCompany.length()>0){
	    	creNew.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			creNew.andBranchCompanyEqualTo(myBranchCompany);
		}
		List<News> newListNews = newsMapper.selectByExample(newsExample);
		logger.info("成功加载手机站的newsDetail");
//      获取百度商桥的信息
    	SysConfigExample sysConfigExampleShangqiao = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysSq= sysConfigExampleShangqiao.createCriteria();
        csysSq.andKeyNameEqualTo("scinter_home_M_shangQiao");
        csysSq.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csysSq.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csysSq.andBranchCompanyEqualTo(myBranchCompany);
		}
        SysConfig shangqiao= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleShangqiao).size()> 0){
        	
        	shangqiao = sysConfigMapper.selectByExample(sysConfigExampleShangqiao).get(0);
        }
//      获取百度统计的信息
    	SysConfigExample sysConfigExampleStatistics = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csystat= sysConfigExampleStatistics.createCriteria();
        csystat.andKeyNameEqualTo("scinter_home_statistics");
        csystat.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csystat.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csystat.andBranchCompanyEqualTo(myBranchCompany);
		}
        SysConfig statistics= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleStatistics).size()> 0){
        	
        	statistics = sysConfigMapper.selectByExample(sysConfigExampleStatistics).get(0);
        }
        model.addObject("statistics", statistics);
        session.setAttribute("statistics", statistics);
//      获取公司电话
    	SysConfigExample sysConfigExampleTelePhone = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysTp= sysConfigExampleTelePhone.createCriteria();
        csysTp.andKeyNameEqualTo("scinter_home_M_telePhone");
        csysTp.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(myBranchCompany) && myBranchCompany.length()>0){
        	csysTp.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			csysTp.andBranchCompanyEqualTo(myBranchCompany);
		}
        SysConfig MhomeTp = null;
        if(sysConfigMapper.selectByExample(sysConfigExampleTelePhone).size()>0){
        	
            MhomeTp = sysConfigMapper.selectByExample(sysConfigExampleTelePhone).get(0);
        }
        session.setAttribute("MhomeTp",MhomeTp );
//      将信息保存到session中
        session.setAttribute("shangqiao",shangqiao );
        model.addObject("shangqiao", shangqiao);
		session.setAttribute("branchCompany", myBranchCompany);
		model.addObject("newListNews", newListNews);
		model.addObject("news", news);
		model.addObject("max", max);
		model.setViewName("/mobile/newsDetail");
		return model;
		
	}
}
