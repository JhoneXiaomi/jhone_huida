package com.rbw.www.controller;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rbw.base.controller.BaseController;
import com.rbw.www.dao.CaseShowImageMapper;
import com.rbw.www.dao.CasesMapper;
import com.rbw.www.dao.DesignerMapper;
import com.rbw.www.dao.NewsMapper;
import com.rbw.www.dao.SysConfigMapper;
import com.rbw.www.dao.SysLogMapper;
import com.rbw.www.model.CaseShowImage;
import com.rbw.www.model.CaseShowImageExample;
import com.rbw.www.model.CaseShowImageExample.Criteria;
import com.rbw.www.model.Cases;
import com.rbw.www.model.CasesExample;
import com.rbw.www.model.Designer;
import com.rbw.www.model.News;
import com.rbw.www.model.NewsExample;
import com.rbw.www.model.SysConfig;
import com.rbw.www.model.SysConfigExample;
import com.rbw.www.util.Page;

@Controller
public class CaseController extends BaseController{

	private Logger logger = Logger.getLogger(CaseController.class);

	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private CaseShowImageMapper caseImgMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	
	/**
	 * 瑞博文案例列表页
	 * @author JhoneZhang
	 * @date   2016年9月6日上午10:16:31
	 * @param caseStyle
	 * @param caseAcreage
	 * @param casesType
	 * @param page
	 * @param session
	 * @param request
	 * @param response
	 * @return
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
		String myBranchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(myBranchCompany))
			myBranchCompany = "sjzrbw1";
		
		// 将参数转码
		caseStyle = new String(caseStyle.getBytes("ISO-8859-1"),"utf-8");
		caseAcreage = new String(caseAcreage.getBytes("ISO-8859-1"),"utf-8");
		casesType = new String(casesType.getBytes("ISO-8859-1"),"utf-8");
		// 初始化参数
		if(StringUtils.isBlank(caseStyle))
			caseStyle = "全部";
		
		if(StringUtils.isBlank(caseAcreage))
			caseAcreage = "全部";
		
		if(StringUtils.isBlank(casesType))
			casesType = "全部";
		
		// 从session 中获取户型，风格，面积，组合查询
		String SessionCaseStyle = (String) session.getAttribute("caseStyle");
		String SessionCaseAcreage = (String) session.getAttribute("caseAcreage");
		String SessionCasesType = (String) session.getAttribute("casesType");
		// 将session中的值初始化
		if(StringUtils.isBlank(SessionCaseStyle))
			SessionCaseStyle = "全部";
		
		if(StringUtils.isBlank(SessionCasesType))
			SessionCasesType = "全部";
		
		if(StringUtils.isBlank(SessionCaseAcreage))
			SessionCaseAcreage = "全部";
		
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
		com.rbw.www.model.CasesExample.Criteria criteria = cs.createCriteria();
		// 图例为空的将不会显示
		criteria.andCaseThumbImgNotEqualTo("");
		// 非删除状态
		criteria.andCaseStatusEqualTo(1);
		criteria.andBranchCompanyEqualTo(myBranchCompany);
        // 添加分类查询条件
	    if(StringUtils.isNotBlank(SessionCaseStyle) && !SessionCaseStyle.equals("全部") )
			criteria.andCaseStyleEqualTo(SessionCaseStyle);
	    
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
    	    logger.info("begin:"+begin+"end"+m.group(1));
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
	    
	    if(StringUtils.isNotBlank(SessionCasesType) && !SessionCasesType.equals("全部") )
			criteria.andCaseHouseTypeEqualTo(SessionCasesType);
		int totalNums = caseMapper.countByExample(cs);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		cs.setPage(p);
		// 排序	
		cs.setOrderByClause("create_time desc");
		List<Cases> caseList = caseMapper.selectByExample(cs);
		List<Cases> listCases = new ArrayList<Cases>(); 
		for(Cases cases: caseList){
			Designer designer = designerMapper.selectByPrimaryKey(cases.getDesignerId());
			// 防止 designer 为空的判断
			if(null != designer){
				cases.setDesignerPhotoImg(designer.getDesignerPhotoImg());			
			}
			listCases.add(cases);
		}
		
		// 新闻信息的获取
		NewsExample newsExample = new NewsExample();
		com.rbw.www.model.NewsExample.Criteria creNew = newsExample.createCriteria();
		// 筛选非删除状态的新闻信息
		creNew.andStatusNotEqualTo(3);
		creNew.andBranchCompanyEqualTo(myBranchCompany);
		List<News> listNews = newsMapper.selectByExample(newsExample);
		
		/*获取案例列表页SEO 的配置信息*/
		
        // SEO 标题信息
        SysConfigExample rbwCasesSeoTitleStrE = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria rbwCasesSeoTitleStrC = rbwCasesSeoTitleStrE.createCriteria();
        rbwCasesSeoTitleStrC.andKeyNameEqualTo("scinter_cases_seoTitle_str");
        rbwCasesSeoTitleStrC.andValueNotEqualTo("");
		rbwCasesSeoTitleStrC.andBranchCompanyEqualTo(myBranchCompany);
	    SysConfig rbwCasesSeoTitleStr= null;
	    if(sysConfigMapper.selectByExample(rbwCasesSeoTitleStrE).size()> 0)
	    	  rbwCasesSeoTitleStr = sysConfigMapper.selectByExample(rbwCasesSeoTitleStrE).get(0);
	    
