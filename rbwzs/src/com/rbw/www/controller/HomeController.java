package com.rbw.www.controller;

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

import com.rbw.base.controller.BaseController;
import com.rbw.www.dao.CasesMapper;
import com.rbw.www.dao.DesignerMapper;
import com.rbw.www.dao.FaqMapper;
import com.rbw.www.dao.HomeTurnImgMapper;
import com.rbw.www.dao.HotBuildingMapper;
import com.rbw.www.dao.NewsMapper;
import com.rbw.www.dao.OrderInfoMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.model.Cases;
import com.rbw.www.model.CasesExample;
import com.rbw.www.model.Designer;
import com.rbw.www.model.DesignerExample;
import com.rbw.www.model.Faq;
import com.rbw.www.model.FaqExample;
import com.rbw.www.model.HomeTurnImg;
import com.rbw.www.model.HomeTurnImgExample;
import com.rbw.www.model.HotBuilding;
import com.rbw.www.model.HotBuildingExample;
import com.rbw.www.model.News;
import com.rbw.www.model.NewsExample;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.model.SysConfigExample.Criteria;
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
	private FaqMapper faqMapper;
	@Autowired 
	private HotBuildingMapper hotbuildingMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	@Autowired
	private HomeTurnImgMapper homeTurnImgMapper;
	@RequestMapping("/")
	public ModelAndView welcome(
			@RequestParam(value="caseAcreage",required=false,defaultValue="") String caseAcreage,
			@RequestParam(value="casesType",required=false,defaultValue="") String casesType,
			HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException{  
		
		// 获取共有信息
		super.getHomeMessage(request, session);
		//  获取分公司
        String branchCompany = (String) session.getAttribute("branchCompany");
        if(StringUtils.isBlank(branchCompany)){
        	branchCompany = "sjzbw1";
        }
        // 将参数转码
		caseAcreage = new String(caseAcreage.getBytes("ISO-8859-1"),"utf-8");
		casesType = new String(casesType.getBytes("ISO-8859-1"),"utf-8");
		// 初始化参数
		if(StringUtils.isBlank(caseAcreage)){
			caseAcreage = "全部";
		}
		if(StringUtils.isBlank(casesType)){
			casesType = "全部";
		}
		// 从session 中获取户型，风格，面积，组合查询
		String SessionCaseAcreage = (String) session.getAttribute("caseAcreageHome");
		String SessionCasesType = (String) session.getAttribute("casesTypeHome");
		// 将session中的值初始化
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
		
        ModelAndView model = new ModelAndView();  
        model.addObject("message", "首页访问"+" 客户端IP:"+request.getRemoteAddr());

        // 获取首页焦点图
		HomeTurnImgExample he = new HomeTurnImgExample();
		com.rbw.www.model.HomeTurnImgExample.Criteria homeTurnc = he.createCriteria();
		homeTurnc.andStateEqualTo(0);
		homeTurnc.andHomeimgSrcNotEqualTo("");
		homeTurnc.andBranchCompanyEqualTo(branchCompany);
        he.setOrderByClause("update_time desc");
		List<HomeTurnImg> homeTurn = homeTurnImgMapper.selectByExample(he);
		
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
        com.rbw.www.model.CasesExample.Criteria criteriaCas = casesExample.createCriteria();
        criteriaCas.andCaseStatusEqualTo(1);
        // 判定是否为推送的消息
        criteriaCas.andIsHotCaseEqualTo("是");
        // 获取分公司的信息
		criteriaCas.andBranchCompanyEqualTo(branchCompany);
	    // 添加分类查询条件
	    if(StringUtils.isNotBlank(SessionCaseAcreage) && !SessionCaseAcreage.equals("全部") ){
	    	criteriaCas.andCaseAcreageEqualTo(Double.valueOf(SessionCaseAcreage));
		}
	    if(StringUtils.isNotBlank(SessionCasesType) && !SessionCasesType.equals("全部") ){
	    	criteriaCas.andCaseHouseTypeEqualTo(SessionCasesType);
		}
        casesExample.setOrderByClause("update_time desc");
        List<Cases> CasesList = caseMapper.selectByExample(casesExample);
        
        // 定义首页的轮播图的数量轮播次数
        Integer  number = CasesList.size();
        if(number!=0){
        	if(number%6==0){
        		number = (number/6)-1;
        	}else{
        		number = number/6;
        	}
        }else{
        	number = 0;
        }
        
        logger.info("the number of casesList is :"+CasesList.size()+"The size of number is:"+number);
        // 装修风格
        CasesExample caseStyleExample = new CasesExample();
        com.rbw.www.model.CasesExample.Criteria criteriaStyleCas = caseStyleExample.createCriteria();
        criteriaStyleCas.andCaseStatusEqualTo(5);
        // 判定是否为推送的消息
        criteriaStyleCas.andIsHotCaseEqualTo("是");
        // 获取分公司的信息
        criteriaStyleCas.andBranchCompanyEqualTo(branchCompany);
        casesExample.setOrderByClause("update_time desc");
        List<Cases> CaseStyleList = caseMapper.selectByExample(caseStyleExample);
        
        // 获取设计师信息
        DesignerExample designerExamle = new DesignerExample();
        com.rbw.www.model.DesignerExample.Criteria cd = designerExamle.createCriteria();
        cd.andDesignerPhotoImgNotEqualTo("");
        cd.andStatusNotEqualTo(3);
        cd.andBranchCompanyEqualTo(branchCompany);
        designerExamle.setOrderByClause("update_time desc");
        List<Designer> designers = disignerMapper.selectByExample(designerExamle);
        
        // 常见问题信息展示
        FaqExample faqExample = new FaqExample();
        com.rbw.www.model.FaqExample.Criteria cf = faqExample.createCriteria();
        cf.andFaqDescNotEqualTo("");
        cf.andFaqStatusNotEqualTo(3);
        faqExample.setOrderByClause("update_time desc");
	    cf.andBranchCompanyEqualTo(branchCompany);
        List<Faq> faqs = faqMapper.selectByExample(faqExample);
        
        // 热装楼盘
        HotBuildingExample  hotBuildingE = new HotBuildingExample();
        com.rbw.www.model.HotBuildingExample.Criteria criterHot = hotBuildingE.createCriteria();
        criterHot.andBulidingThumbImgNotEqualTo("");
        criterHot.andStatusEqualTo(1);
        hotBuildingE.setOrderByClause("update_time desc");
	    criterHot.andBranchCompanyEqualTo(branchCompany);
        List<HotBuilding> buildings = hotbuildingMapper.selectByExample(hotBuildingE);
        
        // 装修攻略 
        NewsExample  newStrtagy = new NewsExample();
        com.rbw.www.model.NewsExample.Criteria newStage =  newStrtagy.createCriteria();
        newStage.andStatusEqualTo(5);
        newStage.andTypeEqualTo("装修攻略");
        newStage.andIsHotNewsEqualTo("是");
	    newStage.andBranchCompanyEqualTo(branchCompany);
        List<News> newStrtagyList = newsMapper.selectByExample(newStrtagy);
        List<News> newStrtagys = new ArrayList<News>();
        for(News mynews:newStrtagyList){
			if(null !=mynews.getContents() && mynews.getContents().length()>0 ){
				String html = mynews.getContents();
				Document doc =Jsoup.parse(html);
				mynews.setContents(doc.text());
			}
			newStrtagys.add(mynews);
		}
        // 装修日记
        NewsExample  newDialog = new NewsExample();
        com.rbw.www.model.NewsExample.Criteria newDialogc =  newDialog.createCriteria();
        newDialogc.andStatusEqualTo(5);
        newDialogc.andTypeEqualTo("家装日记");
        newDialogc.andIsHotNewsEqualTo("是");
        newDialogc.andBranchCompanyEqualTo(branchCompany);
        List<News> newDialogs = newsMapper.selectByExample(newDialog);
        
        // 首页装修效果图
        CasesExample caseXImgE = new CasesExample();
        com.rbw.www.model.CasesExample.Criteria caseXImgC = caseXImgE.createCriteria();
        caseXImgC.andCaseStatusEqualTo(4);
        caseXImgC.andIsHotCaseEqualTo("是");
        caseXImgC.andBranchCompanyEqualTo(branchCompany);
        caseXImgE.setOrderByClause("update_time desc");
        List<Cases>  caseXImgs = caseMapper.selectByExample(caseXImgE);
        model.addObject("number",number);
        model.addObject("CaseStyleList", CaseStyleList);
        model.addObject("caseXImgs", caseXImgs);
        model.addObject("newDialogs", newDialogs);
        model.addObject("newStrtagys", newStrtagys);
        model.addObject("buildings", buildings);
        model.addObject("designers", designers);
        model.addObject("faqs", faqs);
        model.addObject("branchCompany", branchCompany);
        model.addObject("homeCok", homeCok);   
        model.addObject("homeTurn", homeTurn);
        model.addObject("CasesList", CasesList);
        model.setViewName("/www/home");
        return model;  
    }
}
