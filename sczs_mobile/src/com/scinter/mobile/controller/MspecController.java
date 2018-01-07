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

import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.NewsExample.Criteria;

@Controller
public class MspecController {

	private Logger logger = Logger.getLogger(MspecController.class);
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	
	@RequestMapping("Mspec")
	public ModelAndView Mspec(HttpServletResponse response,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		ModelAndView model = new ModelAndView();
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		NewsExample newsExample =new NewsExample();
		Criteria criteria = newsExample.createCriteria();
//		过滤说装修展示图片为空的新闻展示
		criteria.andThumbImgNotEqualTo("");
//		非删除状态的活动的信息
		criteria.andStatusEqualTo(4);
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}
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
		model.addObject("currentBCompany", myBranchCompany);
		model.addObject("newsList", newsList);
		model.setViewName("/mobile/spec");
		return model;
	}
	
	@RequestMapping("MspecDetail")
	public ModelAndView MspecDetail(@RequestParam("newsId") Integer newsId,HttpServletResponse response,HttpSession session) {
		
		ModelAndView model = new ModelAndView();
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(myBranchCompany))
			myBranchCompany = "bjsc";
		News news =  newsMapper.selectByPrimaryKey(newsId);
		NewsExample newsExampleLast= new NewsExample();
		com.scinter.www.model.NewsExample.Criteria criteria = newsExampleLast.createCriteria();
		criteria.andStatusEqualTo(4);
		newsExampleLast.setOrderByClause("news_id desc");//排序
		News newLast = newsMapper.selectByExample(newsExampleLast).get(0);
		Integer max = newLast.getNewsId();
		
		
		// 推荐文章的设置
		NewsExample newsExample = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
		creNew.andStatusEqualTo(4);
		// 获取分公司的信息
		creNew.andBranchCompanyEqualTo(myBranchCompany);
		List<News> newListNews = newsMapper.selectByExample(newsExample);
		// 获取百度商桥的信息
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
        //  将信息保存到session中
        session.setAttribute("shangqiao",shangqiao );
        model.addObject("shangqiao", shangqiao);
		model.addObject("newListNews", newListNews);
		model.addObject("news", news);
		model.addObject("max", max);
		model.setViewName("/mobile/specDetail");
		return model;
		
	}

}
