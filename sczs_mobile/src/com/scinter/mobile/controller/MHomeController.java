package com.scinter.mobile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mBase.controller.MbaseController;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.HomeTurnImgMapper;
import com.scinter.www.dao.HotBuildingMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.HomeTurnImg;
import com.scinter.www.model.HomeTurnImgExample;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;

@Controller
public class MHomeController extends MbaseController {

	private Logger logger = Logger.getLogger(MHomeController.class);

	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private HotBuildingMapper hotBuildingMapper;
	@Autowired
	private CasesMapper casesMapper;
	@Autowired
	private DesignerMapper disignerMapper;
	@Autowired
	private HomeTurnImgMapper homeTurnImgMapper;
	
	@RequestMapping("/")
	public ModelAndView welcome(HttpServletRequest request,HttpSession session){ 
		
		/*获取共有信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();  
		logger.info("welcome mobile");
		// 获取session 中的 BranchCompany
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
        if(StringUtils.isBlank(myBranchCompany))
        	myBranchCompany = "bjsc";
        
        // 获取首页焦点图
  		HomeTurnImgExample hhe = new HomeTurnImgExample();
  		com.scinter.www.model.HomeTurnImgExample.Criteria homeTurnc = hhe.createCriteria();
  		homeTurnc.andStateEqualTo(2);
  		homeTurnc.andHomeimgSrcNotEqualTo("");
  		homeTurnc.andBranchCompanyEqualTo(myBranchCompany);
        hhe.setOrderByClause("update_time desc");
  		List<HomeTurnImg> MhomeTurn = homeTurnImgMapper.selectByExample(hhe);
        
  		//  首页装修攻略的展示
        NewsExample newsExample = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria criteria = newsExample.createCriteria();
        criteria.andStatusNotEqualTo(3);
       // 分公司查询
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(myBranchCompany);
		}
        newsExample.setOrderByClause("news_id desc");
        List<News> newsLists = newsMapper.selectByExample(newsExample);
        List<News> newsList =new ArrayList<News>();
        for(int i=0; i<newsLists.size() && i<4; i++){
        	News news = new News();
        	news = newsLists.get(i);
        	newsList.add(news);
        }
        
//      首页设计师展示
        DesignerExample designerExample = new DesignerExample();
        com.scinter.www.model.DesignerExample.Criteria criteriaper = designerExample.createCriteria();
        criteriaper.andStatusNotEqualTo(3);
        criteriaper.andDesignerPhotoImgNotEqualTo("");
//		分公司查询
	    if(null != myBranchCompany && myBranchCompany.length()>0){
	    	criteriaper.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteriaper.andBranchCompanyEqualTo(myBranchCompany);
		}
        newsExample.setOrderByClause("designer_id desc");
        List<Designer> designerLists = disignerMapper.selectByExample(designerExample);
     
        
//      首页装修案例展示
        CasesExample casesExample = new CasesExample();
        com.scinter.www.model.CasesExample.Criteria criteriaCas = casesExample.createCriteria();
        criteriaCas.andCaseThumbImgNotEqualTo("");
        criteriaCas.andCaseStatusNotEqualTo(3);
        criteriaCas.andIsHotCaseEqualTo("是");
//		分公司查询
	    if(null != myBranchCompany && myBranchCompany.length()>0){
	    	criteriaCas.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteriaCas.andBranchCompanyEqualTo(myBranchCompany);
		}
        casesExample.setOrderByClause("case_id desc");
        List<Cases> CasesLists = caseMapper.selectByExample(casesExample);
        
//      装修攻略的新闻轮播，新闻的分类查询->行业资讯
        NewsExample newsExampleCpnews = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria criteriaCpnews = newsExampleCpnews.createCriteria();
        criteriaCpnews.andStatusNotEqualTo(3);
        criteriaCpnews.andTypeEqualTo("行业资讯");
//      判定是否为推送消息
        criteriaCpnews.andIsHotNewsEqualTo("是"); 
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
	    	criteriaCpnews.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteriaCpnews.andBranchCompanyEqualTo(myBranchCompany);
		}
        newsExampleCpnews.setOrderByClause("news_id desc");
        News CompNews = new News();
        News CompNews_two = new News();
        if(newsMapper.selectByExample(newsExampleCpnews).size()>0){
        	
        	CompNews = newsMapper.selectByExample(newsExampleCpnews).get(0);
            String html = CompNews.getContents();
            html = html.replaceAll("&nbsp;", "");
            Document doc = Jsoup.parse(html);
            CompNews.setContents(doc.text());
        }
        if(newsMapper.selectByExample(newsExampleCpnews).size()>1){
        	
        	CompNews_two = newsMapper.selectByExample(newsExampleCpnews).get(1);
            String html = CompNews.getContents();
            html = html.replaceAll("&nbsp;", "");
            Document doc = Jsoup.parse(html);
            CompNews_two.setContents(doc.text());
        }
        
//      装修攻略的新闻轮播，新闻的分类查询->装修攻略
        NewsExample newsExampleAct = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria criteriaAct = newsExampleAct.createCriteria();
        criteriaAct.andStatusNotEqualTo(3);
        criteriaAct.andTypeEqualTo("装修攻略");
//      判定是否为推送的消息
        criteriaAct.andIsHotNewsEqualTo("是");
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
	    	criteriaAct.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteriaAct.andBranchCompanyEqualTo(myBranchCompany);
		}
        newsExampleAct.setOrderByClause("news_id desc");
        News newsAct = new News();
        News newsAct_two = new News();
        if(newsMapper.selectByExample(newsExampleAct).size()>0){
        	
        	int size = newsMapper.selectByExample(newsExampleAct).size();
            newsAct = newsMapper.selectByExample(newsExampleAct).get(0);
            String html = newsAct.getContents();
            html = html.replaceAll("&nbsp;", "");
            Document doc = Jsoup.parse(html);
            newsAct.setContents(doc.text());
        }
        if(newsMapper.selectByExample(newsExampleAct).size()>1){
        	
        	newsAct_two = newsMapper.selectByExample(newsExampleAct).get(1);
            String html = newsAct.getContents();
            html = html.replaceAll("&nbsp;", "");
            Document doc = Jsoup.parse(html);
            newsAct_two.setContents(doc.text());
        }
//      装修攻略的新闻轮播，新闻的分类查询->家装日记
        NewsExample newsExampleTech = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria criteriaTech = newsExampleTech.createCriteria();
        criteriaTech.andStatusNotEqualTo(3);
//      判定是否为推送的消息
        criteriaTech.andIsHotNewsEqualTo("是");
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
	    	criteriaTech.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteriaTech.andBranchCompanyEqualTo(myBranchCompany);
		}
        criteriaTech.andTypeEqualTo("家装日记");
        newsExampleTech.setOrderByClause("news_id desc");
        News newsTech =new News();
        News newsTech_two =new News();
        if(newsMapper.selectByExample(newsExampleTech).size()>0){
        	
        	newsTech = newsMapper.selectByExample(newsExampleTech).get(0);
            String html = newsTech.getContents();
            html = html.replaceAll("&nbsp;", "");
            Document doc = Jsoup.parse(html);
            newsTech.setContents(doc.text());
        }
        if(newsMapper.selectByExample(newsExampleTech).size()>1){
        	
        	newsTech_two = newsMapper.selectByExample(newsExampleTech).get(1);
            String html = newsTech.getContents();
            html = html.replaceAll("&nbsp;", "");
            Document doc = Jsoup.parse(html);
            newsTech_two.setContents(doc.text());
        }
//      装修攻略的新闻轮播，新闻的分类查询->其他
        NewsExample newsExampleOther = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria criteriaOther = newsExampleOther.createCriteria();
        criteriaOther.andStatusNotEqualTo(3);
//      判定是否为推送的消息
        criteriaOther.andIsHotNewsEqualTo("是");
//      获取分公司的信息
	    if(null != myBranchCompany && myBranchCompany.length()>0){
			
	    	criteriaOther.andBranchCompanyEqualTo(myBranchCompany);
		}else{
			myBranchCompany = "bjsc";
			criteriaOther.andBranchCompanyEqualTo(myBranchCompany);
		}
	    criteriaOther.andTypeEqualTo("其他");
        newsExampleOther.setOrderByClause("news_id desc");
        News newsOther = new News();
        if(newsMapper.selectByExample(newsExampleOther).size()>0){
        	 newsOther = newsMapper.selectByExample(newsExampleOther).get(0);
             String html = newsOther.getContents();
             html = html.replaceAll("&nbsp;", "");
             Document doc = Jsoup.parse(html);
             newsOther.setContents(doc.text());
        }
     
        session.setAttribute("branchCompany", myBranchCompany);
        
       
        logger.debug("处理html标签");
        if(StringUtils.isNotBlank(newsOther.getContents())){
        	String con1 = Jsoup.parse(newsOther.getContents()).text();
        	newsOther.setContents(con1);
        }
        if(StringUtils.isNotBlank(CompNews.getContents())){
        	String con2 = Jsoup.parse(CompNews.getContents()).text();
        	CompNews.setContents(con2);
        }
        if(StringUtils.isNotBlank(newsAct.getContents())){
        	String con3 = Jsoup.parse(newsAct.getContents()).text();
        	newsAct.setContents(con3);
        }
        if(StringUtils.isNotBlank(newsTech.getContents())){
        	String con4 = Jsoup.parse(newsTech.getContents()).text();
        	newsTech.setContents(con4);
        }
        model.addObject("currentBCompany", myBranchCompany);
        model.addObject("newsOther",newsOther);
        model.addObject("CompNews", CompNews);
        model.addObject("newsAct", newsAct);
        model.addObject("newsTech", newsTech);
        model.addObject("CompNews_two", CompNews_two);
        model.addObject("newsAct_two", newsAct_two);
        model.addObject("newsTech_two", newsTech_two);
        model.addObject("MhomeTurn", MhomeTurn);
        model.addObject("designerLists", designerLists);
        model.addObject("CasesLists", CasesLists);
        model.addObject("newsList", newsList);
        model.setViewName("/mobile/home");
        return model;  
    }
	
}