        // SEO 关键字信息 
        SysConfigExample rbwCasesSeoKeywordStrE = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria rbwCasesSeoKeywordStrC = rbwCasesSeoKeywordStrE.createCriteria();
        rbwCasesSeoKeywordStrC.andKeyNameEqualTo("scinter_cases_seoKeyword_str");
        rbwCasesSeoKeywordStrC.andValueNotEqualTo("");
		rbwCasesSeoKeywordStrC.andBranchCompanyEqualTo(myBranchCompany);
        SysConfig rbwCasesSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(rbwCasesSeoKeywordStrE).size()> 0)
    	   rbwCasesSeoKeywordStr = sysConfigMapper.selectByExample(rbwCasesSeoKeywordStrE).get(0);
        
        // SEO 描述信息
        SysConfigExample rbwCasesSeoDescStrE = new SysConfigExample();
        com.rbw.www.model.SysConfigExample.Criteria rbwCasesSeoDescStrC = rbwCasesSeoDescStrE.createCriteria();
        rbwCasesSeoDescStrC.andKeyNameEqualTo("scinter_cases_seoDesc_str");
        rbwCasesSeoDescStrC.andValueNotEqualTo("");
		rbwCasesSeoDescStrC.andBranchCompanyEqualTo(myBranchCompany);
	    SysConfig rbwCasesSeoDescStr= null;
	    if(sysConfigMapper.selectByExample(rbwCasesSeoDescStrE).size()> 0)
	    	  rbwCasesSeoDescStr = sysConfigMapper.selectByExample(rbwCasesSeoDescStrE).get(0);
	    
	    model.addObject("rbwCasesSeoTitleStr", rbwCasesSeoTitleStr);
	    model.addObject("rbwCasesSeoKeywordStr", rbwCasesSeoKeywordStr);
	    model.addObject("rbwCasesSeoDescStr", rbwCasesSeoDescStr);  
		model.addObject("currentBCompany", myBranchCompany);
		model.addObject("branchCompany", myBranchCompany);
		model.addObject("page", p);
		model.addObject("listCases", listCases);
		model.addObject("listNews", listNews);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/cases");
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
		String myBranchCompany	= (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(myBranchCompany))
			myBranchCompany = "sjzrbw1";
		
		// 获取设计师的信息
		Designer designer = designerMapper.selectByPrimaryKey(Integer.valueOf(designerId));
		// 获取当前点击的案例的信息
		Cases CurrentCase = caseMapper.selectByPrimaryKey(Integer.valueOf(casesId));
		// 去除行政区域中的空值
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
		// 获取案例的详情图片
		CaseShowImageExample caseShowImageExample =new CaseShowImageExample();
		Criteria criteria = caseShowImageExample.createCriteria();
		criteria.andCaseIdEqualTo(Integer.valueOf(casesId));
		criteria.andImageUrlNotEqualTo("");
		criteria.andStatusNotEqualTo("3");
		// 排序
		caseShowImageExample.setOrderByClause("create_time desc");
		List<CaseShowImage> caseShowImageList = caseImgMapper.selectByExample(caseShowImageExample);
		List<CaseShowImage> caseshowImages = new ArrayList<CaseShowImage>();
		for(CaseShowImage cases:caseShowImageList){
			
			if(StringUtils.isNotBlank(cases.getImageUrl()))
				cases.setImageUrl(cases.getImageUrl().substring(0,27)+"_logo"+CurrentCase.getCaseThumbImg().substring(27,31));
			
			caseshowImages.add(cases);
		}
		// 相关案例
		CasesExample casesExample2 =new CasesExample();
		com.rbw.www.model.CasesExample.Criteria criteria2 = casesExample2.createCriteria();
		criteria2.andCaseStatusEqualTo(1);
		criteria2.andBranchCompanyEqualTo(myBranchCompany);
		// 排序
		casesExample2.setOrderByClause("update_time desc");
		List<Cases> casesLists = caseMapper.selectByExample(casesExample2);
		List<Cases> casesList = new ArrayList<Cases>();
		for(Cases cases: casesLists){
			Designer designer2 = designerMapper.selectByPrimaryKey(cases.getDesignerId());
           // 防止 designer 为空的判断
			if(null != designer2)
				cases.setDesignerPhotoImg(designer2.getDesignerPhotoImg());
			
			casesList.add(cases);
		}
	
		model.addObject("currentBCompany", myBranchCompany);
		model.addObject("branchCompany", myBranchCompany);
		model.addObject("designer", designer);
		model.addObject("CurrentCase", CurrentCase);
		model.addObject("caseList", caseshowImages);
		model.addObject("casesList", casesList);
		model.setViewName("/www/caseDetail");
		return model;
	}
	
}
