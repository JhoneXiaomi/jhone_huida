package com.scinter.www.controller;
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

import com.scinter.base.baseController.BaseController;
import com.scinter.www.dao.CaseShowImageMapper;
import com.scinter.www.dao.CasesMapper;
import com.scinter.www.dao.DesignerMapper;
import com.scinter.www.dao.NewsMapper;
import com.scinter.www.dao.OrderInfoMapper;
import com.scinter.www.dao.SysConfigMapper;
import com.scinter.www.dao.SysLogMapper;
import com.scinter.www.model.CaseShowImage;
import com.scinter.www.model.CaseShowImageExample;
import com.scinter.www.model.CaseShowImageExample.Criteria;
import com.scinter.www.model.Cases;
import com.scinter.www.model.CasesExample;
import com.scinter.www.model.Designer;
import com.scinter.www.model.DesignerExample;
import com.scinter.www.model.OrderInfoExample;
import com.scinter.www.model.SysConfig;
import com.scinter.www.model.SysConfigExample;
import com.scinter.www.util.Page;

@Controller
public class CaseController extends BaseController{

	private Logger logger = Logger.getLogger(CaseController.class);

	@Autowired
	private CasesMapper caseMapper;
	@Autowired
	private CaseShowImageMapper caseShowImageMapper;
	@Autowired
	private SysLogMapper sysLogMapper;
	@Autowired
	private DesignerMapper designerMapper;
	@Autowired
	private CaseShowImageMapper caseImgMapper;//案例包含图片的dao操作对象
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private SysConfigMapper sysConfigMapper;
	@Autowired
	private OrderInfoMapper orderInfoMapper;
	
	
	
