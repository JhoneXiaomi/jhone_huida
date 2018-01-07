package com.scinter.www.controller;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import com.scinter.www.dao.CaseShowImageMapper;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.model.CaseShowImage;
import com.scinter.www.model.CaseShowImageExample;
import com.scinter.www.model.CaseShowImageExample.Criteria;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.News;
import com.scinter.www.model.NewsExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.util.Page;

@Controller
public class CaseController extends BaseController{

	private Logger logger = Logger.getLogger(CaseController.class);

	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private CaseShowImageMapper caseImgMapper;//案例包含图片的dao操作对象
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	/**
	 * 实现装修案例的列表页信息的展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "cases/p{page}")
	public ModelAndView caseMessage(
			@RequestParam(value="caseStyle",required=false,defaultValue="") String caseStyle,
			@RequestParam(value="caseAcreage",required=false,defaultValue="") String caseAcreage,
			@RequestParam(value="casesType",required=false,defaultValue="") String casesType,
			@PathVariable("page") int page,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		/*配置公有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
//		将参数转码
		caseStyle = new String(caseStyle.getBytes("ISO-8859-1"),"utf-8");
		caseAcreage = new String(caseAcreage.getBytes("ISO-8859-1"),"utf-8");
		casesType = new String(casesType.getBytes("ISO-8859-1"),"utf-8");
//		初始化参数
		if(StringUtils.isBlank(caseStyle)){
			caseStyle = "全部";
		}
		if(StringUtils.isBlank(caseAcreage)){
			caseAcreage = "全部";
		}
		if(StringUtils.isBlank(casesType)){
			casesType = "全部";
		}
//		从session 中获取户型，风格，面积，组合查询
		String SessionCaseStyle = (String) session.getAttribute("caseStyle");
		String SessionCaseAcreage = (String) session.getAttribute("caseAcreage");
		String SessionCasesType = (String) session.getAttribute("casesType");
//		将session中的值初始化
		if(StringUtils.isBlank(SessionCaseStyle)){
			SessionCaseStyle = "全部";
		}
		if(StringUtils.isBlank(SessionCasesType)){
			SessionCasesType = "全部";
		}
		if(StringUtils.isBlank(SessionCaseAcreage)){
			SessionCaseAcreage = "全部";
		}
		if(!SessionCaseStyle.equals(caseStyle)){
			session.setAttribute("caseStyle", caseStyle);
			SessionCaseStyle = (String) session.getAttribute("caseStyle");
		}else{
			session.setAttribute("caseStyle", caseStyle);
		}
	    if(!SessionCasesType.equals(casesType)){
	    	session.setAttribute("casesType", casesType);
			SessionCasesType = (String) session.getAttribute("casesType");
		}else{
			session.setAttribute("casesType", casesType);
		}
		if(!SessionCaseAcreage.equals(caseAcreage)){
			session.setAttribute("caseAcreage", caseAcreage);
			SessionCaseAcreage = (String) session.getAttribute("caseAcreage");
		}else{
			session.setAttribute("caseAcreage", caseAcreage);
		}
		int rows = 20;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
		CasesExample cs =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria = cs.createCriteria();
//		图例为空的将不会显示
		criteria.andCaseThumbImgNotEqualTo("");
//		非删除状态
		criteria.andCaseStatusNotEqualTo(3);
		criteria.andCaseStatusNotEqualTo(4);
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
       // 添加分类查询条件
	    if(StringUtils.isNotBlank(SessionCaseStyle) && !SessionCaseStyle.equals("全部") ){
			
			criteria.andCaseStyleEqualTo(SessionCaseStyle);
		}
	    if(StringUtils.isNotBlank(SessionCaseAcreage) && !SessionCaseAcreage.equals("全部")
	    		&& !SessionCaseAcreage.equals("其他") && !SessionCaseAcreage.equals("150平米以上")){
	    	// 切分面积字符串实现面积的分段查询
	    	String[] ss = SessionCaseAcreage.split("-");
	        String begin = ss[0];
	        String end = ss[1];
    	    Pattern p=Pattern.compile("(\\d+)");  
    	    Matcher m=p.matcher(end);      
    	    if(m.find()){
    	    	logger.info(m.group(1));   
    	    } 
	    	criteria.andCaseAcreageBetween(Double.valueOf(begin),Double.valueOf(m.group(1)));
		}else if(SessionCaseAcreage.equals("150平米以上")){
			 Pattern p=Pattern.compile("(\\d+)");  
    	     Matcher m=p.matcher(SessionCaseAcreage);      
    	     if(m.find()){
    	       logger.info(m.group(1));   
    	     } 
			criteria.andCaseAcreageGreaterThanOrEqualTo(Double.valueOf(m.group(1)));
		}else if(SessionCaseAcreage.equals("其他")){
			String min= "50";
			criteria.andCaseAcreageLessThanOrEqualTo(Double.valueOf(min));
		}
	    if(StringUtils.isNotBlank(SessionCasesType) && !SessionCasesType.equals("全部") ){
			
			criteria.andCaseHouseTypeEqualTo(SessionCasesType);
		}
		int totalNums = caseMapper.countByExample(cs);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		cs.setPage(p);
//		排序	
		cs.setOrderByClause("create_time desc");
		List<Cases> caseList = caseMapper.selectByExample(cs);
		List<Cases> listCases = new ArrayList<Cases>(); 
		for(Cases cases: caseList){
			Designer designer = designerMapper.selectByPrimaryKey(cases.getDesignerId());
//		防止 designer 为空的判断
			if(null != designer){
				cases.setDesignerPhotoImg(designer.getDesignerPhotoImg());			
			}
			listCases.add(cases);
		}
		
//		新闻信息的获取
		NewsExample newsExample = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
//		筛选非删除状态的新闻信息
		creNew.andStatusNotEqualTo(3);
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
		 creNew.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			creNew.andBranchCompanyEqualTo(branchCompany);
		}
		List<News> listNews = newsMapper.selectByExample(newsExample);
		/*获取案例列表页SEO 的配置信息*/
	      
