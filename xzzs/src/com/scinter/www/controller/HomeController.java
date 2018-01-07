package com.scinter.www.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.scinter.base.baseController.BaseController;
import com.scinter.www.dao.CaseShowImageMapper;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.CommentMapper;
import com.scinter.www.dao.CommunitysMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.FaqMapper;
import com.scinter.www.dao.HomeTurnImgMapper;
import com.scinter.www.dao.HotBuildingMapper;
import com.scinter.www.dao.HotBuildingSiteMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.CaseShowImageExample;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Communitys;
import com.scinter.www.model.CommunitysExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.Faq;
import com.scinter.www.model.FaqExample;
import com.scinter.www.model.HomeTurnImg;
import com.scinter.www.model.HomeTurnImgExample;
import com.scinter.www.model.HotBuildingSite;
import com.scinter.www.model.HotBuildingSiteExample;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.OrderInfo;
import com.scinter.www.model.OrderInfoExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.model.SysConfigExample.Criteria;
import com.scinter.www.util.HttpRequestDeviceUtils;
@Controller
public class HomeController extends BaseController{

	private Logger logger = Logger.getLogger(HomeController.class);
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private CaseShowImageMapper caseShowImageMapper;
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
	private CommentMapper commenMapper;
	@Autowired 
	private HotBuildingMapper hotbuildingMapper;
	@Autowired 
	private HotBuildingSiteMapper hotbuildingSiteMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	@Autowired
	private FaqMapper faqMapper;
	@Autowired
	private CommunitysMapper communitysMapper;
	@Autowired
	private HomeTurnImgMapper homeTurnImgMapper ;
	@Autowired
	private DesignerMapper designerMapper;
	