	/**
	 * 案例的列表页信息显示
	 * @author JhoneZhang
	 * @date   2016年8月24日下午3:21:23
	 * @param caseStyle						案例风格
	 * @param caseAcreage					案例面积
	 * @param casesType						案例户型
	 * @param page
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "cases/p{page}")
	public ModelAndView caseMessage(
			@RequestParam(value="communityId",required=false)String communityId,
			@RequestParam(value="key",required=false)String key,
			@RequestParam(value="caseStyle",required=false,defaultValue="") String caseStyle,
			@RequestParam(value="caseAcreage",required=false,defaultValue="") String caseAcreage,
			@RequestParam(value="casesType",required=false,defaultValue="") String casesType,
			@PathVariable("page") int page,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		ModelAndView model = new ModelAndView();
		// 获取公共信息
		super.getPublicMes(session);
		String branchCompany = (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany = "bjxz";
		}
		if(StringUtils.isNotBlank(key))
			key = new String(key.getBytes("ISO-8859-1"),"utf-8"); 
		// 将参数转码
		caseStyle = new String(caseStyle.getBytes("ISO-8859-1"),"utf-8");
		caseAcreage = new String(caseAcreage.getBytes("ISO-8859-1"),"utf-8");
		casesType = new String(casesType.getBytes("ISO-8859-1"),"utf-8");
		// 初始化参数
		if(StringUtils.isBlank(caseStyle)){
			caseStyle = "全部";
		}
		if(StringUtils.isBlank(caseAcreage)){
			caseAcreage = "全部";
		}
		if(StringUtils.isBlank(casesType)){
			casesType = "全部";
		}
		// 从session 中获取户型，风格，面积，组合查询
		String SessionCaseStyle = (String) session.getAttribute("caseStyle");
		String SessionCaseAcreage = (String) session.getAttribute("caseAcreage");
		String SessionCasesType = (String) session.getAttribute("casesType");
		// 将session中的值初始化
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
		int rows = 12;//每页显示12条数据
		if(page<=0){
			page = 1;
		}
		CasesExample cs =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria criteria = cs.createCriteria();
		// 图例为空的将不会显示
		criteria.andCaseThumbImgNotEqualTo("");
		// 非删除状态
		criteria.andCaseStatusEqualTo(1);
		criteria.andBranchCompanyEqualTo(branchCompany);
	    // 添加分类查询条件
	    if(StringUtils.isNotBlank(SessionCaseStyle) && !SessionCaseStyle.equals("全部") ){
			criteria.andCaseStyleEqualTo(SessionCaseStyle);
		}
	    if(StringUtils.isNotBlank(SessionCaseAcreage) && !SessionCaseAcreage.equals("全部")
	    		&& !SessionCaseAcreage.equals("其他") && !SessionCaseAcreage.equals("100㎡以外")&& !SessionCaseAcreage.equals("40㎡以内")){
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
		}else if(SessionCaseAcreage.equals("100㎡以外")){
			 Pattern p = Pattern.compile("(\\d+)");  
    	     Matcher m = p.matcher(SessionCaseAcreage);      
    	     if(m.find()){
    	       logger.info(m.group(1));   
    	     } 
			criteria.andCaseAcreageGreaterThanOrEqualTo(Double.valueOf(m.group(1)));
		}else if(SessionCaseAcreage.equals("40㎡以内")){
			 Pattern p = Pattern.compile("(\\d+)");  
    	     Matcher m = p.matcher(SessionCaseAcreage);      
    	     if(m.find()){
    	       logger.info(m.group(1));   
    	     } 
			criteria.andCaseAcreageLessThanOrEqualTo(Double.valueOf(m.group(1)));
		}
	    if(StringUtils.isNotBlank(SessionCasesType) && !SessionCasesType.equals("全部") ){
			
			criteria.andCaseHouseTypeEqualTo(SessionCasesType);
		}
	    if(StringUtils.isNotBlank(key))
	    	criteria.andCaseTitleLike("%"+key+"%");
	    if(StringUtils.isNotBlank(communityId))
	    	criteria.andCommunityIdEqualTo(Integer.valueOf(communityId));
		int totalNums = caseMapper.countByExample(cs);
		Page p = new Page((page - 1) * rows, rows);
		p.setTotalRecords(totalNums);
		cs.setPage(p);
		// 排序	
		cs.setOrderByClause("create_time desc");
		List<Cases>  CasesList = caseMapper.selectByExample(cs);
		List<Cases> listCases = new ArrayList<Cases>();
		
        for(Cases cases:CasesList){
        	
        	CaseShowImageExample ce = new CaseShowImageExample();
        	Criteria cc = ce.createCriteria();
        	cc.andCaseIdEqualTo(cases.getCaseId());
        	Designer designer = designerMapper.selectByPrimaryKey(cases.getDesignerId());
        	cases.setCaseThumbNumber(caseShowImageMapper.countByExample(ce));
        	cases.setDesignerPhoto(designer.getDesignerPhotoImg());
        	cases.setDesignerName(designer.getDesignerName());
        	listCases.add(cases);
        }
        
		/*获取SEO 的配置信息*/
        // SEO 标题信息
        SysConfigExample sysConfigExampleScinterHomeSeoTitle = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoTitle = sysConfigExampleScinterHomeSeoTitle.createCriteria();
        criteriaScinterHomeSeoTitle.andKeyNameEqualTo("scinter_cases_seoTitle_str");
        criteriaScinterHomeSeoTitle.andValueNotEqualTo("");
  		criteriaScinterHomeSeoTitle.andBranchCompanyEqualTo(branchCompany);
        SysConfig casesSeoTitleStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).size()> 0){
        	casesSeoTitleStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoTitle).get(0);
        }
        
        // SEO 关键字信息
        SysConfigExample sysConfigExampleScinterhomeSeoKeyword = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterhomeSeoKeyword = sysConfigExampleScinterhomeSeoKeyword.createCriteria();
        criteriaScinterhomeSeoKeyword.andKeyNameEqualTo("scinter_cases_seoKeyword_str");
        criteriaScinterhomeSeoKeyword.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterhomeSeoKeyword.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig casesSeoKeywordStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).size()> 0){
        	casesSeoKeywordStr = sysConfigMapper.selectByExample(sysConfigExampleScinterhomeSeoKeyword).get(0);
        }
        
        // SEO 描述信息
        SysConfigExample sysConfigExampleScinterHomeSeoDesc = new SysConfigExample();
        com.scinter.www.model.SysConfigExample.Criteria criteriaScinterHomeSeoDesc = sysConfigExampleScinterHomeSeoDesc.createCriteria();
        criteriaScinterHomeSeoDesc.andKeyNameEqualTo("scinter_cases_seoDesc_str");
        criteriaScinterHomeSeoDesc.andValueNotEqualTo("");
        if(StringUtils.isNotBlank(branchCompany)){
      	  criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}else{
  			branchCompany = "bjxz";
  			criteriaScinterHomeSeoDesc.andBranchCompanyEqualTo(branchCompany);
  		}
        SysConfig casesSeoDescStr= null;
        if(sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).size()> 0){
        	
        	casesSeoDescStr = sysConfigMapper.selectByExample(sysConfigExampleScinterHomeSeoDesc).get(0);
        }
        
    	// 获取设计师列表
		DesignerExample de = new DesignerExample();
		com.scinter.www.model.DesignerExample.Criteria dc = de.createCriteria();
		dc.andBranchCompanyEqualTo(branchCompany);
		dc.andDesignerNameNotEqualTo("");
		List<Designer> ds = designerMapper.selectByExample(de);
		
        session.setAttribute("casesSeoTitleStr", casesSeoTitleStr);
        session.setAttribute("casesSeoKeywordStr", casesSeoKeywordStr);
        session.setAttribute("casesSeoDescStr", casesSeoDescStr);
        model.addObject("designerList",ds);
        model.addObject("casesSeoTitleStr", casesSeoTitleStr);
        model.addObject("casesSeoKeywordStr", casesSeoKeywordStr);
        model.addObject("casesSeoDescStr", casesSeoDescStr);
		model.addObject("currentBCompany", branchCompany);
		model.addObject("page", p);
		model.addObject("listCases", listCases);
		model.addObject("totalNums",totalNums);
		model.setViewName("/www/case");
		return model;
	}
	

	/**
	 * 案例的详情页展示
	 * @author JhoneZhang
	 * @date   2016年8月22日下午4:40:12
	 * @param casesId
	 * @param designerId
	 * @param session
	 * @param response							用于动态响应客户端请示
	 * @return
	 */
	@RequestMapping("casesDetail")
	public ModelAndView casesDetail(@RequestParam("casesId") Integer casesId,@RequestParam("designerId") String designerId,
			HttpSession session, HttpServletResponse response) {
		
		// 获取公共信息
		super.getPublicMes(session);
		ModelAndView  model = new ModelAndView();
		String branchCompany	= (String) session.getAttribute("branchCompany");
		if(StringUtils.isBlank(branchCompany)){
			branchCompany = "bjxz";
		}
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
		criteria.andStatusEqualTo("1");
		caseShowImageExample.setOrderByClause("create_time desc");
		List<CaseShowImage> caseShowImageList = caseImgMapper.selectByExample(caseShowImageExample);
		List<CaseShowImage> caseshowImages = new ArrayList<CaseShowImage>();
		for(CaseShowImage cases:caseShowImageList){
			if(cases.getImageUrl() != ""){
				cases.setImageUrl(cases.getImageUrl().substring(0,27)+"_logo"+CurrentCase.getCaseThumbImg().substring(27,31));
			}
			caseshowImages.add(cases);
		}
		
		// search the cases of current case style 
		CasesExample co =new CasesExample();
		com.scinter.www.model.CasesExample.Criteria cco = co.createCriteria();
		cco.andCaseStatusEqualTo(1);
		cco.andBranchCompanyEqualTo(branchCompany);
		cco.andCaseStyleEqualTo(CurrentCase.getCaseStyle());
		// 排序
		co.setOrderByClause("create_time desc");
		List<Cases> listCases = caseMapper.selectByExample(co);
		List<Cases> casesAll = new ArrayList<Cases>();
		
        for(Cases cases:listCases){
        	
        	Designer d = designerMapper.selectByPrimaryKey(cases.getDesignerId());
        	cases.setDesignerPhoto(d.getDesignerPhotoImg());
        	cases.setDesignerName(d.getDesignerName());
        	casesAll.add(cases);
        }
		
		// 获取订单总数
		OrderInfoExample oe = new OrderInfoExample();
		com.scinter.www.model.OrderInfoExample.Criteria oc =  oe.createCriteria();
		oc.andStatusEqualTo(1);
		oc.andBranchCompanyEqualTo(branchCompany);
		Integer orderNumber = orderInfoMapper.countByExample(oe);
		
		model.addObject("orderNumber", orderNumber);
		model.addObject("designer", designer);
		model.addObject("currentCase", CurrentCase);
		model.addObject("caseList", caseshowImages);
		model.addObject("casesAll", casesAll);
		model.setViewName("/www/caseDetail");
		return model;
	}
}
