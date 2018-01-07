package com.scinter.www.controller;

import java.io.UnsupportedEncodingException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.base.controller.BaseController;
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
import com.scinter.www.model.HomeTurnImg;
import com.scinter.www.model.HomeTurnImgExample;
import com.scinter.www.model.HotBuilding;
import com.scinter.www.model.HotBuildingExample;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.SysConfigExample.Criteria;
@Controller
public class HomeController extends BaseController{

	private Logger logger = Logger.getLogger(HomeController.class);
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
	public ModelAndView welcome(
			@RequestParam(value="caseAcreage",required=false,defaultValue="") String caseAcreage,
			@RequestParam(value="casesType",required=false,defaultValue="") String casesType,
			HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException{  
		
		ModelAndView model = new ModelAndView();  
	    model.addObject("message", "首页访问"+" 客户端IP:"+request.getRemoteAddr());
//	       配置公共的三创展示信息
	    super.getHomeMessage(request,session);
//      获取分公司
        String branchCompany = (String) session.getAttribute("branchCompany");
//		将参数转码
		caseAcreage = new String(caseAcreage.getBytes("ISO-8859-1"),"utf-8");
		casesType = new String(casesType.getBytes("ISO-8859-1"),"utf-8");
//		初始化参数
		if(StringUtils.isBlank(caseAcreage)){
			caseAcreage = "全部";
		}
		if(StringUtils.isBlank(casesType)){
			casesType = "全部";
		}
//		从session 中获取户型，风格，面积，组合查询
		String SessionCaseAcreage = (String) session.getAttribute("caseAcreageHome");
		String SessionCasesType = (String) session.getAttribute("casesTypeHome");
//		将session中的值初始化
		if(StringUtils.isBlank(SessionCasesType)){
			SessionCasesType = "全部";
		}
		if(StringUtils.isBlank(SessionCaseAcreage)){
			SessionCaseAcreage = "全部";
		}
	    if(!SessionCasesType.equals(casesType)){
	    	session.setAttribute("casesTypeHome", casesType);
			SessionCasesType = (String) session.getAttribute("casesTypeHome");
		}else{
			session.setAttribute("casesTypeHome", casesType);
		}
		if(!SessionCaseAcreage.equals(caseAcreage)){
			session.setAttribute("caseAcreageHome", caseAcreage);
			SessionCaseAcreage = (String) session.getAttribute("caseAcreageHome");
		}else{
			session.setAttribute("caseAcreageHome", caseAcreage);
		}
//      获取首页焦点图
		HomeTurnImgExample he = new HomeTurnImgExample();
		com.scinter.www.model.HomeTurnImgExample.Criteria homeTurnc = he.createCriteria();
		homeTurnc.andStateEqualTo(0);
		homeTurnc.andHomeimgSrcNotEqualTo("");
		if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
			
				homeTurnc.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				homeTurnc.andBranchCompanyEqualTo(branchCompany);
			}
        he.setOrderByClause("update_time desc");
		List<HomeTurnImg> homeTurn = homeTurnImgMapper.selectByExample(he);
		
//      获取首页装修风格图片(抽屉式效果)
    	SysConfigExample sysConfigExampleDecorate = new SysConfigExample();
        Criteria csysDec = sysConfigExampleDecorate.createCriteria();
        csysDec.andKeyNameEqualTo("scinter_home_decorateImgs");
        csysDec.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csysDec.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csysDec.andBranchCompanyEqualTo(branchCompany);
		}
        List<SysConfig> homeDec = sysConfigMapper.selectByExample(sysConfigExampleDecorate);
		
//      获取首页合作品牌图片展示
    	SysConfigExample sysConfigExampleCoworker = new SysConfigExample();
        Criteria csysCok = sysConfigExampleCoworker.createCriteria();
        csysCok.andKeyNameEqualTo("scinter_home_coworkerImg");
        csysCok.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csysCok.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csysCok.andBranchCompanyEqualTo(branchCompany);
		}
        List<SysConfig> homeCok = sysConfigMapper.selectByExample(sysConfigExampleCoworker);