	@RequestMapping("/")
	public ModelAndView welcome(
			HttpServletRequest request, HttpSession session,HttpServletResponse response) throws UnsupportedEncodingException{  
		
		// 获取共有信息
		super.getPublicMes(session);
		//  获取分公司
        String branchCompany = (String) session.getAttribute("branchCompany");
        if(StringUtils.isBlank(branchCompany))
        		branchCompany = "bjxz";
        ModelAndView model = new ModelAndView();  
        model.addObject("message", "首页访问"+" 客户端IP:"+request.getRemoteAddr());

		// 获取首页合作品牌图片展示
    	SysConfigExample sysConfigExampleCoworker = new SysConfigExample();
        Criteria csysCok = sysConfigExampleCoworker.createCriteria();
        csysCok.andKeyNameEqualTo("scinter_home_coworkerImg");
        csysCok.andValueNotEqualTo("");
		csysCok.andBranchCompanyEqualTo(branchCompany);
        List<SysConfig> homeCok = sysConfigMapper.selectByExample(sysConfigExampleCoworker);
    	logger.info(homeCok.size());
    	
    	// 首页装修案例展示
        CasesExample casesExample = new CasesExample();
        com.scinter.www.model.CasesExample.Criteria criteriaCas = casesExample.createCriteria();
        criteriaCas.andCaseStatusEqualTo(1);
        criteriaCas.andIsHotCaseEqualTo("是");
		criteriaCas.andBranchCompanyEqualTo(branchCompany);
        casesExample.setOrderByClause("update_time desc");
        List<Cases> CaseList = caseMapper.selectByExample(casesExample);
        List<Cases> CasesList = new ArrayList<Cases>();
        for(Cases cases:CaseList){
        	

        	CaseShowImageExample ce = new CaseShowImageExample();
        	com.scinter.www.model.CaseShowImageExample.Criteria cc = ce.createCriteria();
        	cc.andCaseIdEqualTo(cases.getCaseId());
        	Designer designer = designerMapper.selectByPrimaryKey(cases.getDesignerId());
        	cases.setCaseThumbNumber(caseShowImageMapper.countByExample(ce));
        	cases.setDesignerPhoto(designer.getDesignerPhotoImg());
        	cases.setDesignerName(designer.getDesignerName());
        	CasesList.add(cases);
        }
        // 获取设计师信息
        DesignerExample designerExamle = new DesignerExample();
        com.scinter.www.model.DesignerExample.Criteria cd = designerExamle.createCriteria();
        cd.andDesignerPhotoImgNotEqualTo("");
        cd.andStatusEqualTo(1);
        designerExamle.setOrderByClause("update_time desc");
		cd.andBranchCompanyEqualTo(branchCompany);
        List<Designer> designerList = disignerMapper.selectByExample(designerExamle);
       
        List<Designer> designers = new ArrayList<Designer>();
		
		for(Designer designer:designerList){
			
		 	CasesExample ce = new  CasesExample();
		 	com.scinter.www.model.CasesExample.Criteria cc = ce.createCriteria();
		 	cc.andDesignerIdEqualTo(designer.getDesignerId());
		 	designer.setDesignerCases(caseMapper.countByExample(ce));
		 	designers.add(designer);
		}
        
        // 订单详情最新推送
        OrderInfoExample orderInfoExample =  new OrderInfoExample();
        com.scinter.www.model.OrderInfoExample.Criteria orderC = orderInfoExample.createCriteria();
        orderC.andStatusEqualTo(1);
        orderC.andAcreageNotEqualTo("");
        orderC.andClientNameNotEqualTo("");
        orderC.andPhoneNotEqualTo("");
        orderInfoExample.setOrderByClause("create_time desc");
        orderC.andBranchCompanyEqualTo(branchCompany);
        List<OrderInfo> orders = orderInfoMapper.selectByExample(orderInfoExample);
        
        // 在建工地
        HotBuildingSiteExample he =  new HotBuildingSiteExample();
        com.scinter.www.model.HotBuildingSiteExample.Criteria ch = he.createCriteria();
        ch.andBranchCompanyEqualTo(branchCompany);
        ch.andStatusEqualTo(1);
        he.setOrderByClause("update_time desc");
        List<HotBuildingSite>  hotBuildings = hotbuildingSiteMapper.selectByExample(he);
        
        // 热装小区
        CommunitysExample ce =  new CommunitysExample();
        com.scinter.www.model.CommunitysExample.Criteria chh = ce.createCriteria();
        chh.andBranchCompanyEqualTo(branchCompany);
        chh.andStatusEqualTo("是");
        ce.setOrderByClause("update_time desc");
        List<Communitys> communitys = communitysMapper.selectByExample(ce);
        String communityToJson = "";
        if(communitys.size()>4){
        	
        	  communityToJson =  JSON.toJSONString(communitys.subList(0, 4));
        }else{
        	
        	  communityToJson =  JSON.toJSONString(communitys);
        }
	   
	    
        //装修新闻
        NewsExample ne =  new NewsExample();
        com.scinter.www.model.NewsExample.Criteria nc = ne.createCriteria();
        nc.andStatusEqualTo(7);
        nc.andBranchCompanyEqualTo(branchCompany);
        List<News> news = newsMapper.selectByExample(ne);
        
        // 装修活动
        NewsExample ace = new NewsExample();
        com.scinter.www.model.NewsExample.Criteria acc = ace.createCriteria();
        acc.andStatusEqualTo(8);
        acc.andBranchCompanyEqualTo(branchCompany);
        ace.setOrderByClause("update_time desc");
        List<News> activitys = newsMapper.selectByExample(ace);
        
       /* // 装修知识
        FaqExample fe = new FaqExample();
        com.scinter.www.model.FaqExample.Criteria fc = fe.createCriteria();
        fc.andFaqStatusEqualTo(1);
        fc.andBranchCompanyEqualTo(branchCompany);
        fe.setOrderByClause("update_time desc");
        List<Faq> faqs = faqMapper.selectByExample(fe);*/
        
        
        //装修知识(其他)先代替装修问答
        NewsExample otherNews =new NewsExample();
		com.scinter.www.model.NewsExample.Criteria other = otherNews.createCriteria();
		other.andThumbImgNotEqualTo("");
		other.andStatusEqualTo(7);
		other.andTypeEqualTo("其他");
		other.andBranchCompanyEqualTo(branchCompany);
		otherNews.setOrderByClause("update_time desc");
		List<News> otherNewsList = newsMapper.selectByExample(otherNews);
        
        // 获取首页焦点图
 		HomeTurnImgExample hhe = new HomeTurnImgExample();
 		com.scinter.www.model.HomeTurnImgExample.Criteria homeTurnc = hhe.createCriteria();
 		homeTurnc.andStateEqualTo(0);
 		homeTurnc.andHomeimgSrcNotEqualTo("");
 		homeTurnc.andBranchCompanyEqualTo(branchCompany);
        hhe.setOrderByClause("update_time desc");
 		List<HomeTurnImg> homeTurn = homeTurnImgMapper.selectByExample(hhe);
    
 		
 		// 装修攻略
 		NewsExample newsExample =new NewsExample();
		com.scinter.www.model.NewsExample.Criteria criteria = newsExample.createCriteria();
		criteria.andThumbImgNotEqualTo("");
		criteria.andStatusEqualTo(7);
		criteria.andTypeEqualTo("装修攻略");
		criteria.andBranchCompanyEqualTo(branchCompany);
 		newsExample.setOrderByClause("update_time desc");
		List<News> decorateStrategyList = newsMapper.selectByExample(newsExample);
		
 		// 行业资讯
 		NewsExample industry =new NewsExample();
		com.scinter.www.model.NewsExample.Criteria industryC = industry.createCriteria();
		industryC.andThumbImgNotEqualTo("");
		industryC.andStatusEqualTo(7);
		industryC.andTypeEqualTo("行业资讯");
		industryC.andBranchCompanyEqualTo(branchCompany);
		industry.setOrderByClause("update_time desc");
		List<News> industryList =  newsMapper.selectByExample(industry);
		
		// 家装日记
 		NewsExample domesticOutfit =new NewsExample();
		com.scinter.www.model.NewsExample.Criteria domesticOutfitC = domesticOutfit.createCriteria();
		domesticOutfitC.andThumbImgNotEqualTo("");
		domesticOutfitC.andStatusEqualTo(7);
		domesticOutfitC.andTypeEqualTo("家装日记");
		domesticOutfitC.andBranchCompanyEqualTo(branchCompany);
		domesticOutfit.setOrderByClause("update_time desc");
		List<News> domesticOutfitList =  newsMapper.selectByExample(domesticOutfit);

		model.addObject("domesticOutfitList", domesticOutfitList);
		model.addObject("industryList", industryList);
		model.addObject("decorateStrategyList", decorateStrategyList);
 		model.addObject("activitys", activitys);
 		model.addObject("homeTurn", homeTurn);
        model.addObject("communityToJson", communityToJson);
        model.addObject("communitys", communitys);
        /*model.addObject("faqs", faqs);*/
        
        //otherNewsList(其他)代替装修问答
        model.addObject("otherNewsList", otherNewsList);
        
        model.addObject("newsList", news);
        model.addObject("hotBuildings", hotBuildings);
        model.addObject("orders", orders);
        model.addObject("designers", designers);
        model.addObject("homeCok", homeCok);   
        model.addObject("casesList", CasesList);
        model.addObject("meta",getMeta(branchCompany));
        model.setViewName("/www/home");
        return model;  
    }
	
	
	