	      // SEO 标题信息
	      SysConfigExample scinterCasesSeoTitleStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterCasesSeoTitleStrC = scinterCasesSeoTitleStrE.createCriteria();
	      scinterCasesSeoTitleStrC.andKeyNameEqualTo("Scinter_cases_seoTitle_str");
	      scinterCasesSeoTitleStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  scinterCasesSeoTitleStrC.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				scinterCasesSeoTitleStrC.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig scinterCasesSeoTitleStr= null;
	      if(sysConfigMapper.selectByExample(scinterCasesSeoTitleStrE).size()> 0){
	    	  scinterCasesSeoTitleStr = sysConfigMapper.selectByExample(scinterCasesSeoTitleStrE).get(0);
	      }
	      
	      // SEO 关键字信息 
	      SysConfigExample scinterCasesSeoKeywordStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterCasesSeoKeywordStrC = scinterCasesSeoKeywordStrE.createCriteria();
	      scinterCasesSeoKeywordStrC.andKeyNameEqualTo("Scinter_cases_seoKeyword_str");
	      scinterCasesSeoKeywordStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  scinterCasesSeoKeywordStrC.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				scinterCasesSeoKeywordStrC.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig scinterCasesSeoKeywordStr= null;
	      if(sysConfigMapper.selectByExample(scinterCasesSeoKeywordStrE).size()> 0){
	    	  
	    	  scinterCasesSeoKeywordStr = sysConfigMapper.selectByExample(scinterCasesSeoKeywordStrE).get(0);
	      }
	      