//      合作品牌自动补全，为5的整数倍
    	int num = 5 - homeCok.size() % 5;
    	int size = homeCok.size();
    	for(int scro=0;scro<num; scro++){
    		if(scro<homeCok.size()){
    			for(int j=0;j<num && j<size;j++){
    				// 防止下标溢出
    				if(homeCok.size()<size+num){
    					homeCok.add(homeCok.get(j));
    				}else{
    					break;
    				}
    			}
    		}
    	}

//      首页装修攻略的展示
        NewsExample newsExample = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria criteria = newsExample.createCriteria();
        criteria.andStatusNotEqualTo(3);
//      获取分公司的信息
		if(null != branchCompany && branchCompany.length()>0){
			
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
        criteria.andIsHotNewsEqualTo("是");
      
        newsExample.setOrderByClause("news_id desc");
        List<News> newsLists = newsMapper.selectByExample(newsExample);
        List<News> newsList =new ArrayList<News>();
        if(null!=newsLists && newsLists.size()>0){
	        for(int i=0; i<newsLists.size() && i<4; i++){
	        	News news = new News();
	        	news = newsLists.get(i);
	        	newsList.add(news);
	        }
        }
        
//      首页装修楼盘展示
        HotBuildingExample hotBuildingExample = new HotBuildingExample();
        com.scinter.www.model.HotBuildingExample.Criteria criteriaHot = hotBuildingExample.createCriteria();
        criteriaHot.andStatusNotEqualTo(3);
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
	    	criteriaHot.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			criteriaHot.andBranchCompanyEqualTo(branchCompany);
		}
        newsExample.setOrderByClause("buliding_id desc");
        List<HotBuilding> BuildingLists = hotBuildingMapper.selectByExample(hotBuildingExample);
        List<HotBuilding> BuildingList =new ArrayList<HotBuilding>();
        if(null!=BuildingLists && BuildingLists.size()>0){
	        for(int i=0; i<BuildingLists.size() && i<5; i++){
	        	HotBuilding hotBuilding = new HotBuilding();
	        	hotBuilding = BuildingLists.get(i);
	        	BuildingList.add(hotBuilding);
	        }
        }
        
//      首页装修案例展示
        CasesExample casesExample = new CasesExample();
        com.scinter.www.model.CasesExample.Criteria criteriaCas = casesExample.createCriteria();
        criteriaCas.andCaseStatusNotEqualTo(3);
//      判定是否为推送的消息
        criteriaCas.andIsHotCaseEqualTo("是");
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
	    	criteriaCas.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			criteriaCas.andBranchCompanyEqualTo(branchCompany);
		}
//	       添加分类查询条件
	    if(StringUtils.isNotBlank(SessionCaseAcreage) && !SessionCaseAcreage.equals("全部") ){
	    	criteriaCas.andCaseAcreageEqualTo(Double.valueOf(SessionCaseAcreage));
		}
	    if(StringUtils.isNotBlank(SessionCasesType) && !SessionCasesType.equals("全部") ){
	    	criteriaCas.andCaseHouseTypeEqualTo(SessionCasesType);
		}
        casesExample.setOrderByClause("update_time desc");
        List<Cases> CasesLists = caseMapper.selectByExample(casesExample);
        List<Cases> CasesList =new ArrayList<Cases>();
        if(null!=CasesLists && CasesLists.size()>0){
        	
	        for(int i=0; i<CasesLists.size() && i<5; i++){ 
	        	Cases cases = new Cases();
	        	cases = CasesLists.get(i);
	        	Designer designer = disignerMapper.selectByPrimaryKey(cases.getDesignerId());
	        	cases.setDesignerPhotoImg(designer.getDesignerPhotoImg());
	        	cases.setDesignerTitle(designer.getDesignerTitle());
	        	CasesList.add(cases);
	        }
        }
        
        
//      装修攻略的新闻轮播，新闻的分类查询->行业资讯
        NewsExample newsExampleCpnews = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria criteriaCpnews = newsExampleCpnews.createCriteria();
        criteriaCpnews.andStatusEqualTo(1);
        criteriaCpnews.andTypeEqualTo("行业资讯");