	/*** 百度站上工具
	 * @author 张紫薇
	 * @param branchCompany
	 * @return
	 */
	public String getMeta(String branchCompany){
		String meta="";
		if(branchCompany.equals("bjxz")){
			meta="<meta name=\"baidu-site-verification\" content=\"JkN7oVJcDb\" />";
	    }
	    if(branchCompany.equals("tjxz")){
	    	meta="<meta name=\"baidu-site-verification\" content=\"dt3YJmecR2\" />";
	    }
	    if(branchCompany.equals("lfxz")){
	    	meta="<meta name=\"baidu-site-verification\" content=\"VfIDGiJQHE\" />";
	    }
	    if(branchCompany.equals("sjzxz")){
	    	meta="<meta name=\"baidu-site-verification\" content=\"z7L7BjHNjF\" />";
	    }
	    if(branchCompany.equals("tsxz")){
	    	meta="<meta name=\"baidu-site-verification\" content=\"SyZH0ItpeK\" />";
	    }
	    if(branchCompany.equals("bdxz")){
	    	meta="<meta name=\"baidu-site-verification\" content=\"RE3yMfIvcA\" />";
	    }
	    if(branchCompany.equals("cqxz")){
	    	meta="<meta name=\"baidu-site-verification\" content=\"JkN7oVJcDb\" />";
	    }
	    if(branchCompany.equals("hfxz")){
	    	meta="<meta name=\"baidu-site-verification\" content=\"JkN7oVJcDb\" />";
	    }
	    if(branchCompany.equals("jnxz")){
	    	meta="<meta name=\"baidu-site-verification\" content=\"EoPkDdLaV5\" />";
	    }
	    if(branchCompany.equals("tyxz")){
	    	meta="<meta name=\"baidu-site-verification\" content=\"brfCtXa0Uc\" />";
	    }
	    if(branchCompany.equals("zzxz")){
	    	meta="<meta name=\"baidu-site-verification\" content=\"4HyoWwG03p\" />";
	    }
	    if(branchCompany.equals("czxz")){
	    	meta="<meta name=\"baidu-site-verification\" content=\"S2BsNGoxcb\" />";
	    }
	    
		return meta;
	}
}