	      // SEO 描述信息
	      SysConfigExample scinterCasesSeoDescStrE = new SysConfigExample();
	      com.scinter.www.model.SysConfigExample.Criteria scinterCasesSeoDescStrC = scinterCasesSeoDescStrE.createCriteria();
	      scinterCasesSeoDescStrC.andKeyNameEqualTo("Scinter_cases_seoDesc_str");
	      scinterCasesSeoDescStrC.andValueNotEqualTo("");
	      if(StringUtils.isNotBlank(branchCompany)){
	    	  scinterCasesSeoDescStrC.andBranchCompanyEqualTo(branchCompany);
			}else{
				branchCompany = "bjsc";
				scinterCasesSeoDescStrC.andBranchCompanyEqualTo(branchCompany);
			}
	      SysConfig scinterCasesSeoDescStr= null;
	      if(sysConfigMapper.selectByExample(scinterCasesSeoDescStrE).size()> 0){
	      	
	    	  scinterCasesSeoDescStr = sysConfigMapper.selectByExample(scinterCasesSeoDescStrE).get(0);
	      }
	    model.addObject("scinterCasesSeoTitleStr", scinterCasesSeoTitleStr);
	    model.addObject("scinterCasesSeoKeywordStr", scinterCasesSeoKeywordStr);
	    model.addObject("scinterCasesSeoDescStr", scinterCasesSeoDescStr);  
		model.addObject("currentBCompany", branchCompany);
		model.addObject("page", p);
		model.addObject("listCases", listCases);
		model.addObject("listNews", listNews);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/cases");
		logger.info("成功实现案例查询的功能");
		return model;
	}
	
	
	/**
	 * 案例设计师相关案例的展示
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping(value = "designerMessage/p{page}", method = RequestMethod.GET)
	public ModelAndView designerMessage(@RequestParam("designerId") String designerId,@PathVariable("page") int page,
			HttpSession session,HttpServletResponse response) {
		ModelAndView model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		
//      获取首页LOGO
    	SysConfigExample sysConfigExampleLogo = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysLogo = sysConfigExampleLogo.createCriteria();
        csysLogo.andKeyNameEqualTo("scinter_home_logo");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csysLogo.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csysLogo.andBranchCompanyEqualTo(branchCompany);
		}
        SysConfig  homeLogo =  null;
        if(sysConfigMapper.selectByExample(sysConfigExampleLogo).size()>0){
        	
        	homeLogo= sysConfigMapper.selectByExample(sysConfigExampleLogo).get(0);
        }
        
//      获取首页底部二维码图片
    	SysConfigExample sysConfigExampleTwoCodeImg = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysTc = sysConfigExampleTwoCodeImg.createCriteria();
        csysTc.andKeyNameEqualTo("scinter_home_twoCodeImg");
        csysTc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csysTc.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csysTc.andBranchCompanyEqualTo(branchCompany);
		}
        SysConfig homeTc = null;
        if(sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).size()>0){
            homeTc= sysConfigMapper.selectByExample(sysConfigExampleTwoCodeImg).get(0);
        }
//      获取首页底部友情链接
    	SysConfigExample sysConfigExampleFriendlyLink = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysFlink = sysConfigExampleFriendlyLink.createCriteria();
        csysFlink.andKeyNameEqualTo("scinter_home_friendlyLink");
        csysFlink.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csysFlink.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csysFlink.andBranchCompanyEqualTo(branchCompany);
		}
        SysConfig homeLk = null;
        if( sysConfigMapper.selectByExample(sysConfigExampleFriendlyLink).size()>0){
        	
        	homeLk = sysConfigMapper.selectByExample(sysConfigExampleFriendlyLink).get(0);
        }
//      获取公司地址
    	SysConfigExample sysConfigExampleAddress = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysAddress= sysConfigExampleAddress.createCriteria();
        csysAddress.andKeyNameEqualTo("scinter_home_address");
        csysAddress.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csysAddress.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csysAddress.andBranchCompanyEqualTo(branchCompany);
		}
        SysConfig homeAdress =null;
        if(sysConfigMapper.selectByExample(sysConfigExampleAddress).size()>0){
        	 homeAdress = sysConfigMapper.selectByExample(sysConfigExampleAddress).get(0);
        }
//      获取公司电话
    	SysConfigExample sysConfigExampleTelePhone = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysTp= sysConfigExampleTelePhone.createCriteria();
        csysTp.andKeyNameEqualTo("scinter_home_telePhone");
        csysTp.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csysTp.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csysTp.andBranchCompanyEqualTo(branchCompany);
		}
        SysConfig homeTp =null;
        if(sysConfigMapper.selectByExample(sysConfigExampleTelePhone).size()>0){
        	
        	homeTp = sysConfigMapper.selectByExample(sysConfigExampleTelePhone).get(0);
        }
//      获取公司邮箱
    	SysConfigExample sysConfigExamplePost = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysPt= sysConfigExamplePost.createCriteria();
        csysPt.andKeyNameEqualTo("scinter_home_postBox");
        csysPt.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csysPt.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csysPt.andBranchCompanyEqualTo(branchCompany);
		}
        SysConfig homePost = null;
        if(sysConfigMapper.selectByExample(sysConfigExamplePost).size()>0){
        	
        	  homePost = sysConfigMapper.selectByExample(sysConfigExamplePost).get(0);
        }
//      获取公司传真
    	SysConfigExample sysConfigExamplePortraiture = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysPort= sysConfigExamplePortraiture.createCriteria();
        csysPort.andKeyNameEqualTo("scinter_home_portraiture");
        csysPort.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csysPort.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csysPort.andBranchCompanyEqualTo(branchCompany);
		}
        SysConfig homePort = null;
        if(sysConfigMapper.selectByExample(sysConfigExamplePortraiture).size()>0){
        	 homePort= sysConfigMapper.selectByExample(sysConfigExamplePortraiture).get(0);
        }
//		获取设计是的信息
		Designer designer = designerMapper.selectByPrimaryKey(Integer.valueOf(designerId));
		int rows = 8;//每页显示8条数据
		if(page<=0){
			page = 1;
		}
//		获取设计师对应的所有的案例
		CasesExample cs =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria = cs.createCriteria();
//		过滤案例图片为空的案例
		criteria.andCaseThumbImgNotEqualTo("");
//		非删除状态
		criteria.andCaseStatusNotEqualTo(3);
		criteria.andCaseStatusNotEqualTo(4);
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
			criteria.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			criteria.andBranchCompanyEqualTo(branchCompany);
		}
		criteria.andDesignerIdEqualTo(Integer.valueOf(designerId));
		int totalNums = caseMapper.countByExample(cs);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		cs.setPage(p);
//		排序	
		cs.setOrderByClause("create_time desc");
		List<Cases> caseList = caseMapper.selectByExample(cs);
//      获取百度商桥的信息
    	SysConfigExample sysConfigExampleShangqiao = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysSq= sysConfigExampleShangqiao.createCriteria();
        csysSq.andKeyNameEqualTo("scinter_home_shangQiao");
        csysSq.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csysSq.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csysSq.andBranchCompanyEqualTo(branchCompany);
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
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csystat.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csystat.andBranchCompanyEqualTo(branchCompany);
		}
        SysConfig statistics= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleStatistics).size()> 0){
        	
        	statistics = sysConfigMapper.selectByExample(sysConfigExampleStatistics).get(0);
        }
        model.addObject("statistics", statistics);
        session.setAttribute("statistics", statistics);
//      将信息保存到session中
        model.addObject("shangqiao", shangqiao);
        session.setAttribute("shangqiao", shangqiao);
		session.setAttribute("homeLogo",homeLogo );
        session.setAttribute("homePost",homePost );
        session.setAttribute("homeAdress",homeAdress );
        session.setAttribute("homeLk",homeLk );
        session.setAttribute("homeTp",homeTp );
        session.setAttribute("homePort",homePort );
        session.setAttribute("homeTc",homeTc );
		model.addObject("page", p);
		model.addObject("caseList", caseList);
		model.addObject("designer", designer);
		model.addObject("totalNums",totalNums);
		model.addObject("currentBCompany", branchCompany);
		model.setViewName("/www/casesDesigner");
		return model;
	}
	
	/**
	 * 案例的详情展示的方法
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping("casesDetail")
	public ModelAndView casesDetail(
			@RequestParam("casesId") String casesId,
			@RequestParam("designerId") String designerId,
			HttpSession session, HttpServletResponse response,HttpServletRequest request) {
		
		/*配置共有的信息*/
		super.getHomeMessage(request, session);
		ModelAndView  model = new ModelAndView();
		String branchCompany = (String) session.getAttribute("branchCompany");
		
		if(StringUtils.isBlank(branchCompany)){
			branchCompany = "bjsc";
		}