//      判定是否为推送消息
        criteriaCpnews.andIsHotNewsEqualTo("是"); 
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
	    	criteriaCpnews.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			criteriaCpnews.andBranchCompanyEqualTo(branchCompany);
		}
        newsExampleCpnews.setOrderByClause("news_id desc");
        
        List<News> CompNewsList = newsMapper.selectByExample(newsExampleCpnews);
        List<News> CompNewsLists = new ArrayList<News>();
        
        if(null != CompNewsList && CompNewsList.size()>0){
        	
        	for(int i=0; i<CompNewsList.size() && i<3;i++){
	        	if(null != CompNewsList.get(i).getContents() && CompNewsList.get(i).getContents().length()>0){

	            	String html = CompNewsList.get(i).getContents();
	    			Document doc =Jsoup.parse(html);
	    			CompNewsList.get(i).setContents( doc.text());
	        	}
            	CompNewsLists.add(CompNewsList.get(i));
            }      	
        }
        
//      装修攻略的新闻轮播，新闻的分类查询->装修攻略
        NewsExample newsExampleAct = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria criteriaAct = newsExampleAct.createCriteria();
        criteriaAct.andStatusEqualTo(1);
        criteriaAct.andTypeEqualTo("装修攻略");
//      判定是否为推送的消息
        criteriaAct.andIsHotNewsEqualTo("是");
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
	    	criteriaAct.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			criteriaAct.andBranchCompanyEqualTo(branchCompany);
		}
        newsExampleAct.setOrderByClause("news_id desc");
        List<News> newsActList = newsMapper.selectByExample(newsExampleAct);
        List<News> newsActLists = new ArrayList<News>();
        if(null != newsActList && newsActList.size()>0){
        	
	        for(int i=0; i<newsActList.size() && i<3;i++){
	        	if(null != newsActList.get(i).getContents() && newsActList.get(i).getContents().length()>0){
	        		String html = newsActList.get(i).getContents();
					Document doc =Jsoup.parse(html);
					newsActList.get(i).setContents( doc.text());
	        	}
	        	newsActLists.add(newsActList.get(i));
	        	
	        }
        }   
//      装修攻略的新闻轮播，新闻的分类查询->家装日记
        NewsExample newsExampleTech = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria criteriaTech = newsExampleTech.createCriteria();
        criteriaTech.andStatusEqualTo(1);
//      判定是否为推送的消息
        criteriaTech.andIsHotNewsEqualTo("是");
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
	    	criteriaTech.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			criteriaTech.andBranchCompanyEqualTo(branchCompany);
		}
        criteriaTech.andTypeEqualTo("家装日记");
        newsExampleTech.setOrderByClause("news_id desc");
        List<News> newsTechsList = newsMapper.selectByExample(newsExampleTech);
        List<News> newsTechsLists = new ArrayList<News>();
        
        if(null != newsTechsList && newsTechsList.size()>0){
        	
			for(int i=0; i<newsTechsList.size() && i<3;i++){
				if(null != newsTechsList.get(i).getContents()){
					String html = newsTechsList.get(i).getContents();
					Document doc =Jsoup.parse(html);
					newsTechsList.get(i).setContents( doc.text());    	
				}
				newsTechsLists.add(newsTechsList.get(i));
					
	        }
        }
//      将信息保存到session中
        session.setAttribute("branchCompany", branchCompany);
        model.addObject("homeDec", homeDec);
        model.addObject("homeCok", homeCok);   
        model.addObject("homeTurn", homeTurn);
        model.addObject("currentBCompany", branchCompany);
        model.addObject("newsTechsLists", newsTechsLists);
        model.addObject("newsActLists", newsActLists);
        model.addObject("CompNewsLists", CompNewsLists);
        model.addObject("BuildingList", BuildingList);
        model.addObject("CasesList", CasesList);
        model.addObject("newsList", newsList);
        model.setViewName("www/home");
        return model;  
    }
}
