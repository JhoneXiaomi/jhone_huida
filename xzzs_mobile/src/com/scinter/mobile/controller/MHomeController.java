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

import com.scinter.mBase.controller.MbaseController;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.CommunitysMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.HomeTurnImgMapper;
import com.scinter.www.dao.HotBuildingMapper;
import com.scinter.www.dao.HotBuildingSiteMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.HomeTurnImg;
import com.scinter.www.model.HomeTurnImgExample;
import com.scinter.www.model.HotBuilding;
import com.scinter.www.model.HotBuildingExample;
import com.scinter.www.model.HotBuildingSite;
import com.scinter.www.model.HotBuildingSiteExample;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;

@Controller
public class MHomeController extends MbaseController{

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
	private CommunitysMapper communitysMapper;
	@Autowired
	private HotBuildingSiteMapper hotbuildingSiteMapper;
	@Autowired
	private HomeTurnImgMapper homeTurnImgMapper;
	
	@RequestMapping("/")
	public ModelAndView welcome(HttpServletRequest request,HttpSession session){ 
		
		super.getPublicMes(request, session);
		ModelAndView model = new ModelAndView();  
		logger.info("welcome mobile");
		String branchCompany	= (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany))
			branchCompany  = "bjxz";
        
		// 获取首页焦点图
 		HomeTurnImgExample hhe = new HomeTurnImgExample();
 		com.scinter.www.model.HomeTurnImgExample.Criteria homeTurnc = hhe.createCriteria();
 		homeTurnc.andStateEqualTo(2);
 		homeTurnc.andHomeimgSrcNotEqualTo("");
 		homeTurnc.andBranchCompanyEqualTo(branchCompany);
        hhe.setOrderByClause("update_time desc");
 		List<HomeTurnImg> MhomeTurn = homeTurnImgMapper.selectByExample(hhe);

//      首页装修攻略的展示
        NewsExample newsExample = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria criteria = newsExample.createCriteria();
        criteria.andStatusNotEqualTo(3);
//		分公司查询
	    if(null != branchCompany && branchCompany.length()>0){
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjxz";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
        newsExample.setOrderByClause("news_id desc");
        List<News> newsLists = newsMapper.selectByExample(newsExample);
        List<News> newsList =new ArrayList<News>();
        for(int i=0; i<newsLists.size() && i<4; i++){
        	News news = new News();
        	news = newsLists.get(i);
        	newsList.add(news);
        }
        
        // 首页设计师展示
        DesignerExample designerExample = new DesignerExample();
        com.scinter.www.model.DesignerExample.Criteria criteriaper = designerExample.createCriteria();
        criteriaper.andStatusNotEqualTo(3);
        criteriaper.andDesignerPhotoImgNotEqualTo("");
		criteriaper.andBranchCompanyEqualTo(branchCompany);
        newsExample.setOrderByClause("designer_id desc");
        List<Designer> designerLists = disignerMapper.selectByExample(designerExample);
     
        
//      首页装修案例展示
        CasesExample casesExample = new CasesExample();
        com.scinter.www.model.CasesExample.Criteria criteriaCas = casesExample.createCriteria();
        criteriaCas.andCaseThumbImgNotEqualTo("");
        criteriaCas.andCaseStatusNotEqualTo(3);
        criteriaCas.andIsHotCaseEqualTo("是");
//		分公司查询
	    if(null != branchCompany && branchCompany.length()>0){
	    	criteriaCas.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjxz";
			criteriaCas.andBranchCompanyEqualTo(branchCompany);
		}
        casesExample.setOrderByClause("case_id desc");
        List<Cases> CasesLists = caseMapper.selectByExample(casesExample);
        /*热点专题*/
        NewsExample newsExampleTech = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria criteriaTech = newsExampleTech.createCriteria();
        criteriaTech.andStatusNotEqualTo(3);
        // 判定是否为推送的消息
        criteriaTech.andIsHotNewsEqualTo("是");
        // 获取分公司的信息
	    if(StringUtils.isNotBlank(branchCompany)){
			
	    	criteriaTech.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjxz";
			criteriaTech.andBranchCompanyEqualTo(branchCompany);
		}
	   
        newsExampleTech.setOrderByClause("news_id desc");
        List<News> hotTitles =  newsMapper.selectByExample(newsExampleTech);
        List<News> hotTitle =new ArrayList<News>();
        for(News news:hotTitles){
        	String html = news.getContents();
            html = html.replaceAll("&nbsp;", "");
            Document doc = Jsoup.parse(html);
            news.setContents(doc.text());
            hotTitle.add(news);
        }
        
        // 装修新闻
        NewsExample cn =new NewsExample();
        com.scinter.www.model.NewsExample.Criteria ccn = cn.createCriteria();
		ccn.andThumbImgNotEqualTo("");
		ccn.andStatusEqualTo(7);
		ccn.andBranchCompanyEqualTo(branchCompany);
		cn.setOrderByClause("create_time desc");
        List<News> decStrategyList = newsMapper.selectByExample(cn);
        
        /*手机站装修楼盘的信息展示*/
        HotBuildingExample he = new HotBuildingExample();
        com.scinter.www.model.HotBuildingExample.Criteria hc =  he.createCriteria();
        hc.andStatusNotEqualTo(3);
        hc.andBranchCompanyEqualTo(branchCompany);
        he.setOrderByClause("create_time desc");
        List<HotBuilding> buildingList = hotBuildingMapper.selectByExample(he);
        
        // 装修活动
        NewsExample ace = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria acc = ace.createCriteria();
        acc.andStatusEqualTo(8);
        acc.andBranchCompanyEqualTo(branchCompany);
        List<News> activitys = newsMapper.selectByExample(ace);
        
        // 在建工地
        HotBuildingSiteExample hote =  new HotBuildingSiteExample();
        com.scinter.www.model.HotBuildingSiteExample.Criteria ch = hote.createCriteria();
        ch.andBranchCompanyEqualTo(branchCompany);
        ch.andStatusEqualTo(1);
        he.setOrderByClause("update_time desc");
        List<HotBuildingSite>  hotBuildings = hotbuildingSiteMapper.selectByExample(hote);
        
        model.addObject("hotBuildings", hotBuildings);
        model.addObject("activitys", activitys);
        model.addObject("decStrategyList",decStrategyList);
        model.addObject("buildingList", buildingList);
        model.addObject("hotTitle", hotTitle);
        model.addObject("buildingList", buildingList);
        model.addObject("branchCompany", branchCompany);
        model.addObject("MhomeTurn", MhomeTurn);
        model.addObject("designerLists", designerLists);
        model.addObject("CasesLists", CasesLists);
        model.addObject("newsList", newsList);
        model.setViewName("mobile/home");;
        return model;  
    }
	
}