//		获取设计师的信息
		Designer designer = designerMapper.selectByPrimaryKey(Integer.valueOf(designerId));
//		获取当前点击的案例的信息
		Cases CurrentCase = caseMapper.selectByPrimaryKey(Integer.valueOf(casesId));
//		去除行政区域中的空值
		String area = CurrentCase.getCaseArea();
		
		String[] ss = area.split(",");
		List<String> newArea = new ArrayList<String>();
		for(String s:ss){
			if(!s.equals("null") && s.length()>0){
				
				newArea.add(s);
			}
		}
		area = newArea.toString().substring(1,newArea.toString().length()-1);
		CurrentCase.setCaseArea(area);
//		获取案例的详情图片
		CaseShowImageExample caseShowImageExample =new CaseShowImageExample();
		Criteria criteria = caseShowImageExample.createCriteria();
		criteria.andCaseIdEqualTo(Integer.valueOf(casesId));
		criteria.andImageUrlNotEqualTo("");
		criteria.andStatusNotEqualTo("3");
//		排序
		caseShowImageExample.setOrderByClause("update_time desc");
		List<CaseShowImage> caseShowImageList = caseImgMapper.selectByExample(caseShowImageExample);
		List<CaseShowImage> caseshowImages = new ArrayList<CaseShowImage>();
		for(CaseShowImage cases:caseShowImageList){
			if(cases.getImageUrl() != ""){
				cases.setImageUrl(cases.getImageUrl().substring(0,27)+"_logo"+CurrentCase.getCaseThumbImg().substring(27,31));
			}
			caseshowImages.add(cases);
		}
		// 依照风格进行查询
		CasesExample casesExample2 =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria2 = casesExample2.createCriteria();
		criteria2.andCaseStatusNotEqualTo(3);
		criteria2.andCaseStatusNotEqualTo(4);
	    criteria2.andBranchCompanyEqualTo(branchCompany);
		criteria2.andCaseStyleEqualTo(CurrentCase.getCaseStyle());
		// 排序
		casesExample2.setOrderByClause("update_time desc");
		List<Cases> caseStyleLists = caseMapper.selectByExample(casesExample2);
		List<Cases> caseStyleList = new ArrayList<Cases>();
		for(Cases cases: caseStyleLists){
			Designer designer2 = designerMapper.selectByPrimaryKey(cases.getDesignerId());
			// 防止 designer 为空的判断
			if(null != designer2){
				cases.setDesignerPhotoImg(designer2.getDesignerPhotoImg());					
			}
			caseStyleList.add(cases);
		}
		
		// 依照户型进行查询
		CasesExample casesExample3 =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria3 = casesExample3.createCriteria();
		criteria3.andCaseStatusNotEqualTo(3);
		criteria3.andCaseStatusNotEqualTo(4);
		criteria3.andBranchCompanyEqualTo(branchCompany);
		criteria3.andCaseHouseTypeEqualTo(CurrentCase.getCaseHouseType());
		// 排序
		casesExample3.setOrderByClause("update_time desc");
		List<Cases> caseHouseTypeList2 = caseMapper.selectByExample(casesExample3);
		List<Cases> caseHouseTypeList = new ArrayList<Cases>();
		for(Cases cases: caseHouseTypeList2){
			Designer designer3 = designerMapper.selectByPrimaryKey(cases.getDesignerId());
			// 防止 designer 为空的判断
			if(null != designer3){
				cases.setDesignerPhotoImg(designer3.getDesignerPhotoImg());			
			}
			caseHouseTypeList.add(cases);
		}
		model.addObject("currentBCompany", branchCompany);
		model.addObject("designer", designer);
		model.addObject("CurrentCase", CurrentCase);
		model.addObject("caseList", caseshowImages);
		model.addObject("caseStyleList", caseStyleList);
		model.addObject("caseHouseTypeList", caseHouseTypeList);
		model.setViewName("/www/caseDetail");
		return model;
	}
	
	/**
	 * 实现图片点击出现大量的案例图片的信息
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 */
	@RequestMapping("AllCaseImg")
	public ModelAndView AllCaseImg(@RequestParam("title") int title,HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();
		Cases cases = caseMapper.selectByPrimaryKey(title);
		model.addObject("caseInfo", cases);
		
		CaseShowImageExample csi = new CaseShowImageExample();
		Criteria criteria = csi.createCriteria();
		criteria.andCaseIdEqualTo(title);
		criteria.andStatusEqualTo("1");//状态1是 未删除的图片
		csi.setOrderByClause("create_time asc");//排序
		
		List<CaseShowImage> allCaseImage = caseImgMapper.selectByExample(csi);
		model.addObject("caseImgShowAll", allCaseImage);
		
		model.setViewName("/www/case1");
		return model;
		
	}
	
	/**
	 * 分条件查询
	 * @param page			当前的页码
	 * @param rows			页内容量
	 * @param response		用于动态响应客户端请示
	 * @throws IOException 
	 */
	@RequestMapping(value = "casesSelect/p{page}", method = RequestMethod.GET)

	public ModelAndView  caseMessage(@PathVariable("page") int page,
			HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
		ModelAndView model = new ModelAndView();
//		获取session 中的 BranchCompany
		String branchCompany	= (String) session.getAttribute("branchCompany");
		int rows = 20;//每页显示20条数据
		if(page<=0){
			page = 1;
		}
		
//		定义案例的查询条件
		CasesExample cs =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria = cs.createCriteria();
		criteria.andCaseStatusNotEqualTo(3);
		criteria.andCaseStatusNotEqualTo(4);
		int totalNums = caseMapper.countByExample(cs);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		cs.setPage(p);
//		排序	
		cs.setOrderByClause("case_id desc");
		List<Cases> caseList = caseMapper.selectByExample(cs);
		List<Cases> listCases = new ArrayList<Cases>(); 
		for(Cases cases: caseList){
			Designer designer = designerMapper.selectByPrimaryKey(cases.getDesignerId());
//		防止 designer 为空的判断
			if(null != designer){
				
				cases.setDesignerPhotoImg(designer.getDesignerPhotoImg());			
			}
			listCases.add(cases);
		}
		
//		新闻信息的获取
		NewsExample newsExample = new NewsExample();
		com.scinter.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
//		筛选非删除状态的新闻信息
		creNew.andStatusNotEqualTo(3);
//      获取分公司的信息
	    if(null != branchCompany && branchCompany.length()>0){
			
		 creNew.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			creNew.andBranchCompanyEqualTo(branchCompany);
		}
		List<News> listNews = newsMapper.selectByExample(newsExample);
//      获取百度商桥的信息
    	SysConfigExample sysConfigExampleShangqiao = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csysSq= sysConfigExampleShangqiao.createCriteria();
        csysSq.andKeyNameEqualTo("scinter_home_shangQiao");
        csysSq.andValueNotEqualTo("");
        
        SysConfig shangqiao= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleShangqiao).size()> 0){
        	
        	shangqiao = sysConfigMapper.selectByExample(sysConfigExampleShangqiao).get(0);
        }
//      获取百度统计的信息
    	SysConfigExample sysConfigExampleStatistics = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria csystat= sysConfigExampleStatistics.createCriteria();
        csystat.andKeyNameEqualTo("scinter_home_statistics");
        csystat.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany) && branchCompany.length()>0){
        	csystat.andBranchCompanyEqualTo(branchCompany);
		}else{
			branchCompany = "bjsc";
			csystat.andBranchCompanyEqualTo(branchCompany);
		}
        SysConfig statistics= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleStatistics).size()> 0){
        	
        	statistics = sysConfigMapper.selectByExample(sysConfigExampleStatistics).get(0);
        }
        model.addObject("statistics", statistics);
        session.setAttribute("statistics", statistics);
//      将信息保存到session中
        model.addObject("shangqiao", shangqiao);
        session.setAttribute("shangqiao", shangqiao);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("page", p);
		model.addObject("listCases", listCases);
		model.addObject("listNews", listNews);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/cases");
		logger.info("成功实现案例查询的功能");
		return model;

		
	}
	
		

	
}
